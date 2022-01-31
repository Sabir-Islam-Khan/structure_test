// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  double? totalHeight, totalWidth;
  String? teamOne, teamTwo, score;
  TitleSection(
      {Key? key,
      @required this.totalHeight,
      @required this.totalWidth,
      @required this.teamOne,
      @required this.teamTwo,
      @required this.score})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
              height: totalWidth! * 0.12,
              width: totalWidth! * 0.12,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
            SizedBox(
              height: 3.0,
            ),
            Text(
              teamOne!,
              style: TextStyle(
                fontFamily: "Gilroy",
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(
          width: totalWidth! * 0.08,
        ),
        Text(
          score!,
          style: TextStyle(
            fontFamily: "Gilroy",
            fontWeight: FontWeight.w800,
            fontSize: totalWidth! * 0.06,
          ),
        ),
        SizedBox(
          width: totalWidth! * 0.08,
        ),
        Column(
          children: [
            Container(
              height: totalWidth! * 0.12,
              width: totalWidth! * 0.12,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
            SizedBox(
              height: 3.0,
            ),
            Text(
              teamTwo!,
              style: TextStyle(
                fontFamily: "Gilroy",
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
