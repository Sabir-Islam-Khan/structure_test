// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:matchmap_app/providers/filter_provider.dart';
import 'package:provider/provider.dart';
import '../../models/event_data_model.dart';
import './components/details_section.dart';
import './components/direction_section.dart';
import 'components/location_section.dart';
import 'components/times_section.dart';
import 'components/title_section.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EventDetails extends StatelessWidget {
  EventData? data;

  EventDetails({Key? key, @required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double totalHeight = MediaQuery.of(context).size.height;
    double totalWidth = MediaQuery.of(context).size.width;
    var localeData = AppLocalizations.of(context);
    String sportName = "";
    String selectedSport = Provider.of<FilterProvider>(context).selectedSport;

    if (selectedSport == "football") {
      sportName = localeData!.football;
    } else if (selectedSport == "handball") {
      sportName = localeData!.handball;
    } else if (selectedSport == "volleyball") {
      sportName = localeData!.volleyball;
    } else if (selectedSport == "rugby") {
      sportName = localeData!.rugby;
    } else if (selectedSport == 'icehockey') {
      sportName = localeData!.icehockey;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: totalHeight * 0.045,
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
            ),
            SizedBox(
              height: totalHeight * 0.03,
            ),
            TitleSection(
                totalHeight: totalHeight,
                totalWidth: totalWidth,
                teamOne: data!.teamOne,
                teamTwo: data!.teamTwo,
                score: data!.score),
            SizedBox(
              height: totalHeight * 0.04,
            ),
            SizedBox(
              height: totalHeight * 0.09,
              width: totalWidth * 1,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.asset('assets/images/mockup_ad.PNG'),
              ),
            ),
            SizedBox(
              height: totalHeight * 0.03,
            ),
            Padding(
              padding: EdgeInsets.only(left: totalWidth * 0.03),
              child: Text(
                localeData!.details,
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 12.0,
                ),
              ),
            ),
            SizedBox(
              height: totalHeight * 0.02,
            ),
            DetailsSection(
              sportName: sportName,
              assetName: data!.assetName,
              league: data!.league,
              location: data!.location,
              totalHeight: totalHeight,
              totalWidth: totalWidth,
            ),
            SizedBox(
              height: totalHeight * 0.02,
            ),
            Divider(
              color: const Color(0xffC1C2C3),
              thickness: 1.0,
            ),
            SizedBox(
              height: totalHeight * 0.01,
            ),
            TimesSection(
              totalHeight: totalHeight,
              totalWidth: totalWidth,
              date: data!.date,
              time: data!.time,
            ),
            SizedBox(
              height: totalHeight * 0.01,
            ),
            Divider(
              color: const Color(0xffC1C2C3),
              thickness: 1.0,
            ),
            SizedBox(
              height: totalHeight * 0.01,
            ),
            LocationSection(
              totalHeight: totalHeight,
              totalWidth: totalWidth,
              street: data!.street,
              postalAddress: data!.postalAddress,
            ),
            SizedBox(
              height: totalHeight * 0.01,
            ),
            Divider(
              color: const Color(0xffC1C2C3),
              thickness: 1.0,
            ),
            SizedBox(
              height: totalHeight * 0.01,
            ),
            DirectionSection(
              totalHeight: totalHeight,
              totalWidth: totalWidth,
              timeDuration: data!.timeDistance,
              distance: data!.distance,
            ),
            SizedBox(
              height: totalHeight * 0.01,
            ),
            Divider(
              color: const Color(0xffC1C2C3),
              thickness: 1.0,
            ),
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
                  children: [
                    SizedBox(
                      width: totalWidth * 0.05,
                    ),
                    SizedBox(
                      height: 18.0,
                      width: 18.0,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Image.asset('assets/images/share.png'),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Text(
                      localeData.share,
                      style: TextStyle(
                        fontFamily: "Gilroy",
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
