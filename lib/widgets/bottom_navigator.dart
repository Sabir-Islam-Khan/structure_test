import 'package:flutter/material.dart';

 

class CustomBottom extends StatelessWidget {
  const CustomBottom ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(196, 196, 196, 1)),
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                MaterialButton(
                  onPressed: () {}, 
                  child: Icon(Icons.home_outlined)
                  ),
                MaterialButton(
                  onPressed: () {}, 
                  child: Icon(Icons.favorite_border)
                  ),
                MaterialButton(
                  onPressed: () {}, 
                  child: Icon(Icons.search)
                  ),
                MaterialButton(
                  onPressed: () {}, 
                  child: Icon(Icons.person_outline_rounded)
                  )
              ],
            ),
          )
        );
  }
}