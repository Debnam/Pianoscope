import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pianoscope/screens/home_page.dart';

class Settings extends StatefulWidget {
  Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  double playbackSpeed = 1.0;
  List<bool> whiteKeyColor = [true, false, false, false, false];
  List<bool> blackKeyColor = [true, false, false, false, false];
  bool fingering = true;
  bool annotations = false;
  List<bool> musicalConvention = [true, false];
  List<bool> annotationSize = [false, true, false];
  List<bool> annotationBackground = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Settings',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w300,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 15.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Playback Speed: ${playbackSpeed}x',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Slider(
              value: playbackSpeed,
              min: 0.25,
              max: 1.75,
              divisions: 6,
              activeColor: Colors.black,
              inactiveColor: Colors.grey,
              onChanged: (value) {
                setState(() {
                  playbackSpeed = value;
                });
              },
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  'White key highlight color',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: colorOptions(whiteKeyColor),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  'Black key highlight color',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: colorOptions(blackKeyColor),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    'Fingering Numbers',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Switch(
                    value: fingering,
                    activeColor: Colors.black,
                    onChanged: (value) {
                      setState(() {
                        fingering = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    'Key Annotations',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Switch(
                    value: annotations,
                    activeColor: Colors.black,
                    onChanged: (value) {
                      setState(() {
                        annotations = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: annotations ? annotationSettings() : Container(),
          ),
        ],
      ),
    );
  }

  Widget colorOptions(List<bool> isSelected) {
    return Align(
      alignment: Alignment.topCenter,
      child: ToggleButtons(
        fillColor: Colors.transparent,
        splashColor: Colors.transparent,
        isSelected: isSelected,
        renderBorder: false,
        onPressed: (index) {
          for (int i = 0; i < isSelected.length; i++) {
            if (i == index) {
              isSelected[i] = true;
            } else {
              isSelected[i] = false;
            }
          }
          setState(() {});
        },
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 4.0, right: 2.5),
            child: Container(
              height: screenWidth / 5.5,
              width: screenWidth / 5.5,
              color: Colors.blue,
              child: Center(
                child: selectedIcon(0, isSelected),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2.5, right: 2.5),
            child: Container(
              height: screenWidth / 5.5,
              width: screenWidth / 5.5,
              color: Colors.lightGreenAccent,
              child: Center(
                child: selectedIcon(1, isSelected),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2.5, right: 2.5),
            child: Container(
              height: screenWidth / 5.5,
              width: screenWidth / 5.5,
              color: Colors.yellow,
              child: Center(
                child: selectedIcon(2, isSelected),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2.5, right: 2.5),
            child: Container(
              height: screenWidth / 5.5,
              width: screenWidth / 5.5,
              color: Colors.orange,
              child: Center(
                child: selectedIcon(3, isSelected),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2.5, right: 4.0),
            child: Container(
              height: screenWidth / 5.5,
              width: screenWidth / 5.5,
              color: Colors.pinkAccent,
              child: Center(
                child: selectedIcon(4, isSelected),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget selectedIcon(int index, List<bool> isSelected) {
    return isSelected[index] == true
        ? Icon(
            Icons.check_circle,
            color: Colors.white,
          )
        : Container(
            height: 0,
          );
  }

  Widget annotationSettings() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Musical Convention',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: ToggleButtons(
                  onPressed: (index) {
                    setState(() {
                      musicalConvention = index == 0 ? [true, false] : [false, true];
                    });
                  },
                  isSelected: musicalConvention,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5.0),
                      width: screenWidth / 5,
                      child: Center(
                        child: Text('C-D-E'),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      width: screenWidth / 5,
                      child: Center(
                        child: Text('Do-Re-Mi'),
                      ),
                    ),
                  ],
                  color: Colors.black.withOpacity(0.4),
                  highlightColor: Colors.grey.withOpacity(0.25),
                  selectedColor: Colors.white,
                  fillColor: Colors.black,
                  borderRadius: BorderRadius.circular(30.0),
                  constraints: BoxConstraints(minHeight: screenHeight / 18),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Size',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: ToggleButtons(
                  onPressed: (index) {
                    setState(() {
                      annotationSize =
                          index == 0 ? [true, false, false] : index == 1 ? [false, true, false] : [false, false, true];
                    });
                  },
                  isSelected: annotationSize,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5.0),
                      width: screenWidth / 5,
                      child: Center(
                        child: Text('Small'),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      width: screenWidth / 5,
                      child: Center(
                        child: Text('Medium'),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      width: screenWidth / 5,
                      child: Center(
                        child: Text('Large'),
                      ),
                    ),
                  ],
                  color: Colors.black.withOpacity(0.4),
                  highlightColor: Colors.grey.withOpacity(0.25),
                  selectedColor: Colors.white,
                  fillColor: Colors.black,
                  borderRadius: BorderRadius.circular(30.0),
                  constraints: BoxConstraints(minHeight: screenHeight / 18),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Background',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: ToggleButtons(
                  onPressed: (index) {
                    setState(() {
                      annotationBackground =
                          index == 0 ? [true, false, false] : index == 1 ? [false, true, false] : [false, false, true];
                    });
                  },
                  isSelected: annotationBackground,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5.0),
                      width: screenWidth / 5,
                      child: Center(
                        child: Text('None'),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      width: screenWidth / 5,
                      child: Center(
                        child: Text('Circle'),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      width: screenWidth / 5,
                      child: Center(
                        child: Text('Square'),
                      ),
                    ),
                  ],
                  color: Colors.black.withOpacity(0.4),
                  highlightColor: Colors.grey.withOpacity(0.25),
                  selectedColor: Colors.white,
                  fillColor: Colors.black,
                  borderRadius: BorderRadius.circular(30.0),
                  constraints: BoxConstraints(minHeight: screenHeight / 18),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
