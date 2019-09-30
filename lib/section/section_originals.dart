import 'package:flutter/cupertino.dart';

class SectionMoviesOriginals extends StatelessWidget {
  int counter = 0;
  String title;

  SectionMoviesOriginals({this.title}) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30, left: 10),
      height: 400,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              Text(title),
            ]),
          ),
          Container(
            height: 350,
            child: ListView(
                padding: EdgeInsets.only(right: 6),
                scrollDirection: Axis.horizontal,
                //shrinkWrap: true,
                children: makeOriginals()),
          )
        ],
      ),
    );
  }

  List<Widget> makeOriginals() {
    List<Container> movieList = [];
    for (int i = 0; i < 6; i++) {
      counter++;
      movieList.add(new Container(
        margin: EdgeInsets.only(right: 10, top: 10),
        width: 200,
        decoration: new BoxDecoration(
          image: new DecorationImage(
              image: new AssetImage("assets/images/" + counter.toString() + ".jpg"), fit: BoxFit.fitHeight),
        ),
      ));
      if (counter == 12) {
        counter = 0;
      }
    }
    return movieList;
  }
}
