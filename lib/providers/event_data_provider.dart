import 'package:flutter/material.dart';
import 'package:matchmap_app/providers/filter_provider.dart';
import 'package:provider/provider.dart';
import '../models/event_data_model.dart';

class EventDataProvider extends ChangeNotifier {
  //TODO: add api data once available instead of mock data

  List<EventData> footballData = [
    EventData(
      teamOne: "TuS 08 Senne I",
      teamTwo: "SV Gadderbaum",
      assetName: 'assets/images/football_hdpi.png',
      date: "Heute, 23. 12.2021",
      distance: "4.2 km",
      league: "Kreisliga",
      location: "Halle",
      postalAddress: "33602 Bielefeld",
      score: "3:1",
      street: "Herforder Str. 155a",
      time: "15:00 Uhr",
      timeDistance: "8 Min. entfernt",
    ),
    EventData(
      teamOne: "TuS 08 Senne I",
      teamTwo: "SV Gadderbaum",
      assetName: 'assets/images/football_hdpi.png',
      date: "Heute, 23. 12.2021",
      distance: "4.2 km",
      league: "Kreisliga",
      location: "Halle",
      postalAddress: "33602 Bielefeld",
      score: "3:1",
      street: "Herforder Str. 155a",
      time: "15:00 Uhr",
      timeDistance: "8 Min. entfernt",
    ),
    EventData(
      teamOne: "TuS 08 Senne I",
      teamTwo: "SV Gadderbaum",
      assetName: 'assets/images/football_hdpi.png',
      date: "Heute, 23. 12.2021",
      distance: "4.2 km",
      league: "Kreisliga",
      location: "Halle",
      postalAddress: "33602 Bielefeld",
      score: "3:1",
      street: "Herforder Str. 155a",
      time: "15:00 Uhr",
      timeDistance: "8 Min. entfernt",
    ),
  ];

  // TODO : add api
  List<EventData> volleyballData = [
    EventData(
      teamOne: "TuS 08 Senne I",
      teamTwo: "SV Gadderbaum",
      assetName: 'assets/images/volleyball.png',
      date: "Heute, 23. 12.2021",
      distance: "5.2 km",
      league: "Kreisliga",
      location: "Halle",
      postalAddress: "33602 Bielefeld",
      score: "3:1",
      street: "Herforder Str. 155a",
      time: "18:00 Uhr",
      timeDistance: "8 Min. entfernt",
    ),
    EventData(
      teamOne: "TuS 08 Senne I",
      teamTwo: "SV Gadderbaum",
      assetName: 'assets/images/volleyball.png',
      date: "Heute, 23. 12.2021",
      distance: "5.2 km",
      league: "Kreisliga",
      location: "Halle",
      postalAddress: "33602 Bielefeld",
      score: "3:1",
      street: "Herforder Str. 155a",
      time: "18:00 Uhr",
      timeDistance: "8 Min. entfernt",
    ),
    EventData(
      teamOne: "TuS 08 Senne I",
      teamTwo: "SV Gadderbaum",
      assetName: 'assets/images/volleyball.png',
      date: "Heute, 23. 12.2021",
      distance: "5.2 km",
      league: "Kreisliga",
      location: "Halle",
      postalAddress: "33602 Bielefeld",
      score: "3:1",
      street: "Herforder Str. 155a",
      time: "18:00 Uhr",
      timeDistance: "8 Min. entfernt",
    ),
  ];

  List<EventData> handballData = [
    EventData(
      teamOne: "TuS 08 Senne I",
      teamTwo: "SV Gadderbaum",
      assetName: 'assets/images/handball.png',
      date: "Heute, 23. 12.2021",
      distance: "5.2 km",
      league: "Kreisliga",
      location: "Halle",
      postalAddress: "33602 Bielefeld",
      score: "4:1",
      street: "Herforder Str. 155a",
      time: "21:00 Uhr",
      timeDistance: "8 Min. entfernt",
    ),
    EventData(
      teamOne: "TuS 08 Senne I",
      teamTwo: "SV Gadderbaum",
      assetName: 'assets/images/handball.png',
      date: "Heute, 23. 12.2021",
      distance: "5.2 km",
      league: "Kreisliga",
      location: "Halle",
      postalAddress: "33602 Bielefeld",
      score: "4:1",
      street: "Herforder Str. 155a",
      time: "21:00 Uhr",
      timeDistance: "8 Min. entfernt",
    ),
  ];

  List<EventData> rugbyData = [
    EventData(
      teamOne: "TuS 08 Senne I",
      teamTwo: "SV Gadderbaum",
      assetName: 'assets/images/american_football.png',
      date: "Heute, 23. 12.2021",
      distance: "5.2 km",
      league: "Kreisliga",
      location: "Halle",
      postalAddress: "33602 Bielefeld",
      score: "1:1",
      street: "Herforder Str. 155a",
      time: "12:00 Uhr",
      timeDistance: "8 Min. entfernt",
    ),
    EventData(
      teamOne: "TuS 08 Senne I",
      teamTwo: "SV Gadderbaum",
      assetName: 'assets/images/american_football.png',
      date: "Heute, 23. 12.2021",
      distance: "5.2 km",
      league: "Kreisliga",
      location: "Halle",
      postalAddress: "33602 Bielefeld",
      score: "1:1",
      street: "Herforder Str. 155a",
      time: "12:00 Uhr",
      timeDistance: "8 Min. entfernt",
    ),
  ];

  List<EventData> icehockeyData = [
    EventData(
      teamOne: "TuS 08 Senne I",
      teamTwo: "SV Gadderbaum",
      assetName: 'assets/images/ice_hockey.png',
      date: "Heute, 23. 12.2021",
      distance: "5.2 km",
      league: "Kreisliga",
      location: "Halle",
      postalAddress: "33602 Bielefeld",
      score: "10:1",
      street: "Herforder Str. 155a",
      time: "08:00 Uhr",
      timeDistance: "8 Min. entfernt",
    ),
    EventData(
      teamOne: "TuS 08 Senne I",
      teamTwo: "SV Gadderbaum",
      assetName: 'assets/images/ice_hockey.png',
      date: "Heute, 23. 12.2021",
      distance: "5.2 km",
      league: "Kreisliga",
      location: "Halle",
      postalAddress: "33602 Bielefeld",
      score: "10:1",
      street: "Herforder Str. 155a",
      time: "08:00 Uhr",
      timeDistance: "8 Min. entfernt",
    ),
  ];

  getEventData(BuildContext context) {
    String selected = Provider.of<FilterProvider>(context).selectedSport;

    if (selected == "football") {
      return footballData;
    } else if (selected == "volleyball") {
      return volleyballData;
    } else if (selected == "handball") {
      return handballData;
    } else if (selected == "rugby") {
      return rugbyData;
    } else if (selected == "icehockey") {
      return icehockeyData;
    } else {
      return footballData;
    }
  }
}
