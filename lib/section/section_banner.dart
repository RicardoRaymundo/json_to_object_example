import 'package:flutter/material.dart';

class SectionMovieBanner extends StatelessWidget {
  final String title;

  SectionMovieBanner({this.title}) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            color: Colors.transparent,
            padding: EdgeInsets.only(left: 10),
            child: Padding(
              padding: const EdgeInsets.only(left: 6.0, bottom: 10),
              child: Text(title),
            ),
          ),
          Container(
            child: Image(
              image: new AssetImage("assets/images/birdboxBanner.jpg"),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 4, bottom: 4),
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  child: Container(
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    width: 140,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.play_arrow,
                          color: Colors.black,
                        ),
                        Text(
                          'Assistir',
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  color: Colors.white,
                  onPressed: () {},
                ),
                FlatButton(
                  child: Container(
                    color: Colors.transparent,
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    width: 140,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        Text(
                          'Minha Lista',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  color: Color(0xff4f4f4f),
                  onPressed: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
