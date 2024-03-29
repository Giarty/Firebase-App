import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/resep_model.dart';

class RecipeController extends GetxController {
  TextEditingController titleC = TextEditingController();
  TextEditingController timeEstimationC = TextEditingController();
  TextEditingController typeC = TextEditingController();
  TextEditingController ingredientsC = TextEditingController();
  TextEditingController instructionC = TextEditingController();

  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  var resepList = [].obs;
  void getResepFirestore() async {
    resepList.clear();
    var resep = await firestore.collection('resep').orderBy('createdAt').get();
    for (var element in resep.docs) {
      final resepModel =
          ResepModel.fromDocumentSnapshot(documentSnapshot: element);
      resepList.add(resepModel);
    }
  }

  void updateResep(String documentId, String title, int timeEstimation,
      String ingredients, String instruction) async {
    await firestore.collection('resep').doc(documentId).update(
      {
        'title': title,
        'time': timeEstimation,
        'ingredients': ingredients,
        'instruction': instruction,
      },
    );
    Get.snackbar("Success", "Recipe has been updated",
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white);
    getResepFirestore();
  }

  void deleteResepFirestore(String documentId) async {
    await firestore.collection('resep').doc(documentId).delete();
    resepList.removeWhere((element) => element.documentId == documentId);
  }

  @override
  void onInit() {
    getResepFirestore();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
