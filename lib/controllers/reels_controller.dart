import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  RxList<File> pickedImageList = <File>[].obs;
  var selectedImageUrl = ''.obs;
  RxInt selctedImageIndex = 0.obs;

  setImagePreview(int value) {
    selctedImageIndex.value = value;
  }

  void pickImageFromGallery() async {
    XFile? pickedImageFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImageFile != null) {
      pickedImageList.add(File(pickedImageFile.path));
    }
  }

  void removeList(int index) async {
    pickedImageList.removeAt(index);
  }
}
