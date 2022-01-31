// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, must_be_immutable

import 'package:flutter/material.dart';

class CustomTabButton extends StatelessWidget {
  double? totalHeight, totalWidth;
  String? title, assetName;
  CustomTabButton(
      {Key? key,
      @required this.totalHeight,
      @required this.totalWidth,
      @required this.title,
      @required this.assetName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 3.0, right: 5.0, bottom: 3.0),
      child: Material(
        elevation: 3.0,
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          height: totalHeight! * 0.032,
          width: totalWidth! * 0.23,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: totalHeight! * 0.02,
                width: totalWidth! * 0.04,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Image.asset(assetName!),
                ),
              ),
              Text(
                title!,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
