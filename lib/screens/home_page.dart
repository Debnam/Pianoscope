import 'package:flutter/material.dart';
import 'package:pianoscope/screens/lesson_selection.dart';

double screenHeight;
double screenWidth;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool screenSizeSet = false;

  @override
  Widget build(BuildContext context) {
    if (screenSizeSet == false) {
      screenHeight = MediaQuery.of(context).size.height;
      screenWidth = MediaQuery.of(context).size.width;
      screenSizeSet = true;
    }

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(Colors.black, BlendMode.softLight),
                image: AssetImage('assets/images/pianoscope_background.png'),
                fit: BoxFit.cover,
              ),
            ),
            constraints: BoxConstraints.expand(),
          ),
          Column(
            children: <Widget>[
              oldHeader(),
              songTitle(),
              playButton(),
              expandedContainer(1),
              newLessonButton(),
              expandedContainer(2),
              footer(),
            ],
          ),
        ],
      ),
    );
  }

  Widget header() {
    return Expanded(
      flex: 4,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pianoscope_header.png'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
      ),
    );
  }

  Widget oldHeader() {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      height: screenHeight / 4,
      constraints: BoxConstraints(minWidth: screenWidth),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.greenAccent, Colors.lightBlueAccent],
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 5.0),
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/treble_clef.png'),
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.w300,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Piano',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: 'scope',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget songTitle() {
    return Expanded(
      flex: 6,
      child: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(3.0, 2.0, 3.0, 10.0),
          child: Text(
            'Canon in D - Johann Pachelbel',
            textAlign: TextAlign.center,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget playButton() {
    return Flexible(
      flex: 3,
      child: Container(
        height: screenHeight / 6,
        child: RaisedButton(
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          elevation: 20.0,
          padding: EdgeInsets.zero,
          color: Colors.transparent,
          textColor: Colors.white,
          child: Container(
            height: screenHeight / 6,
            width: screenWidth / 2,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.greenAccent, Colors.lightBlueAccent],
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
              child: const Text(
                'Play',
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget newLessonButton() {
    return Flexible(
      flex: 2,
      child: RaisedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => LessonSelection()));
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 10.0,
        padding: EdgeInsets.zero,
        color: Colors.transparent,
        textColor: Colors.white,
        child: Container(
          height: screenHeight / 12,
          width: screenWidth / 1.75,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.greenAccent, Colors.lightBlueAccent],
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Text(
              'New Lesson',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  Widget footer() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
            iconSize: screenWidth / 9,
            color: Colors.black,
            padding: EdgeInsets.all(15.0),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.help),
            iconSize: screenWidth / 9,
            color: Colors.black,
            padding: EdgeInsets.all(15.0),
          ),
        ],
      ),
    );
  }

  Widget expandedContainer(int flex) {
    return Expanded(
      flex: flex,
      child: Container(),
    );
  }
}
