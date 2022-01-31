import 'package:flutter/cupertino.dart';

class FilterProvider extends ChangeNotifier {
  bool isFilterPage = false;
  String selectedSport = "football";
  String selectedVenue = "field";
  List<String> dates = [
    "Mo. 20.12.",
    "Di. 21.12.",
    "Mi. 22.12.",
    "Heute",
    "Fr. 24.12.",
    "Sa. 25.12.",
    "So. 26.12."
  ];
  changePanelBody() {
    isFilterPage = !isFilterPage;

    notifyListeners();
  }

  changeSelectedSports(String choosedSport) {
    selectedSport = choosedSport;
    notifyListeners();
  }

  changeSelectedVenue(String choosedVenue) {
    selectedVenue = choosedVenue;
    notifyListeners();
  }

  get getSelectedSports {
    return selectedSport;
  }

  get getAvailableDates {
    return dates;
  }

  get getPanelLogic {
    return isFilterPage;
  }

  get getSelectedVenue {
    return selectedVenue;
  }
}
