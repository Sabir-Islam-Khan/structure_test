import 'package:flutter/material.dart';
import 'package:matchmap_app/providers/filter_provider.dart';
import 'package:matchmap_app/screens/filter_screen/buttons/custom_textbutton.dart';
import 'package:provider/provider.dart';

class DateScroller extends StatefulWidget {
  const DateScroller({Key? key}) : super(key: key);

  @override
  _DateScrollerState createState() => _DateScrollerState();
}

class _DateScrollerState extends State<DateScroller> {
  @override
  Widget build(BuildContext context) {
    List<String> dates = Provider.of<FilterProvider>(context).getAvailableDates;
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        for (String i in dates)
          customTextButton(
            i,
            // TODO : Placeholder logic for current date
            // use language specific logic later
            i == "Heute" ? true : false,
          )
      ],
    );
  }
}
