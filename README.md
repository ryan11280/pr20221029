# pr20221029

專題備份

---
### 10/29

* 專案建立
* GetX controller
* 讀入json
* json model建

### 10/30

* JSON to Dart model建立
* json傳上firestore
* collection and subcollection

### 10/31

* json service上傳done、選項上傳ok
* add controllers： question(+uploader)、auth、theme
* add bindings：initial_bindings，引導觸發controller
* add GetX用法續讀、路由app_routes
* add Theme、Color統一放於configs、 明暗主題、Google_fonts
* check 頁面設計?
* note YT跟到3:00:00+， ?往前除introduction page未做

### 11/1

* add 文件結構
* add Todo
* note YT...
* ...

### 11/2

* add 答題頁面
* add 初始登入頁面參考[https://blog.codemagic.io/firebase-authentication-google-sign-in-using-flutter/](https://blog.codemagic.io/firebase-authentication-google-sign-in-using-flutter/)
* add service firebase_authentication
* add 頁面
* add main2?
* bindings了解
* Make github project privately and add contributor.
* 
---
### Links
YT video:
[https://www.youtube.com/watch?v=ZSVnIphlGKI](https://www.youtube.com/watch?v=ZSVnIphlGKI)

Website:
[https://www.dbestech.com/tutorials/flutter-firebase-complete-app-study-app/](https://www.dbestech.com/tutorials/flutter-firebase-complete-app-study-app/)

Firebase project:
location: asia-east1 = Taiwan
[https://console.firebase.google.com/u/0/project/fir-20221026/overview](https://console.firebase.google.com/u/0/project/fir-20221026/overview)

JSON to Dart:
[https://javiercbk.github.io/json_to_dart/](https://javiercbk.github.io/json_to_dart/)


---
### 文件結構 
```
updated: 20221101

pr20221029
┣ android(平台文件/內省略)
┣ ios(平台文件/內省略)
┣ web(平台文件/內省略)
┣ lib
┃ ┣ bindings//提供widgets/service/render等調用between Framework and Engine.
┃ ┃ ┗ initial_bindings.dart(初始化bindings)
┃ ┣ configs(參數)
┃ ┃ ┗ themes(主題)
┃ ┃ ┃ ┣ app_colors.dart(顏色)
┃ ┃ ┃ ┣ app_dark_theme.dart(暗色主題)
┃ ┃ ┃ ┣ app_light_theme.dart(亮色主題)
┃ ┃ ┃ ┣ sub_theme_data_mixin.dart(覆蓋text/icon預設樣式)
┃ ┃ ┃ ┗ ui_parameters.dart(亮暗主題判斷)
┃ ┣ controllers(控制器)
┃ ┃ ┣ question_papers
┃ ┃ ┃ ┣ data_uploader.dart(上傳json資料to Firebase Firestore)
┃ ┃ ┃ ┗ question_paper_controller.dart(載入題本)
┃ ┃ ┣ auth_controller.dart(頁面跳轉)
┃ ┃ ┗ theme_controller.dart(初始化亮暗主題)
┃ ┣ firebase_ref
┃ ┃ ┣ loading_status.dart(列出firebase載入狀態)
┃ ┃ ┗ references.dart(指定firebase上傳前文件參照)
┃ ┣ models(物件模型)
┃ ┃ ┗ QuestionPaperModel.dart(題本model)
┃ ┣ routes(路由)
┃ ┃ ┗ app_routes.dart(GetX路由管理)
┃ ┣ screens(頁面)
┃ ┃ ┣ home
┃ ┃ ┃ ┗ home_screen.dart(主頁)
┃ ┃ ┗ splash_screen.dart(暫放, 未來應改成登入頁)
┃ ┣ services(服務)
┃ ┃ ┗ firebase_storage_service.dart(載入圖片 from firebaseStorage)
┃ ┣ data_uploader_screen.dart(測試: 上傳/成功, 已無用)
┃ ┣ firebase_options.dart()
┃ ┗ main.dart(主程式)
┣ test(測試?)
┃ ┗ widget_test.dart
┣ README.md(本文件)
┣ analysis_options.yaml
┣ pr20221029.iml
┣ pubspec.lock
┗ pubspec.yaml(Flutter配置/第三方套件引入管理)
```
---
### Todo

* apple developer account(free)設定 => iOS實機run
* android run
* firebase下載後儲存
* 頁面設計
* 用戶操作流程
* 跳轉流程/路由
* 參考資料紀錄
* 題目handle/display
* Firebase Authentication OAuth用戶google登入then轉storage
* 前項登入與否判斷
* Github PR改private share
...
----
### Reference
* Flutter platform with Dart language
* [2022 Flutter Firebase Master Class Tutorial Complete App | Backend Data Storage](https://www.youtube.com/watch?v=ZSVnIphlGKI)
* Google Firebase, Firestore, FirebaseAuthenication
* GetX state management
----
### 開發環境
>macOS(intel) 12.6 <br>
>Flutter: 3.3.4 <br>
>Dart: 2.18.2 <br>
>Android SDK version: 33.0.0 <br>
>IDE: Android Studio 2021.3.1 Patch 1 <br>
>Xcode: 14.0.1 <br>
>CocoaPods: 1.11.3 <br>
>FirebaseCLI: 11.15.0<br>
>Version Control: GitHub <br><br>
>simulator: iPhone 14 Pro with iOS 16.0, tested. <br>
>simulator: wait <br>
>iPhone 12 with iOS 14.3, not yet test.

>JDK 8 update531=>JDK 19.0.1
---
### note
android applicationId "com.example.pr20221029" <br>
./gradlew signingReport <br>
