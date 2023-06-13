import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:same_boat_project/controllers/reels_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final imageController = Get.put(ImageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1F1932),
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back_ios,
          size: 35,
          color: Color(0xffFFFFFF),
        ),
        title: Text(
          "${imageController.pickedImageList.length}",
          style: const TextStyle(
            fontSize: 21,
            color: Color(0xffFFFFFF),
          ),
        ),
        backgroundColor: const Color(0xff1F1932),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Obx(
            () => Container(
              margin: const EdgeInsets.all(15),
              height: 400,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: imageController.pickedImageList.isEmpty
                  ? const Placeholder()
                  : Image.file(
                      imageController.pickedImageList[
                          imageController.selctedImageIndex.value],
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          Obx(
            () => SizedBox(
              height: 71,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imageController.pickedImageList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          imageController.setImagePreview(index);
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey,
                            image: DecorationImage(
                              image: FileImage(
                                  imageController.pickedImageList[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: IconButton(
                              onPressed: () {
                                imageController.removeList(index);
                              },
                              icon: const Icon(Icons.delete,
                                  size: 40, color: Colors.white)),
                        ),
                      ),
                    );
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Material(
              elevation: 5,
              color: Colors.white.withOpacity(0.3),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(21)),
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(20),
                  hintText: 'Add a caption...',
                  hintStyle: const TextStyle(
                    fontSize: 15,
                    color: Color(0xffF0EFF5),
                  ),
                  prefixIcon: IconButton(
                    onPressed: () {
                      imageController.pickImageFromGallery();
                    },
                    icon: const Icon(
                      Icons.add_circle_outlined,
                      size: 35,
                    ),
                    color: Color(0xffFFFFFF),
                  ),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(21),
                      )),
                  suffixIcon: const Icon(
                    Icons.send,
                    color: Color(0xffFFFFFF),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
