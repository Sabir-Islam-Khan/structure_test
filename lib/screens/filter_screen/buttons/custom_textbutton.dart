// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

Widget customTextButton(String title, bool isBold) {
  return TextButton(
    onPressed: () {},
    child: Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
      ),
    ),
  );
}
