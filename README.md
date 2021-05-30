# Neuro Degenerative Cognitive Assessment App
Приложение представляет собой опрос, состоящий из трёх частей, после прохождения прохождения которых расчитываются баллы. Необходимо пройти три части, чтобы расчитать отклонение, на осовании которого можно следить за изменениями в работе головного мозга.
Приложение локализировано на два языка.

Архитектура: VIPER

Стек: Foundation, UIKit, CoreData, LocalNotifications

Pods: Alamofire, ObjectMapper, PromiseKit, ViperMcFlurry, Charts, SwiftLint, IQKeyboardManager, CVSFormatter

## Первая часть: Самоэффективность

* Отвечаем на вопросы, используя шкалу от 0 до 10
* Можно возвращаться на пройденные вопросы, чтобы изменить ответ

![Simulator Screen Shot - iPhone 8 Plus - 2021-05-30 at 18 58 26](https://user-images.githubusercontent.com/54894715/120111479-ccbc5e80-c17a-11eb-868c-2b692ac55971.png)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
![Simulator Screen Recording - iPhone 8 Plus - 2021-05-30 at 18 59 32](https://user-images.githubusercontent.com/54894715/120113182-fcbb3000-c181-11eb-9445-ae527a2c3c73.gif)

## Часть 2: Краткий ответ
* Вопросы двух типов: арифметические и на соответствие 
* При подсчете баллов учитывается правильность ответа и время выполнения
* Возвращаться на пройденные вопросы нельзя т.к. учитывается время ответа

![Simulator Screen Shot - iPhone 8 Plus - 2021-05-30 at 19 52 42](https://user-images.githubusercontent.com/54894715/120113037-52430d00-c181-11eb-91db-f9d2dbaac1b7.png)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
![Simulator Screen Recording - iPhone 8 Plus - 2021-05-30 at 19 55 24](https://user-images.githubusercontent.com/54894715/120113061-6c7ceb00-c181-11eb-9824-a4917270e1dd.gif)


## Часть 3: Развернутый ответ
* Представлен один вопрос, на который необходимо ответить максимально развернуто. 
* На осонове ответа будет получен ["gunning fog index"](https://en.wikipedia.org/wiki/Gunning_fog_index), на основании которого расчитываются баллы.


![Simulator Screen Recording - iPhone 8 Plus - 2021-05-30 at 20 29 31](https://user-images.githubusercontent.com/54894715/120114034-f3cc5d80-c185-11eb-8911-734e7b7ce60a.gif)

## Результаты
* После завершения, по меньшей мере три опроса, на главном экране будет показан статус по итогам прохождения


![Simulator Screen Shot - iPhone 8 Plus - 2021-05-30 at 21 13 53](https://user-images.githubusercontent.com/54894715/120115506-a2739c80-c18c-11eb-8040-ce0b505de1f8.png)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
![Simulator Screen Shot - iPhone 8 Plus - 2021-05-30 at 21 20 03](https://user-images.githubusercontent.com/54894715/120115561-ea92bf00-c18c-11eb-9dbc-37ba4bd6bf06.png)


* На вкладке истории можно посмотреть все свои ответы по пройденным опросам


![Simulator Screen Recording - iPhone 8 Plus - 2021-05-30 at 21 31 38](https://user-images.githubusercontent.com/54894715/120115982-938de980-c18e-11eb-9d01-595b2883f4d5.gif)

* На вкладке экспорта можно сформировать файл с результатами в формате .cvs, который можно передать своему врачу

![Simulator Screen Recording - iPhone 8 Plus - 2021-05-30 at 21 07 10](https://user-images.githubusercontent.com/54894715/120115760-dd2a0480-c18d-11eb-936e-9592ddfe8732.gif)
