# pr20221029

專題備份
## note

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

### 10/31

* wait...

---

### 資料夾結構

```bash
pr20221029
┣ android(內省略)
┣ ios(內省略)
┣ lib
┃ ┣ bindings
┃ ┃ ┗ initial_bindings.dart
┃ ┣ configs
┃ ┃ ┗ themes
┃ ┃ ┃ ┣ app_colors.dart
┃ ┃ ┃ ┣ app_dark_theme.dart
┃ ┃ ┃ ┣ app_light_theme.dart
┃ ┃ ┃ ┣ sub_theme_data_mixin.dart
┃ ┃ ┃ ┗ ui_parameters.dart
┃ ┣ controllers
┃ ┃ ┣ question_papers
┃ ┃ ┃ ┣ data_uploader.dart
┃ ┃ ┃ ┗ question_paper_controller.dart
┃ ┃ ┣ auth_controller.dart
┃ ┃ ┗ theme_controller.dart
┃ ┣ firebase_ref
┃ ┃ ┣ loading_status.dart
┃ ┃ ┗ references.dart
┃ ┣ models
┃ ┃ ┗ QuestionPaperModel.dart
┃ ┣ routes
┃ ┃ ┗ app_routes.dart
┃ ┣ screens
┃ ┃ ┣ home
┃ ┃ ┃ ┗ home_screen.dart
┃ ┃ ┗ splash_screen.dart
┃ ┣ services
┃ ┃ ┗ firebase_storage_service.dart
┃ ┣ data_uploader_screen.dart
┃ ┣ firebase_options.dart
┃ ┗ main.dart
┣ test
┃ ┗ widget_test.dart
┣ web
┃ ┣ icons
┃ ┃ ┣ Icon-192.png
┃ ┃ ┣ Icon-512.png
┃ ┃ ┣ Icon-maskable-192.png
┃ ┃ ┗ Icon-maskable-512.png
┃ ┣ favicon.png
┃ ┣ index.html
┃ ┗ manifest.json
┣ README.md
┣ analysis_options.yaml
┣ pr20221029.iml
┣ pubspec.lock
┗ pubspec.yaml
```