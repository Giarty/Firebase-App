import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  TextEditingController titleC = TextEditingController();
  TextEditingController timeEstimationC = TextEditingController();
  TextEditingController typeC = TextEditingController();
  TextEditingController ingredientsC = TextEditingController();
  TextEditingController instructionC = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addRecipe(String title, int timeEstimation, String type,
      String ingredients, String instruction) async {
    //var x = await firestore.collection('resep').get();
    //var getId = x.size + 1;
    const timestamp = Timestamp.now;
    var doc = {
      'title': title,
      'time': timeEstimation,
      'tipe': type,
      'ingredients': ingredients,
      'instruction': instruction,
      'createdAt': timestamp(),
    };
    if (titleC.text.isEmpty ||
        timeEstimationC.text.isEmpty ||
        timeEstimationC.text.isEmpty ||
        ingredientsC.text.isEmpty ||
        instructionC.text.isEmpty) {
      Get.snackbar(
          icon: const Icon(
            Icons.error,
            color: Colors.purple,
          ),
          "Invalid",
          "Fill all columns",
          backgroundColor: Colors.red);
    } else {
      await firestore.collection('resep').add(doc);
      Get.snackbar(
          icon: const Icon(
            Icons.check,
            color: Colors.purple,
          ),
          "Success",
          "Recipe has been created",
          backgroundColor: Colors.green);
      Get.offNamed(Routes.RECIPE);
    }
  }
}
