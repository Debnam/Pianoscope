import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pianoscope/components/custom_app_bar.dart';
import 'package:pianoscope/screens/home_page.dart';
import 'package:pianoscope/states/settings_state.dart';

class Settings extends StatefulWidget {
  Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Settings'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 18.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Playback speed: ${SettingsState.playbackSpeed}x',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Slider(
              value: SettingsState.playbackSpeed,
              min: 0.25,
              max: 1.75,
              divisions: 6,
              onChanged: (value) {
                setState(() {
                  SettingsState.playbackSpeed = value;
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
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: colorOptions(SettingsState.whiteKeyColor),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  'Black key highlight color',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: colorOptions(SettingsState.blackKeyColor),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    'Fingering numbers',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Switch(
                    value: SettingsState.fingering,
                    activeColor: Colors.blue,
                    onChanged: (value) {
                      setState(() {
                        SettingsState.fingering = value;
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
                    'Key annotations',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Switch(
                    value: SettingsState.annotations,
                    activeColor: Colors.blue,
                    onChanged: (value) {
                      setState(() {
                        SettingsState.annotations = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: SettingsState.annotations ? annotationSettings() : Container(),
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
              color: Color(0xff00e5ff),
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
              color: Color(0xff39ff14).withOpacity(0.8),
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
              color: Colors.yellowAccent,
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
              color: Color(0xffff8438).withOpacity(0.9),
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
              color: Color(0xffff40a0),
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
                'Musical convention',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: ToggleButtons(
                  onPressed: (index) {
                    setState(() {
                      SettingsState.musicalConvention = index == 0 ? [true, false] : [false, true];
                    });
                  },
                  isSelected: SettingsState.musicalConvention,
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
                  fillColor: Colors.blue,
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
                  fontSize: 14,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: ToggleButtons(
                  onPressed: (index) {
                    setState(() {
                      SettingsState.annotationSize =
                          index == 0 ? [true, false, false] : index == 1 ? [false, true, false] : [false, false, true];
                    });
                  },
                  isSelected: SettingsState.annotationSize,
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
                  fillColor: Colors.blue,
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
                  fontSize: 14,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: ToggleButtons(
                  onPressed: (index) {
                    setState(() {
                      SettingsState.annotationBackground =
                          index == 0 ? [true, false, false] : index == 1 ? [false, true, false] : [false, false, true];
                    });
                  },
                  isSelected: SettingsState.annotationBackground,
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
                  fillColor: Colors.blue,
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
