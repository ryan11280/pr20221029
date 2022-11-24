# pr20221029

專題備份

---
### 10/29
* 中山@
* 專案建立
* GetX controller
* 讀入json
* json model建

### 10/30
* 中正@
* JSON to Dart model建立
* json傳上firestore
* collection and subcollection

### 10/31
* 中正@/大安
* json service上傳done、選項上傳ok
* add controllers： question(+uploader)、auth、theme
* add bindings：initial_bindings，引導觸發controller
* add GetX用法續讀、路由app_routes
* add Theme、Color統一放於configs、 明暗主題、Google_fonts
* check 頁面設計?
* note YT跟到3:00:00+， ?往前除introduction page未做

### 11/1
* 大安
* add 文件結構
* add Todo
* note YT...
* ...

### 11/2
* 大安@
* add 答題頁面
* add 初始登入頁面參考[https://blog.codemagic.io/firebase-authentication-google-sign-in-using-flutter/](https://blog.codemagic.io/firebase-authentication-google-sign-in-using-flutter/)
* add service firebase_authenticatio done
* add 頁面
* add main2? 
* bindings了解 done
* Make github project privately and add contributor. done

### 11/3
* 新店

### 11/5
* 台東

### 11/6
* 中山@
* 忘...

### 11/7
* 中正@
* add 已接上Firebase_Authentication: Google login
  * add firebase_google_login_controller [REF](//https://ithelp.ithome.com.tw/articles/10259691)
  * 僅完成iOS
    * add ios/Runner/Info.plist => 加上URLSchemes
    * add ios/Runner/AppDelegate.swift => import FirebaseCore/configure
  * Android(未完成): android/app/google-services.json已放
  * Web(未完成)
* auth_controller移除2s後跳轉頁面/之後可加splash screen/Firebase.initializeApp(必須要有options)
* add 完成登入頁/跳轉至首頁function
* add 首頁+登入帳號資訊顯示
* fix app_routes: 頁面跳轉路徑整理
* note git pull時如遇衝突 => --rebase
* add create_question(題目製作頁)，應有2頁面(題本名/題目)...排版overflow待解決
* add home1_screen => 首頁加入CircleAvatar等登入帳號資訊顯示/返回登入頁
* add login_screen => 登入頁面onPressed() => 判斷登入成功跳轉至首頁/失敗顯示錯誤訊息snackbar
* error: score_screen => 計分錯誤待查
* note: 疑為overflow問題:
  * ListTile widgets require a Material widget ancestor.
    In Material Design, most widgets are conceptually "printed" on a sheet of material. In Flutter's material library, that material is represented by the Material widget. It is the Material widget that renders ink splashes, for instance. Because of this, many material library widgets require that there be a Material widget in the tree above them.
  * To introduce a Material widget, you can either directly include one, or use a widget that contains Material itself, such as a Card, Dialog, Drawer, or Scaffold.

* erin's:
  * add dependencies: footer: ^0.0.4 #版權底部
  * add about_screen => 關於/版權/參考資料頁面
  * add question_screen => 題目製作頁
  * add app_color => 加kHomeButtonColor/kHomekeyColor
  * add question_list => ?

### 11/8
* 士林@/淡水
* note 首頁4個按鈕Container外包Inkwell+Ink => 可print
  * 要外包Material才能顯示按壓痕跡 
* add 彈出視窗 => xen_popup_card: ^0.0.1 
  * 加頁：create_question_popup
* note 先彈窗：https://stackoverflow.com/questions/52164369/show-alert-dialog-on-app-main-screen-load-automatically-in-flutter
* add About加AppBar/回home
* fix 主頁 按鈕包Material/Inkwell及按鈕跳轉
* fix 題目製作頁 基本layouts
* 測試popup
* 關於頁面 加入AppBar/回home
* read 怎麼從FireStore拿資料
* todo googleLogin後 用戶建題本/答題紀錄/登出?

### 11/9

* 大安@

### 11/11

* 士林@/淡水

### 11/13

* 頭城

### 11/14

* 中和

### 11/15

* 中正

### 11/16

* 大安

### 11/17

* 淡水

### 11/18

* 金山

### 11/19

* 大安/信義

### 11/20

* 中正@

### 11/21

* 中正@/淡水

### 11/23

* 中正@

### 11/24

* 淡水


---
### Links and references
* YT video:
[https://www.youtube.com/watch?v=ZSVnIphlGKI](https://www.youtube.com/watch?v=ZSVnIphlGKI)

* Website:
[https://www.dbestech.com/tutorials/flutter-firebase-complete-app-study-app/](https://www.dbestech.com/tutorials/flutter-firebase-complete-app-study-app/)

* Firebase project:
location: asia-east1 = Taiwan
[https://console.firebase.google.com/u/0/project/fir-20221026/overview](https://console.firebase.google.com/u/0/project/fir-20221026/overview)

* JSON to Dart:
[https://javiercbk.github.io/json_to_dart/](https://javiercbk.github.io/json_to_dart/)

* Flutter platform with Dart language
* [2022 Flutter Firebase Master Class Tutorial Complete App | Backend Data Storage](https://www.youtube.com/watch?v=ZSVnIphlGKI)
* Google Firebase, Firestore, FirebaseAuthenication
* GetX state management

---
### 文件結構 
```
updated: 20221102整理...待更新

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
┃ ┃ ┃ ┗ question_paper_controller.dart(載入題本) //1102
┃ ┃ ┣ auth_controller.dart(頁面跳轉)
┃ ┃ ┣ question_controller.dart(答題頁控制) //1102
┃ ┃ ┗ theme_controller.dart(初始化亮暗主題)
┃ ┣ firebase_ref
┃ ┃ ┣ loading_status.dart(列出firebase載入狀態)
┃ ┃ ┗ references.dart(指定firebase上傳前文件參照)
┃ ┣ models(物件模型)
┃ ┃ ┣ Questions.dart(題目暫用) //1102
┃ ┃ ┗ QuestionPaperModel.dart(題本model)
┃ ┣ routes(路由)
┃ ┃ ┗ app_routes.dart(GetX路由管理)
┃ ┣ screens(頁面)
┃ ┃ ┣ home
┃ ┃ ┃ ┗ home_screen.dart(主頁)
┃ ┃ ┣ login //1102
┃ ┃ ┃ ┗ login_screen.dart(登入頁)
┃ ┃ ┣ quiz //1102
┃ ┃ ┃ ┣ components
┃ ┃ ┃ ┃ ┣ body.dart()
┃ ┃ ┃ ┃ ┣ option.dart()
┃ ┃ ┃ ┃ ┗ peogress_bar.dart()
┃ ┃ ┃ ┃ ┗ question_card.dart()
┃ ┃ ┃ ┗ quiz_screen.dart(答題頁) //1102
┃ ┃ ┣ score //1102
┃ ┃ ┃ ┗ score_screen.dart(顯示分數頁)
┃ ┃ ┣ welcome
┃ ┃ ┃ ┗ welcome_screen.dart(歡迎頁)
┃ ┃ ┗ splash_screen.dart(暫放, 未來與welcome擇一改登入頁)
┃ ┣ services(服務)
┃ ┃ ┣ firebase_authentication.dart(Firebase初始登入)
┃ ┃ ┗ firebase_storage_service.dart(載入圖片 from firebaseStorage)
┃ ┣ data_uploader_screen.dart(測試: 上傳/成功, 已無用)
┃ ┣ firebase_options.dart()
┃ ┣ main2.dart(暫用)
┃ ┗ main.dart(主程式) //1102
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
* 跳轉流程/路由...done
* 參考資料紀錄
* 題目handle/display
* Firebase Authentication OAuth用戶google登入then轉storage...1107完成ios登入
* 前項登入與否判斷...1107done
* Github PR改private share...done
...
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
