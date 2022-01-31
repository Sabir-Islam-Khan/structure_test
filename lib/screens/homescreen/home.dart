// ignore_for_file: prefer_const_constructors, prefer_final_fields, unnecessary_new, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matchmap_app/providers/filter_provider.dart';
import 'package:matchmap_app/screens/homescreen/components/map_widget.dart';
import 'package:provider/provider.dart';
import 'components/panel_body.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PanelController _controller = new PanelController();

  void openPanel(PanelController panelController) {
    panelController.animatePanelToPosition(
      1,
      curve: Curves.linear,
      duration: Duration(milliseconds: 700),
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalHeight = MediaQuery.of(context).size.height;
    double totalWidth = MediaQuery.of(context).size.width;
    bool panelBodyLogic = Provider.of<FilterProvider>(context).getPanelLogic;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      body: SlidingUpPanel(
        backdropTapClosesPanel: false,
        isDraggable: panelBodyLogic == true ? false : true,
        backdropEnabled: true,
        backdropColor: Colors.black,
        backdropOpacity: 0.7,
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        controller: _controller,
        maxHeight:
            panelBodyLogic == true ? totalHeight * 0.9 : totalHeight * 0.94,
        minHeight: totalHeight * 0.1,
        panelBuilder: (panelScrollController) => BuildSlideUpPanel(
          panelController: _controller,
          scrollController: panelScrollController,
          context: context,
          totalHeight: totalHeight,
          totalWidth: totalWidth,
        ),
        body: Container(
          height: totalHeight,
          width: totalWidth,
          child: Stack(
            children: [
              MapWidget(),
              // panelBodyLogic == true
              //     ? Container(
              //         height: totalHeight * 0.2,
              //         width: totalWidth * 1,
              //         color: Colors.black.withOpacity(0.6),
              //       )
              //     : SizedBox(),
              Positioned(
                top: totalHeight * 0.06,
                left: totalWidth * 0.03,
                child: Text(
                  "MatchMap",
                  style: TextStyle(
                    fontFamily: "Gilroy",
                    fontWeight: FontWeight.w900,
                    fontSize: totalHeight * 0.027,
                  ),
                ),
              ),
              Positioned(
                top: totalHeight * 0.06,
                right: totalWidth * 0.03,
                child: Container(
                  height: totalHeight * 0.1,
                  width: totalWidth * 0.13,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20.0,
                        width: 20.0,
                        child: GestureDetector(
                          onTap: () {
                            openPanel(_controller);
                            Provider.of<FilterProvider>(context, listen: false)
                                .changePanelBody();
                          },
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.asset('assets/images/filter.png'),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Divider(),
                      SizedBox(
                        height: 3.0,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.asset('assets/images/direction.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
