import 'package:flutter/material.dart';
import 'package:pianoscope/screens/lesson_selection.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

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
              Container(
                padding: EdgeInsets.only(top: 20.0),
                height: screenHeight / 4,
                constraints: BoxConstraints(minWidth: screenWidth),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.purpleAccent, Colors.tealAccent],
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
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                text: 'scope',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(3.0, 2.0, 3.0, 10.0),
                    child: Text(
                      'Twinkle Twinkle Little Star',
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
              ),
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.topRight,
                  child: RaisedButton(
                    elevation: 20.0,
                    shape: const CircleBorder(),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LessonSelection()));
                    },
                    padding: EdgeInsets.zero,
                    color: Colors.transparent,
                    textColor: Colors.white,
                    child: Container(
                      height: screenWidth / 6,
                      width: screenWidth / 6,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.purpleAccent,
                            Colors.tealAccent,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.music_note,
                          size: screenWidth / 10,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Container(
                height: screenHeight / 8,
                child: RaisedButton(
                  elevation: 20.0,
                  onPressed: () {},
                  padding: const EdgeInsets.all(0.0),
                  color: Colors.transparent,
                  textColor: Colors.white,
                  child: Container(
                    height: screenHeight / 8,
                    width: screenWidth / 2.25,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.purpleAccent,
                          Colors.tealAccent,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: const Text(
                        'Play',
                        style: TextStyle(fontSize: 40),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(),
              ),
              Container(
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
