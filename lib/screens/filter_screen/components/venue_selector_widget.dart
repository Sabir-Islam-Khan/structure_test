// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:matchmap_app/providers/filter_provider.dart';
import 'package:provider/provider.dart';

class VenueSelectorWidget extends StatefulWidget {
  const VenueSelectorWidget({Key? key}) : super(key: key);

  @override
  _VenueSelectorWidgetState createState() => _VenueSelectorWidgetState();
}

class _VenueSelectorWidgetState extends State<VenueSelectorWidget> {
  @override
  Widget build(BuildContext context) {
    double totalHeight = MediaQuery.of(context).size.height;
    double totalWidth = MediaQuery.of(context).size.width;
    var localeData = AppLocalizations.of(context);
    String selectedVenue =
        Provider.of<FilterProvider>(context).getSelectedVenue;
    return Row(
      children: [
        SizedBox(
          width: totalWidth * 0.06,
        ),
        GestureDetector(
          onTap: () {
            Provider.of<FilterProvider>(context, listen: false)
                .changeSelectedVenue('field');
          },
          child: Container(
            height: totalHeight * 0.12,
            width: totalWidth * 0.24,
            decoration: BoxDecoration(
              border: Border.all(
                color:
                    selectedVenue == "field" ? Colors.green : Colors.grey[400]!,
                width: 2.0,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: totalHeight * 0.05,
                  width: totalWidth * 0.05,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Image.asset(
                      'assets/images/field.png',
                      color:
                          selectedVenue == 'field' ? Colors.black : Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: totalHeight * 0.01,
                ),
                Text(
                  localeData!.field,
                  style: TextStyle(
                    fontFamily: "Gilroy",
                    fontWeight: FontWeight.w600,
                    color:
                        selectedVenue == 'field' ? Colors.black : Colors.grey,
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: totalWidth * 0.07,
        ),
        GestureDetector(
          onTap: () {
            Provider.of<FilterProvider>(context, listen: false)
                .changeSelectedVenue('stadium');
          },
          child: Container(
            height: totalHeight * 0.12,
            width: totalWidth * 0.24,
            decoration: BoxDecoration(
              border: Border.all(
                color: selectedVenue == "stadium"
                    ? Colors.green
                    : Colors.grey[400]!,
                width: 2.0,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: totalHeight * 0.05,
                  width: totalWidth * 0.05,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Image.asset(
                      'assets/images/stadium.png',
                      color: selectedVenue == "stadium"
                          ? Colors.black
                          : Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: totalHeight * 0.01,
                ),
                Text(
                  localeData.stadium,
                  style: TextStyle(
                    fontFamily: "Gilroy",
                    fontWeight: FontWeight.w600,
                    color: selectedVenue == 'stadium'
                        ? Colors.black
                        : Colors.grey[400],
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: totalWidth * 0.07,
        ),
        GestureDetector(
          onTap: () {
            Provider.of<FilterProvider>(context, listen: false)
                .changeSelectedVenue('hall');
          },
          child: Container(
            height: totalHeight * 0.12,
            width: totalWidth * 0.24,
            decoration: BoxDecoration(
              border: Border.all(
                color:
                    selectedVenue == 'hall' ? Colors.green : Colors.grey[400]!,
                width: 2.0,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: totalHeight * 0.05,
                  width: totalWidth * 0.05,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Image.asset(
                      'assets/images/gym.png',
                      color:
                          selectedVenue == "hall" ? Colors.black : Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: totalHeight * 0.01,
                ),
                Text(
                  localeData.hall,
                  style: TextStyle(
                    fontFamily: "Gilroy",
                    fontWeight: FontWeight.w600,
                    color: selectedVenue == 'hall'
                        ? Colors.black
                        : Colors.grey[400],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
