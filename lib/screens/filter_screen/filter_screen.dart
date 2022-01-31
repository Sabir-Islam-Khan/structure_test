// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors
import 'package:matchmap_app/providers/filter_provider.dart';
import 'package:matchmap_app/screens/filter_screen/components/city_search_field.dart';
import 'package:matchmap_app/screens/filter_screen/components/date_scroller.dart';
import 'package:matchmap_app/screens/filter_screen/components/radius_slider_widget.dart';
import 'package:matchmap_app/screens/filter_screen/components/sports_scroller.dart';
import 'package:matchmap_app/screens/filter_screen/components/time_selection.dart';
import 'package:matchmap_app/screens/filter_screen/components/venue_selector_widget.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FilterScreen extends StatefulWidget {
  PanelController? panelController;
  FilterScreen({Key? key, @required this.panelController}) : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  void closePanel(PanelController? panelController) {
    panelController!
        .animatePanelToPosition(
          0,
          curve: Curves.linear,
          duration: Duration(milliseconds: 400),
        )
        .then((value) => Provider.of<FilterProvider>(context, listen: false)
            .changePanelBody());
  }

  @override
  Widget build(BuildContext context) {
    double totalHeight = MediaQuery.of(context).size.height;
    double totalWidth = MediaQuery.of(context).size.width;
    var localeData = AppLocalizations.of(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: totalHeight * 0.01,
          ),
          Row(
            children: [
              SizedBox(
                width: totalWidth * 0.04,
              ),
              GestureDetector(
                onTap: () {
                  closePanel(widget.panelController);
                },
                child: Icon(
                  Icons.keyboard_arrow_down,
                  size: totalHeight * 0.04,
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Text(
                "Filter",
                style: TextStyle(
                  fontFamily: "Gilroy",
                  fontWeight: FontWeight.w600,
                  fontSize: totalHeight * 0.02,
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Text(
                "Reset",
                style: TextStyle(
                  fontFamily: "Gilroy",
                  fontWeight: FontWeight.w600,
                  fontSize: totalHeight * 0.02,
                  color: Colors.grey[400],
                ),
              ),
              SizedBox(
                width: totalWidth * 0.04,
              ),
            ],
          ),
          SizedBox(
            height: totalHeight * 0.01,
          ),
          SizedBox(
            height: totalHeight * 0.04,
            width: totalWidth * 1,
            child: DateScroller(
              key: widget.key,
            ),
          ),
          SizedBox(
            height: totalHeight * 0.015,
          ),
          Padding(
            padding: EdgeInsets.only(left: totalWidth * 0.05),
            child: Text(
              localeData!.sports,
              style: TextStyle(
                fontFamily: "Gilroy",
                fontWeight: FontWeight.w600,
                fontSize: totalHeight * 0.018,
              ),
            ),
          ),
          SizedBox(
            height: totalHeight * 0.015,
          ),
          Container(
            height: 80.0,
            child: SportsScroller(),
          ),
          SizedBox(
            height: totalHeight * 0.01,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: totalWidth * 0.05,
            ),
            child: Text(
              localeData.time,
              style: TextStyle(
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w600,
                fontSize: totalHeight * 0.018,
              ),
            ),
          ),
          SizedBox(
            height: totalHeight * 0.01,
          ),
          TimeSelectorWidget(),
          SizedBox(
            height: totalHeight * 0.02,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: totalWidth * 0.06,
            ),
            child: Text(
              localeData.city,
              style: TextStyle(
                fontFamily: "Gilroy",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: totalHeight * 0.01,
          ),
          CitySearchWidget(),
          SizedBox(
            height: totalHeight * 0.02,
          ),
          RadiusSliderWidget(),
          SizedBox(
            height: totalHeight * 0.02,
          ),
          Padding(
            padding: EdgeInsets.only(left: totalWidth * 0.06),
            child: Text(
              localeData.location,
              style: TextStyle(
                fontFamily: "Gilroy",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: totalHeight * 0.02,
          ),
          VenueSelectorWidget(),
          SizedBox(
            height: totalHeight * 0.03,
          ),
          Center(
            child: Container(
              height: totalHeight * 0.06,
              width: totalWidth * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.black,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    "Filter anwenden",
                    style: TextStyle(
                      fontFamily: "Gilroy",
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
