import 'package:cloud_firestore/cloud_firestore.dart';

class ResepModel {
  String? documentId;
  late String title;
  late String tipe;
  late int time;
  late String instruction;
  late String ingredients;

  ResepModel({
    required this.title,
    required this.tipe,
    required this.time,
    required this.instruction,
    required this.ingredients,
  });

  ResepModel.fromDocumentSnapshot(
      {required DocumentSnapshot documentSnapshot}) {
    documentId = documentSnapshot.id;
    title = documentSnapshot["title"];
    tipe = documentSnapshot["tipe"];
    time = documentSnapshot["time"];
    instruction = documentSnapshot["instruction"];
    ingredients = documentSnapshot["ingredients"];
  }
}
