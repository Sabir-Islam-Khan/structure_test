// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:matchmap_app/providers/event_data_provider.dart';
import 'package:matchmap_app/providers/filter_provider.dart';
import 'package:matchmap_app/screens/filter_screen/filter_screen.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../../models/event_data_model.dart';
import '../components/headings.dart';
import '../components/schedule.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BuildSlideUpPanel extends StatelessWidget {
  ScrollController? scrollController;
  BuildContext? context;
  double? totalHeight, totalWidth;
  PanelController? panelController;
  BuildSlideUpPanel(
      {Key? key,
      @required this.scrollController,
      @required this.context,
      @required this.totalHeight,
      @required this.totalWidth,
      @required this.panelController})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var localeData = AppLocalizations.of(context);
    List<EventData> data =
        Provider.of<EventDataProvider>(context).getEventData(context);
    bool bodyLogic = Provider.of<FilterProvider>(context).getPanelLogic;

    return bodyLogic == false
        ? FilterScreen(
            panelController: panelController,
          )
        : SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                SizedBox(
                  height: totalHeight! * 0.01,
                ),
                Container(
                  height: 2.0,
                  width: totalWidth! * 0.12,
                  color: Colors.black,
                ),
                SizedBox(
                  height: totalHeight! * 0.032,
                ),
                Text(
                  "48 ${localeData!.event_suffix}",
                  style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(
                  height: totalHeight! * 0.045,
                ),
                CustomHeading(
                  totalHeight: totalHeight,
                  totalWidth: totalWidth,
                ),
                SizedBox(
                  height: totalHeight! * 0.01,
                ),
                for (EventData i in data)
                  ScheduleWidget(
                      totalHeight: totalHeight,
                      totalWidth: totalWidth,
                      data: i,
                      context: context),

                SizedBox(
                  height: totalHeight! * 0.01,
                ),
                // ignore: sized_box_for_whitespace
                Container(
                  height: totalHeight! * 0.08,
                  width: totalWidth! * 1,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Image.asset('assets/images/mockup_ad.PNG'),
                  ),
                ),
                SizedBox(
                  height: totalHeight! * 0.02,
                ),
                for (EventData i in data)
                  ScheduleWidget(
                      totalHeight: totalHeight,
                      totalWidth: totalWidth,
                      data: i,
                      context: context),
              ],
            ),
          );
  }
}
