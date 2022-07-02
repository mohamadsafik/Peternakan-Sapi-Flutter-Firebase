import 'package:cloud_firestore/cloud_firestore.dart';

class CowModel {
  static const NAME = "name";
  static const RASCOW = "rascow";
  static const GENDER = "gender";
  static const BREED = "breed";
  static const BIRTHDATE = "birthdate";
  static const JOINEDWHEN = "joinedwhen";
  static const NOTE = "note";

  String? name;
  String? rasCow;
  String? gender;
  String? breed;
  String? birthdate;
  String? joinedwhen;
  String? note;

  CowModel(
      {this.name,
      this.rasCow,
      this.gender,
      this.breed,
      this.birthdate,
      this.joinedwhen,
      this.note});

  CowModel.fromMap(Map<String, dynamic> data) {
    name = data[NAME];
    rasCow = data[RASCOW];
    gender = data[GENDER];
    breed = data[BREED];
    birthdate = data[BIRTHDATE];
    joinedwhen = data[JOINEDWHEN];
    note = data[NOTE];
  }
}
