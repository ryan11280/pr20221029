import 'package:get/get.dart';
import 'package:pr20221029/services/firebase_storage_service.dart';

class QuestionPaperController extends GetxController {
  final allPaperImage = <String>[].obs;

  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    List<String> imgName = ["biology", "chemistry", "math", "physics"];
    try {
      for (var img in imgName) {
        final imgUrl = await Get.find<FirebaseStorageService>().getImage(img);
        allPaperImage.add(imgUrl!);
      }
    } catch (e) {
      print(e);
    }
  }
}
