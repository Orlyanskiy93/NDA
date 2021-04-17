//
//  UIButton+Kingfisher.swift
//  Kingfisher
//
//  Created by Wei Wang on 15/4/13.
//
//  Copyright (c) 2019 Wei Wang <onevcat@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#if !os(watchOS)

#if canImport(UIKit)
import UIKit

extension KingfisherWrapper where Base: UIButton {

    // MARK: Setting Image
    /// Sets an image to the button for a specified state with a source.
    ///
    /// - Parameters:
    ///   - source: The `Source` object contains information about the image.
    ///   - state: The button state to which the image should be set.
    ///   - placeholder: A placeholder to show while retrieving the image from the given `resource`.
    ///   - options: An options set to define image setting behaviors. See `KingfisherOptionsInfo` for more.
    ///   - progressBlock: Called when the image downloading progress gets updated. If the response does not contain an
    ///                    `expectedContentLength`, this block will not be called.
    ///   - completionHandler: Called when the image retrieved and set finished.
    /// - Returns: A task represents the image downloading.
    ///
    /// - Note:
    /// Internally, this method will use `KingfisherManager` to get the requested source, from either cache
    /// or network. Since this method will perform UI changes, you must call it from the main thread.
    /// Both `progressBlock` and `completionHandler` will be also executed in the main thread.
    ///
    @discardableResult
    public func setImage(
        with source: Source?,
        for stage: UIControl.State,
        placeholder: UIImage? = nil,
        options: KingfisherOptionsInfo? = nil,
        progressBlock: DownloadProgressBlock? = nil,
        completionHandler: ((Result<RetrieveImageResult, KingfisherError>) -> Void)? = nil) -> DownloadTask?
    {
        let options = KingfisherParsedOptionsInfo(KingfisherManager.shared.defaultOptions + (options ?? .empty))
        return setImage(
            with: source,
            for: stage,
            placeholder: placeholder,
            parsedOptions: options,
            progressBlock: progressBlock,
            completionHandler: completionHandler
        )
    }
    
    /// Sets an image to the button for a specified state with a requested resource.
    ///
    /// - Parameters:
    ///   - resource: The `Resource` object contains information about the resource.
    ///   - state: The button state to which the image should be set.
    ///   - placeholder: A placeholder to show while retrieving the image from the given `resource`.
    ///   - options: An options set to define image setting behaviors. See `KingfisherOptionsInfo` for more.
    ///   - progressBlock: Called when the image downloading progress gets updated. If the response does not contain an
    ///                    `expectedContentLength`, this block will not be called.
    ///   - completionHandler: Called when the image retrieved and set finished.
    /// - Returns: A task represents the image downloading.
    ///
    /// - Note:
    /// Internally, this method will use `KingfisherManager` to get the requested resource, from either cache
    /// or network. Since this method will perform UI changes, you must call it from the main thread.
    /// Both `progressBlock` and `completionHandler` will be also executed in the main thread.
    ///
    @discardableResult
    public func setImage(
        with resource: Resource?,
        for stage: UIControl.State,
        placeholder: UIImage? = nil,
        options: KingfisherOptionsInfo? = nil,
        progressBlock: DownloadProgressBlock? = nil,
        completionHandler: ((Result<RetrieveImageResult, KingfisherError>) -> Void)? = nil) -> DownloadTask?
    {
        return setImage(
            with: resource?.convertToSource(),
            for: stage,
            placeholder: placeholder,
            options: options,
            progressBlock: progressBlock,
            completionHandler: completionHandler)
    }

    @discardableResult
    public func setImage(
        with source: Source?,
        for stage: UIControl.State,
        placeholder: UIImage? = nil,
        parsedOptions: KingfisherParsedOptionsInfo,
        progressBlock: DownloadProgressBlock? = nil,
        completionHandler: ((Result<RetrieveImageResult, KingfisherError>) -> Void)? = nil) -> DownloadTask?
    {
        guard let source = source else {
            base.setImage(placeholder, for: stage)
            setTaskIdentifier(nil, for: stage)
            completionHandler?(.failure(KingfisherError.imageSettingError(reason: .emptySource)))
            return nil
        }

        var options = parsedOptions
        if !options.keepCurrentImageWhileLoading {
            base.setImage(placeholder, for: stage)
        }

        var mutatingSelf = self
        let issuedIdentifier = Source.Identifier.next()
        setTaskIdentifier(issuedIdentifier, for: stage)

        if let block = progressBlock {
            options.onDataReceived = (options.onDataReceived ?? []) + [ImageLoadingProgressSideEffect(block)]
        }

        if let provider = ImageProgressiveProvider(options, refresh: { image in
            self.base.setImage(image, for: stage)
        }) {
            options.onDataReceived = (options.onDataReceived ?? []) + [provider]
        }

        options.onDataReceived?.forEach {
            $0.onShouldApply = { issuedIdentifier == self.taskIdentifier(for: stage) }
        }

        let task = KingfisherManager.shared.retrieveImage(
            with: source,
            options: options,
            downloadTaskUpdated: { mutatingSelf.imageTask = $0 },
            completionHandler: { result in
                CallbackQueue.mainCurrentOrAsync.execute {
                    guard issuedIdentifier == self.taskIdentifier(for: stage) else {
                        let reason: KingfisherError.ImageSettingErrorReason
                        do {
                            let value = try result.get()
                            reason = .notCurrentSourceTask(result: value, error: nil, source: source)
                        } catch {
                            reason = .notCurrentSourceTask(result: nil, error: error, source: source)
                        }
                        let error = KingfisherError.imageSettingError(reason: reason)
                        completionHandler?(.failure(error))
                        return
                    }

                    mutatingSelf.imageTask = nil
                    mutatingSelf.setTaskIdentifier(nil, for: stage)

                    switch result {
                    case .success(let value):
                        self.base.setImage(value.image, for: stage)
                        completionHandler?(result)

                    case .failure:
                        if let image = options.onFailureImage {
                            self.base.setImage(image, for: stage)
                        }
                        completionHandler?(result)
                    }
                }
            }
        )

        mutatingSelf.imageTask = task
        return task
    }

