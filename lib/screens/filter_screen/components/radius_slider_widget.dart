// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class RadiusSliderWidget extends StatefulWidget {
  const RadiusSliderWidget({Key? key}) : super(key: key);

  @override
  _RadiusSliderWidgetState createState() => _RadiusSliderWidgetState();
}

class _RadiusSliderWidgetState extends State<RadiusSliderWidget> {
  double radius = 0;
  @override
  Widget build(BuildContext context) {
    double totalHeight = MediaQuery.of(context).size.height;
    double totalWidth = MediaQuery.of(context).size.width;
    var localeData = AppLocalizations.of(context);

    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: totalWidth * 0.06,
            ),
            Text(
              localeData!.radius,
              // ignore: prefer_const_constructors
              style: TextStyle(
                fontFamily: "Gilroy",
                fontWeight: FontWeight.w600,
              ),
            ),
            Expanded(
              child: SizedBox(),
            ),
            Text(
              "${radius.toInt()} Km",
              style: TextStyle(
                fontFamily: "Gilroy",
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              width: totalWidth * 0.06,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            left: totalWidth * 0.01,
            top: totalHeight * 0.01,
          ),
          child: Container(
            height: totalHeight * 0.03,
            width: totalWidth * 0.97,
            child: SfSliderTheme(
              data: SfSliderThemeData(
                inactiveTrackHeight: 3.0,
                activeTrackHeight: 4.0,
                thumbStrokeWidth: 2,
                activeTickColor: Colors.black,
                thumbStrokeColor: Colors.black,
                inactiveTickColor: Colors.grey[400],
                thumbColor: Colors.white,
                tickSize: Size(2.0, 10.0),
                tickOffset: -Offset(0, 7),
                inactiveTrackColor: Colors.grey[400],
                activeTrackColor: Colors.black,
              ),
              child: SfSlider(
                min: 0.0,
                max: 15.0,
                interval: 5,
                showTicks: true,
                value: radius,
                onChanged: (dynamic newValue) {
                  setState(() {
                    radius = newValue;
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
