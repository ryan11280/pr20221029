import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
//從Storage拿資料

Reference get firebaseStorage => FirebaseStorage.instance.ref();

//load image from firebase //1031
class FirebaseStorageService extends GetxService {
  Future<String?> getImage(String? imgName) async {
    if (imgName == null) {
      return null;
    }
    try {
      var urlRef = firebaseStorage
          .child("question_paper_images")
          .child('${imgName.toLowerCase()}.png');
      var imgUrl = await urlRef.getDownloadURL();
      return imgUrl;
    } catch (e) {
      return null;
    }
  }
  Future<String?> getQuestion(String? questionNameFirst) async {
    if (questionNameFirst == null) {
      print("沒有");
      return null;
    }
    try {
      var urlRef = firebaseStorage
          .child("question_paper_images");
          //.child('${imgName.toLowerCase()}.png');
      var questionName = await urlRef.getDownloadURL();
      return questionName;
    } catch (e) {
      return null;
    }
  }
}
