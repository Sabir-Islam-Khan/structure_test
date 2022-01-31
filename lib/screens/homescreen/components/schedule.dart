// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import '../../../models/event_data_model.dart';
import '../../event_details_screen/event_details.dart';

class ScheduleWidget extends StatelessWidget {
  double? totalHeight, totalWidth;
  EventData? data;
  BuildContext? context;
  ScheduleWidget(
      {Key? key,
      @required this.totalHeight,
      @required this.totalWidth,
      @required this.data,
      @required this.context})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.0, bottom: 2.0),
      child: Card(
        elevation: 5.0,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
          height: totalHeight! * 0.08,
          width: totalWidth! * 0.95,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EventDetails(data: data),
                ),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      data!.teamOne!,
                      style: TextStyle(
                        fontFamily: "Gilroy",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      height: 20.0,
                      width: 20.0,
                      decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      data!.score!,
                      style: TextStyle(
                        fontFamily: "Gilroy",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Container(
                      height: 20.0,
                      width: 20.0,
                      decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      data!.teamTwo!,
                      style: TextStyle(
                        fontFamily: "Gilroy",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
