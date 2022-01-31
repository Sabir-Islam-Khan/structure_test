// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:matchmap_app/providers/filter_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomHeading extends StatelessWidget {
  double? totalHeight, totalWidth;

  CustomHeading({
    Key? key,
    @required this.totalHeight,
    @required this.totalWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var localeData = AppLocalizations.of(context);
    String title = "";
    String selectedSport = Provider.of<FilterProvider>(context).selectedSport;

    if (selectedSport == "football") {
      title = localeData!.football;
    } else if (selectedSport == "handball") {
      title = localeData!.handball;
    } else if (selectedSport == "volleyball") {
      title = localeData!.volleyball;
    } else if (selectedSport == "rugby") {
      title = localeData!.rugby;
    } else if (selectedSport == 'icehockey') {
      title = localeData!.icehockey;
    }
    return Row(
      children: [
        SizedBox(
          width: totalWidth! * 0.03,
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          title,
          style: TextStyle(
            fontFamily: "Gilroy",
            fontWeight: FontWeight.w600,
            fontSize: 17.0,
          ),
        )
      ],
    );
  }
}
