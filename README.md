# pr20221029

專題備份
## note
### todo:
...
---
### update..
### 10/29

* PR建
* GetX controller
* 讀入json
* json model建

### 10/30

* JSON to Dart model建立
* json傳上firestore
* collection and subcollection

### 10/31

* json service上傳done、選項上傳ok
* 新增 controllers： question(+uploader)、auth、theme
* 新增 bindings：initial_bindings，引導觸發controller
* 新增 GetX用法續讀、路由app_routes
* 新增 Theme、Color統一放於configs、 明暗主題、Google_fonts
* 頁面設計?
* video跟到3:00:00+， 往前除introduction page未做

### 11/1

* wait...
---
### Links
YT:
[https://www.youtube.com/watch?v=ZSVnIphlGKI](https://www.youtube.com/watch?v=ZSVnIphlGKI)

Website:
[https://www.dbestech.com/tutorials/flutter-firebase-complete-app-study-app/](https://www.dbestech.com/tutorials/flutter-firebase-complete-app-study-app/)

Firebase project:
location: asia-east1 = Taiwan
[https://console.firebase.google.com/u/0/project/fir-20221026/overview](https://console.firebase.google.com/u/0/project/fir-20221026/overview)

JSON to Dart:
[https://javiercbk.github.io/json_to_dart/](https://javiercbk.github.io/json_to_dart/)


---
### 資料夾結構
```
pr20221029
┣ android(平台文件/內省略)
┣ ios(平台文件/內省略)
┣ web(平台文件/內省略)
┣ lib
┃ ┣ bindings
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
┃ ┣ models(文件模型)
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
┣ test(test?)
┃ ┗ widget_test.dart
┣ README.md(本文件)
┣ analysis_options.yaml
┣ pr20221029.iml
┣ pubspec.lock
┗ pubspec.yaml(Flutter配置/第三方套件引入管理)
```