    // MARK: Cancelling Downloading Task
    
    /// Cancels the image download task of the button if it is running.
    /// Nothing will happen if the downloading has already finished.
    public func cancelImageDownloadTask() {
        imageTask?.cancel()
    }

    // MARK: Setting Background Image

    /// Sets a background image to the button for a specified state with a source.
    ///
    /// - Parameters:
    ///   - source: The `Source` object contains information about the image.
    ///   - state: The button state to which the image should be set.
    ///   - placeholder: A placeholder to show while retrieving the image from the given `resource`.
    ///   - options: An options set to define image setting behaviors. See `KingfisherOptionsInfo` for more.
    ///   - progressBlock: Called when the image downloading progress gets updated. If the response does not contain an
    ///                    `expectedContentLength`, this block will not be called.
    ///   - completionHandler: Called when the image retrieved and set finished.
    /// - Returns: A task represents the image downloading.
    ///
    /// - Note:
    /// Internally, this method will use `KingfisherManager` to get the requested source
    /// Since this method will perform UI changes, you must call it from the main thread.
    /// Both `progressBlock` and `completionHandler` will be also executed in the main thread.
    ///
    @discardableResult
    public func setBackgroundImage(
        with source: Source?,
        for stage: UIControl.State,
        placeholder: UIImage? = nil,
        options: KingfisherOptionsInfo? = nil,
        progressBlock: DownloadProgressBlock? = nil,
        completionHandler: ((Result<RetrieveImageResult, KingfisherError>) -> Void)? = nil) -> DownloadTask?
    {
        let options = KingfisherParsedOptionsInfo(KingfisherManager.shared.defaultOptions + (options ?? .empty))
        return setBackgroundImage(
            with: source,
            for: stage,
            placeholder: placeholder,
            parsedOptions: options,
            progressBlock: progressBlock,
            completionHandler: completionHandler
        )
    }

    /// Sets a background image to the button for a specified state with a requested resource.
    ///
    /// - Parameters:
    ///   - resource: The `Resource` object contains information about the resource.
    ///   - state: The button state to which the image should be set.
    ///   - placeholder: A placeholder to show while retrieving the image from the given `resource`.
    ///   - options: An options set to define image setting behaviors. See `KingfisherOptionsInfo` for more.
    ///   - progressBlock: Called when the image downloading progress gets updated. If the response does not contain an
    ///                    `expectedContentLength`, this block will not be called.
    ///   - completionHandler: Called when the image retrieved and set finished.
    /// - Returns: A task represents the image downloading.
    ///
    /// - Note:
    /// Internally, this method will use `KingfisherManager` to get the requested resource, from either cache
    /// or network. Since this method will perform UI changes, you must call it from the main thread.
    /// Both `progressBlock` and `completionHandler` will be also executed in the main thread.
    ///
    @discardableResult
    public func setBackgroundImage(
        with resource: Resource?,
        for stage: UIControl.State,
        placeholder: UIImage? = nil,
        options: KingfisherOptionsInfo? = nil,
        progressBlock: DownloadProgressBlock? = nil,
        completionHandler: ((Result<RetrieveImageResult, KingfisherError>) -> Void)? = nil) -> DownloadTask?
    {
        return setBackgroundImage(
            with: resource?.convertToSource(),
            for: stage,
            placeholder: placeholder,
            options: options,
            progressBlock: progressBlock,
            completionHandler: completionHandler)
    }

