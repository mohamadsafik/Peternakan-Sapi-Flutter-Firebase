import 'package:flutter/material.dart';

class MediaQuerys {
  MediaQuerys({required context}) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
  }
}
