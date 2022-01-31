// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocationSection extends StatelessWidget {
  double? totalHeight, totalWidth;
  String? street, postalAddress;
  LocationSection(
      {Key? key,
      @required this.totalHeight,
      @required this.totalWidth,
      @required this.street,
      @required this.postalAddress})
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
          height: 25.0,
          width: 22.0,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Image.asset('assets/images/location_marker.png'),
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
              street!,
              style: TextStyle(
                fontFamily: "Gilroy",
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              postalAddress!,
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
          // ignore: sized_box_for_whitespace
          child: Container(
              height: totalHeight! * 0.055,
              width: totalWidth! * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    localeData!.view_events,
                    style: TextStyle(
                      fontFamily: "Gilroy",
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              )),
        ),
        SizedBox(
          width: totalWidth! * 0.05,
        ),
      ],
    );
  }
}
