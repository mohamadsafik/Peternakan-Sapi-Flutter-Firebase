import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CurrencyFormat {
  static String convertToIdr(dynamic number, int decimalDigit) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(number);
  }
}

// const kTinyTitleTextStyle = TextStyle(
//   fontSize: 12.0,
//   color: Colors.orange,
//   fontWeight: FontWeight.bold,
//   fontFamily: 'poppins',
// );

// const normailSubtitle = TextStyle(
//   fontSize: 15.0,
//   color: Colors.black54,
//   fontFamily: 'poppins',
// );

// const normalTitle = TextStyle(
//   color: Color(0x99000000),
//   fontSize: 17.0,
//   fontFamily: 'poppins',
// );

// const titleStyle = TextStyle(
//   color: Colors.black,
//   fontSize: 20.0,
//   fontWeight: FontWeight.bold,
//   fontFamily: 'poppins',
// );

// const monitoringTextBlue = TextStyle(
//   color: Color.fromARGB(255, 22, 90, 155),
//   fontWeight: FontWeight.bold,
//   fontSize: 15.0,
//   fontFamily: 'poppins',
// );

// const monitoringTextGreen = TextStyle(
//   color: Color.fromARGB(255, 29, 121, 57),
//   fontWeight: FontWeight.bold,
//   fontSize: 15.0,
//   fontFamily: 'poppins',
// );
