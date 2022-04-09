import 'package:flutter/src/widgets/editable_text.dart';

class CowModel {
  //create model cow for crud operation
  String? imageUrl;
  String? uid;
  String? name;
  String? eartag;
  String? rasCow;
  String? gender;
  String? breed;
  String? birthdate;
  String? joinedwhen;
  String? note;
  // String? record;
  CowModel(
    this.imageUrl,
    this.uid,
    this.name,
    this.eartag,
    this.rasCow,
    this.gender,
    this.breed,
    this.birthdate,
    this.joinedwhen,
    this.note,
  );
}
