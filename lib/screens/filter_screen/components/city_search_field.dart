import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CitySearchWidget extends StatefulWidget {
  const CitySearchWidget({Key? key}) : super(key: key);

  @override
  _CitySearchWidgetState createState() => _CitySearchWidgetState();
}

class _CitySearchWidgetState extends State<CitySearchWidget> {
  final TextEditingController cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var localeData = AppLocalizations.of(context);
    double totalHeight = MediaQuery.of(context).size.height;
    double totalWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        height: totalHeight * 0.06,
        width: totalWidth * 0.89,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          border: Border.all(
            color: Colors.grey[400]!,
            width: 2.0,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
              left: totalWidth * 0.05,
            ),
            child: TextField(
              controller: cityController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: localeData!.city_hint,
                  hintStyle: TextStyle(
                    fontFamily: "Gilroy",
                    color: Colors.grey[400],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
