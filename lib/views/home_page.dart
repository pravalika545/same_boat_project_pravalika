import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:same_boat_project/controllers/reels_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> imageUrl = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRm3wlmhT3_LJ5vXVcp_R8EIgETshpjx8IU8A&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRA--rCsVnsdik9PY2JyFHHhb-L7nPD3HNEDA&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvmx3TfeqxJ0ZnLCX9a4EBAoEa90mgnTcDRA&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKs93Q8MiOigMFhaOBhY9bsLIdm9venj4xsg&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4HbJXc_SuTrT_xVnC__1zAXx_UQlf3HRvKQ&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxS_hPx_iIoAvNf9a5BOTpOxIlDxAhgm36ag&usqp=CAU",
  ];
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
        title: const Text(
          "Three Images Selected",
          style: TextStyle(
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
              height: 512,
              width: 378,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: imageController.selectedImageUrl.value.isEmpty
                  ? const Placeholder()
                  : Image.network(
                      imageController.selectedImageUrl.value,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          SizedBox(
            height: 71,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imageUrl.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(8),
                    height: 71,
                    width: 71,
                    child: ListTile(
                      title: Container(
                        height: 71,
                        width: 71,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.red),
                        child: Image.network(
                          imageUrl[index],
                          fit: BoxFit.fill,
                        ),
                      ),
                      onTap: () {
                        imageController.setImageUrl(imageUrl[index]);
                      },
                    ),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Material(
              elevation: 5,
              color: Colors.white.withOpacity(0.3),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(21)),
              child: TextFormField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  hintText: 'Add a caption...',
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: Color(0xffF0EFF5),
                  ),
                  prefixIcon: Icon(
                    Icons.add_circle_outlined,
                    size: 35,
                    color: Color(0xffFFFFFF),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(21),
                      )),
                  suffixIcon: Icon(
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
