import 'package:flutter/material.dart';

import '../../../constants/color.dart';

BottomNavigationBarItem bottomNavBar(IconData icon, String label) {
  return BottomNavigationBarItem(
    icon: Container(
      margin: const EdgeInsets.only(bottom: 7),
      child: Icon(
        icon,
        size: 20.0,
      ),
    ),
    label: label,
    backgroundColor: background,
  );
}
