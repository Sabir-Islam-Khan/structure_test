// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetailsSection extends StatelessWidget {
  String? sportName, league, location, assetName;
  double? totalHeight, totalWidth;
  DetailsSection(
      {Key? key,
      @required this.sportName,
      @required this.assetName,
      @required this.league,
      @required this.location,
      @required this.totalHeight,
      @required this.totalWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var localeData = AppLocalizations.of(context);
    return Column(
      children: [
        Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            SizedBox(
              width: totalWidth! * 0.03,
            ),
            Text(
              localeData!.sports,
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w600,
              ),
            ),
            Expanded(
              child: SizedBox(),
            ),
            SizedBox(
              height: 22.0,
              width: 22.0,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset(assetName!),
              ),
            ),
            SizedBox(
              width: totalWidth! * 0.03,
            ),
            Text(
              sportName!,
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ),
            SizedBox(
              width: totalWidth! * 0.05,
            ),
          ],
        ),
        SizedBox(
          height: totalHeight! * 0.02,
        ),
        Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            SizedBox(
              width: totalWidth! * 0.03,
            ),
            Text(
              localeData.league,
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w600,
              ),
            ),
            Expanded(
              child: SizedBox(),
            ),
            Text(
              league!,
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ),
            SizedBox(
              width: totalWidth! * 0.05,
            ),
          ],
        ),
        SizedBox(
          height: totalHeight! * 0.02,
        ),
        Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            SizedBox(
              width: totalWidth! * 0.03,
            ),
            Text(
              localeData.location,
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w600,
              ),
            ),
            Expanded(
              child: SizedBox(),
            ),
            Text(
              location!,
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
              ),
            ),
            SizedBox(
              width: totalWidth! * 0.05,
            ),
          ],
        ),
      ],
    );
  }
}
