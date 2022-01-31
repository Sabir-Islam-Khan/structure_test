// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DirectionSection extends StatelessWidget {
  double? totalHeight, totalWidth;
  String? timeDuration, distance;
  DirectionSection(
      {Key? key,
      @required this.totalHeight,
      @required this.totalWidth,
      @required this.timeDuration,
      @required this.distance})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var localeData = AppLocalizations.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: totalWidth! * 0.03,
        ),
        SizedBox(
          height: 22.0,
          width: 22.0,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Image.asset('assets/images/direction.png'),
          ),
        ),
        SizedBox(
          width: totalWidth! * 0.05,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text(
              timeDuration!,
              style: TextStyle(
                fontFamily: "Gilroy",
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              distance!,
              style: TextStyle(
                fontFamily: "Gilroy",
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Expanded(
          child: SizedBox(),
        ),
        GestureDetector(
          onTap: () {
            debugPrint("tapped");
          },
          child: Container(
            height: totalHeight! * 0.055,
            width: totalWidth! * 0.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
                color: Colors.black,
                width: 2.0,
              ),
            ),
            child: Center(
              child: Text(
                localeData!.navigation,
                style: TextStyle(
                  fontFamily: "Gilroy",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: totalWidth! * 0.05,
        ),
      ],
    );
  }
}
