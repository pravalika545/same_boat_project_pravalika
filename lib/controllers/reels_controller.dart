

import 'package:get/get.dart';

class ImageController extends GetxController {
  var selectedImageUrl = ''.obs;

  void setImageUrl(String path) {
    selectedImageUrl.value = path;
  }
}