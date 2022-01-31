import 'package:flutter/material.dart';
import 'package:matchmap_app/providers/filter_provider.dart';
import 'package:provider/provider.dart';
import '../buttons/sport_buttons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SportsScroller extends StatefulWidget {
  const SportsScroller({Key? key}) : super(key: key);

  @override
  _SportsScrollerState createState() => _SportsScrollerState();
}

class _SportsScrollerState extends State<SportsScroller> {
  @override
  Widget build(BuildContext context) {
    String selectedSport =
        Provider.of<FilterProvider>(context).getSelectedSports;
    var localeData = AppLocalizations.of(context);
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        SportButton(
          isSelected: selectedSport == "football" ? true : false,
          assetName: 'assets/images/football_hdpi.png',
          sportName: localeData!.football,
          nameForProvider: "football",
        ),
        SportButton(
          isSelected: selectedSport == "volleyball" ? true : false,
          assetName: 'assets/images/volleyball.png',
          sportName: localeData.volleyball,
          nameForProvider: "volleyball",
        ),
        SportButton(
          isSelected: selectedSport == "handball" ? true : false,
          assetName: 'assets/images/handball_human.png',
          sportName: localeData.handball,
          nameForProvider: "handball",
        ),
        SportButton(
          isSelected: selectedSport == "rugby" ? true : false,
          assetName: 'assets/images/american_football.png',
          sportName: localeData.rugby,
          nameForProvider: "rugby",
        ),
        SportButton(
          isSelected: selectedSport == "icehockey" ? true : false,
          assetName: 'assets/images/ice_hockey.png',
          sportName: localeData.icehockey,
          nameForProvider: "icehockey",
        ),
      ],
    );
  }
}
