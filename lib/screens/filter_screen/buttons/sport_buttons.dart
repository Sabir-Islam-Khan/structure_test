// ignore_for_file: prefer_const_constructors_in_immutables, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:matchmap_app/providers/filter_provider.dart';
import 'package:provider/provider.dart';

class SportButton extends StatefulWidget {
  bool? isSelected;
  String? assetName, sportName, nameForProvider;
  SportButton(
      {Key? key,
      @required this.isSelected,
      @required this.assetName,
      @required this.sportName,
      @required this.nameForProvider})
      : super(key: key);

  @override
  _SportButtonState createState() => _SportButtonState();
}

class _SportButtonState extends State<SportButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Provider.of<FilterProvider>(context, listen: false)
                  .changeSelectedSports(widget.nameForProvider!);
            },
            child: Container(
              height: 45.0,
              width: 45.0,
              decoration: BoxDecoration(
                border: Border.all(
                    color: widget.isSelected == true
                        ? Colors.green
                        : Colors.grey[300]!,
                    width: 2.0),
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Center(
                child: Container(
                  height: 30.0,
                  width: 30.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Image.asset(widget.assetName!),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 3.0,
          ),
          Text(
            widget.sportName!,
            style: TextStyle(
              fontFamily: 'Gilroy',
              fontSize: 10.0,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
