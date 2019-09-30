import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SectionMoviesContinueWatching extends StatelessWidget {
  int counter = 0;
  String title;
  final String assetName = 'assets/svg/play.svg';
  Function() pushToSavedWordsScreen;

  SectionMoviesContinueWatching({this.title, this.pushToSavedWordsScreen}) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      height: 220,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(title),
              ),
            ]),
          ),
          Container(
            height: 200,
            child: ListView(
                padding: EdgeInsets.all(3),
                scrollDirection: Axis.horizontal,
                //shrinkWrap: true,
                children: makeContinueContainers(this.pushToSavedWordsScreen)),
          )
        ],
      ),
    );
  }

  List<Widget> makeContinueContainers(pushToSavedWordsScreen) {
    List<Container> movieList = [];
    for (int i = 0; i < 6; i++) {
      counter++;
      movieList.add(Container(
          color: Colors.transparent,
          padding: EdgeInsets.all(2),
          height: 200,
          child: GestureDetector(
            onTap: () {
              if (i == 1) {
                pushToSavedWordsScreen();
              }
            },
            child: Column(
              children: <Widget>[
                Container(
                  height: 140,
                  width: 100,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                        image: new AssetImage("assets/images/" + counter.toString() + ".jpg"), fit: BoxFit.fitHeight),
                  ),
                  child: Center(
                    child: Container(
                      height: 50,
                      width: 50,
                      child: SvgPicture.asset(assetName, semanticsLabel: 'New School'),
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  margin: EdgeInsets.all(3),
                  padding: EdgeInsets.only(left: 10, right: 10),
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.only(right: 25),
                        child: Text(
                          'S1:E' + (i + 1).toString(),
                          style: TextStyle(color: Color(0xffc1c1c1)),
                        ),
                      ),
                      Icon(Icons.info, size: 15, color: Color(0xffc1c1c1))
                    ],
                  ),
                )
              ],
            ),
          )));
      if (counter == 12) {
        counter = 0;
      }
    }
    return movieList;
  }
}
