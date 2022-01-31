import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TimeSelectorWidget extends StatefulWidget {
  const TimeSelectorWidget({Key? key}) : super(key: key);

  @override
  _TimeSelectorWidgetState createState() => _TimeSelectorWidgetState();
}

class _TimeSelectorWidgetState extends State<TimeSelectorWidget> {
  final items = ["One", "Two", "Three"];
  final itemsTwo = ["One", "Two", "Three"];
  String? selectedItemOne, selectedItemTwo;

  @override
  Widget build(BuildContext context) {
    var localeData = AppLocalizations.of(context);
    double totalHeight = MediaQuery.of(context).size.height;
    double totalWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        SizedBox(
          width: totalWidth * 0.05,
        ),
        Container(
          width: totalWidth * 0.41,
          height: totalHeight * 0.06,
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 5.0,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
              border: Border.all(
                color: Colors.grey[400]!,
                width: 2.0,
              )),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              hint: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  localeData!.from,
                  style: TextStyle(
                    fontFamily: "Gilroy",
                    color: Colors.grey[400],
                  ),
                ),
              ),
              icon: Icon(
                Icons.keyboard_arrow_down,
                size: totalHeight * 0.04,
                color: Colors.black,
              ),
              isExpanded: true,
              value: selectedItemOne,
              items: items.map(buildMenuItem).toList(),
              onChanged: (value) {
                setState(() {
                  selectedItemOne = value;
                });
              },
            ),
          ),
        ),
        SizedBox(
          width: totalWidth * 0.07,
        ),
        Container(
          width: totalWidth * 0.41,
          height: totalHeight * 0.06,
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 5.0,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
              border: Border.all(
                color: Colors.grey[400]!,
                width: 2.0,
              )),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              hint: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  localeData.untill,
                  style: TextStyle(
                    fontFamily: "Gilroy",
                    color: Colors.grey[400],
                  ),
                ),
              ),
              icon: Icon(
                Icons.keyboard_arrow_down,
                size: totalHeight * 0.04,
                color: Colors.black,
              ),
              isExpanded: true,
              value: selectedItemTwo,
              items: items.map(buildMenuItem).toList(),
              onChanged: (value) {
                setState(() {
                  selectedItemTwo = value;
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(
            fontFamily: 'Gilroy',
            color: Colors.grey[400],
          ),
        ),
      );
}
