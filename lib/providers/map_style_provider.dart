// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class MapStyleProvider extends ChangeNotifier {
  String data = "";

  void setMapStyle(BuildContext context) async {
    data = await DefaultAssetBundle.of(context)
        .loadString("assets/styles/map_style.json");

    notifyListeners();
  }

  get getMapStyle {
    return data;
  }
}