    func setBackgroundImage(
        with source: Source?,
        for stage: UIControl.State,
        placeholder: UIImage? = nil,
        parsedOptions: KingfisherParsedOptionsInfo,
        progressBlock: DownloadProgressBlock? = nil,
        completionHandler: ((Result<RetrieveImageResult, KingfisherError>) -> Void)? = nil) -> DownloadTask?
    {
        guard let source = source else {
            base.setBackgroundImage(placeholder, for: stage)
            setBackgroundTaskIdentifier(nil, for: stage)
            completionHandler?(.failure(KingfisherError.imageSettingError(reason: .emptySource)))
            return nil
        }

        var options = parsedOptions
        if !options.keepCurrentImageWhileLoading {
            base.setBackgroundImage(placeholder, for: stage)
        }

        var mutatingSelf = self
        let issuedIdentifier = Source.Identifier.next()
        setBackgroundTaskIdentifier(issuedIdentifier, for: stage)

        if let block = progressBlock {
            options.onDataReceived = (options.onDataReceived ?? []) + [ImageLoadingProgressSideEffect(block)]
        }

        if let provider = ImageProgressiveProvider(options, refresh: { image in
            self.base.setBackgroundImage(image, for: stage)
        }) {
            options.onDataReceived = (options.onDataReceived ?? []) + [provider]
        }

        options.onDataReceived?.forEach {
            $0.onShouldApply = { issuedIdentifier == self.backgroundTaskIdentifier(for: stage) }
        }

        let task = KingfisherManager.shared.retrieveImage(
            with: source,
            options: options,
            downloadTaskUpdated: { mutatingSelf.backgroundImageTask = $0 },
            completionHandler: { result in
                CallbackQueue.mainCurrentOrAsync.execute {
                    guard issuedIdentifier == self.backgroundTaskIdentifier(for: stage) else {
                        let reason: KingfisherError.ImageSettingErrorReason
                        do {
                            let value = try result.get()
                            reason = .notCurrentSourceTask(result: value, error: nil, source: source)
                        } catch {
                            reason = .notCurrentSourceTask(result: nil, error: error, source: source)
                        }
                        let error = KingfisherError.imageSettingError(reason: reason)
                        completionHandler?(.failure(error))
                        return
                    }

                    mutatingSelf.backgroundImageTask = nil
                    mutatingSelf.setBackgroundTaskIdentifier(nil, for: stage)

                    switch result {
                    case .success(let value):
                        self.base.setBackgroundImage(value.image, for: stage)
                        completionHandler?(result)

                    case .failure:
                        if let image = options.onFailureImage {
                            self.base.setBackgroundImage(image, for: stage)
                        }
                        completionHandler?(result)
                    }
                }
            }
        )

        mutatingSelf.backgroundImageTask = task
        return task
    }

    // MARK: Cancelling Background Downloading Task
    
    /// Cancels the background image download task of the button if it is running.
    /// Nothing will happen if the downloading has already finished.
    public func cancelBackgroundImageDownloadTask() {
        backgroundImageTask?.cancel()
    }
}

// MARK: - Associated Object
private var taskIdentifierKey: Void?
private var imageTaskKey: Void?

// MARK: Properties
extension KingfisherWrapper where Base: UIButton {

    private typealias TaskIdentifier = Box<[UInt: Source.Identifier.Value]>
    
    public func taskIdentifier(for stage: UIControl.State) -> Source.Identifier.Value? {
        return taskIdentifierInfo.value[stage.rawValue]
    }

    private func setTaskIdentifier(_ identifier: Source.Identifier.Value?, for stage: UIControl.State) {
        taskIdentifierInfo.value[stage.rawValue] = identifier
    }
    
    private var taskIdentifierInfo: TaskIdentifier {
        return  getAssociatedObject(base, &taskIdentifierKey) ?? {
            setRetainedAssociatedObject(base, &taskIdentifierKey, $0)
            return $0
        } (TaskIdentifier([:]))
    }
    
    private var imageTask: DownloadTask? {
        get { return getAssociatedObject(base, &imageTaskKey) }
        set { setRetainedAssociatedObject(base, &imageTaskKey, newValue)}
    }
}


private var backgroundTaskIdentifierKey: Void?
private var backgroundImageTaskKey: Void?

// MARK: Background Properties
extension KingfisherWrapper where Base: UIButton {
    
    public func backgroundTaskIdentifier(for stage: UIControl.State) -> Source.Identifier.Value? {
        return backgroundTaskIdentifierInfo.value[stage.rawValue]
    }
    
    private func setBackgroundTaskIdentifier(_ identifier: Source.Identifier.Value?, for stage: UIControl.State) {
        backgroundTaskIdentifierInfo.value[stage.rawValue] = identifier
    }
    
    private var backgroundTaskIdentifierInfo: TaskIdentifier {
        return  getAssociatedObject(base, &backgroundTaskIdentifierKey) ?? {
            setRetainedAssociatedObject(base, &backgroundTaskIdentifierKey, $0)
            return $0
        } (TaskIdentifier([:]))
    }
    
    private var backgroundImageTask: DownloadTask? {
        get { return getAssociatedObject(base, &backgroundImageTaskKey) }
        mutating set { setRetainedAssociatedObject(base, &backgroundImageTaskKey, newValue) }
    }
}
#endif

#endif
