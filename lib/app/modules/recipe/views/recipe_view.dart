import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/recipe_controller.dart';

class RecipeView extends GetView<RecipeController> {
  const RecipeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('Recipe Menu'), centerTitle: true, actions: [
        IconButton(
          onPressed: () {
            Get.offNamed(Routes.HOME);
          },
          icon: const Icon(Icons.add),
        )
      ]),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        child: Obx(() {
          return ListView.builder(
              itemBuilder: (context, index) {
                return listResep(
                  controller.resepList[index].documentId,
                  controller.resepList[index].title,
                  controller.resepList[index].time.toString(),
                  controller.resepList[index].ingredients,
                  controller.resepList[index].instruction,
                );
              },
              itemCount: controller.resepList.length,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics());
        }),
      ),
    );
  }

  Widget listResep(String documentId, String title, String time,
      String ingredients, String instruction) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.black, style: BorderStyle.solid, width: 1.w),
          borderRadius: BorderRadius.circular(10.r)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  time,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.normal),
                ),
                Text(
                  ingredients,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.normal),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  instruction,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.normal),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const Divider(),
          IconButton(
            onPressed: () {
              Get.bottomSheet(
                Container(
                  height: double.infinity,
                  color: Colors.grey[200],
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: controller.titleC =
                              TextEditingController(text: title),
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: title,
                              hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal)),
                        ),
                        SizedBox(height: 20.h),
                        TextField(
                          controller: controller.timeEstimationC =
                              TextEditingController(text: time),
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: time,
                              hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal)),
                        ),
                        SizedBox(height: 20.h),
                        TextField(
                          controller: controller.ingredientsC =
                              TextEditingController(text: ingredients),
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: ingredients,
                              hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal)),
                        ),
                        SizedBox(height: 20.h),
                        TextField(
                          controller: controller.instructionC =
                              TextEditingController(text: instruction),
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: instruction,
                              hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal)),
                        ),
                        SizedBox(height: 20.h),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.r),
                              )),
                          onPressed: () {
                            if (controller.titleC.text == title &&
                                controller.timeEstimationC.text == time &&
                                controller.ingredientsC.text == ingredients &&
                                controller.instructionC.text == instruction) {
                              Get.back();
                              Get.snackbar(
                                  "No changes made", "Nothing to update",
                                  backgroundColor: Colors.yellow,
                                  snackPosition: SnackPosition.TOP,
                                  colorText: Colors.black);
                            } else if (controller.titleC.text.isEmpty ||
                                controller.timeEstimationC.text.isEmpty ||
                                controller.ingredientsC.text.isEmpty ||
                                controller.instructionC.text.isEmpty) {
                              Get.back();
                              Get.snackbar("Invalid", "Fill all columns",
                                  backgroundColor: Colors.red,
                                  snackPosition: SnackPosition.TOP,
                                  colorText: Colors.white);
                            } else {
                              controller.updateResep(
                                  documentId,
                                  controller.titleC.text,
                                  int.parse(controller.timeEstimationC.text),
                                  controller.ingredientsC.text,
                                  controller.instructionC.text);
                              Get.back();
                            }
                          },
                          child: const Text(
                            'Update',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.edit,
              color: Colors.blue,
            ),
          ),
          IconButton(
            onPressed: () {
              Get.defaultDialog(
                title: 'Delete Recipe',
                middleText: 'Are you sure want to delete this recipe?',
                textConfirm: 'Yes',
                textCancel: 'No',
                confirmTextColor: Colors.white,
                buttonColor: Colors.red,
                onConfirm: () {
                  controller.deleteResepFirestore(documentId);
                  Get.back();
                  Get.snackbar("Success", "Recipe has been deleted",
                      backgroundColor: Colors.green,
                      snackPosition: SnackPosition.TOP,
                      colorText: Colors.white);
                },
                onCancel: () {
                  Get.back();
                },
              );
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
