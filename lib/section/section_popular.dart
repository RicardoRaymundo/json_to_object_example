import 'package:flutter/material.dart';

class SectionMoviesPopular extends StatelessWidget {
  int counter = 0;
  String title;
  Function() pushToSavedWordsScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 0, right: 0),
      height: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(title),
          ),
          Container(
            height: 200,
            child: ListView(
                padding: EdgeInsets.all(3),
                scrollDirection: Axis.horizontal,
                //shrinkWrap: true,
                children: makeContainers(context, pushToSavedWordsScreen)),
          )
        ],
      ),
    );
  }

  List<Widget> makeContainers(context, pushToSavedWordsScreen) {
    List<Container> movieList = [];
    for (int i = 0; i < 6; i++) {
      counter++;
      movieList.add(Container(
          padding: EdgeInsets.all(5),
          height: 200,
          child: GestureDetector(
            onTap: () {
              if (i == 1) {
                //Inicializa a tab minha lista
                //pushToSavedWordsScreen();
                //Navigator.push(context, InfoPage());
              }
            },
            child: Image(
              image: AssetImage("assets/images/" + counter.toString() + ".jpg"),
            ),
          )));
      if (counter == 12) {
        counter = 0;
      }
    }
    return movieList;
  }
}
