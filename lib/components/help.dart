import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pianoscope/screens/home_page.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight / 1.5,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.greenAccent, Colors.lightBlueAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
              ),
              child: Center(
                child: Text(
                  'How to Use',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
              width: screenWidth,
              color: Colors.white,
              child: SingleChildScrollView(
                physics: ScrollPhysics(),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w300,
                    ),
                    children: <InlineSpan>[
                      TextSpan(text: 'Welcome to Pianoscope!'),
                      TextSpan(text: '\n\nTo get started, tap '),
                      TextSpan(text: 'New Lesson', style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: ' and choose from '),
                      TextSpan(text: 'Scales', style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: ', '),
                      TextSpan(text: 'Chords', style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: ', or '),
                      TextSpan(text: 'Songs', style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: '.'),
                      TextSpan(text: '\n\nFrom the '),
                      TextSpan(text: 'Scales', style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: ' or '),
                      TextSpan(text: 'Chords', style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: ' page, select the key and scale/chord you want to play and tap '),
                      WidgetSpan(
                        child: _playButton(),
                        alignment: PlaceholderAlignment.middle,
                      ),
                      TextSpan(text: '.'),
                      TextSpan(text: '\n\nFrom the '),
                      TextSpan(text: 'Songs', style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: ' page, select from the list of songs or upload your own, and then tap '),
                      WidgetSpan(
                        child: _playButton(),
                        alignment: PlaceholderAlignment.middle,
                      ),
                      TextSpan(text: '.'),
                      TextSpan(text: '\n\nTap the '),
                      WidgetSpan(
                        child: Icon(Icons.settings, size: 21.0),
                        baseline: TextBaseline.alphabetic,
                        alignment: PlaceholderAlignment.bottom,
                      ),
                      TextSpan(text: ' icon to open '),
                      TextSpan(text: 'Settings', style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: ' where you can adjust the look of the Augmented Reality piano key overlays.'),
                      TextSpan(text: '\n\nWhen you\'re ready to go, press '),
                      TextSpan(text: 'Play', style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: ' from the home screen, point your camera at your piano or keyboard,'),
                      TextSpan(text: ' and play the keys as they light up!'),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _playButton() {
    return Container(
      height: 20.0,
      width: 20.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.greenAccent, Colors.lightBlueAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Icon(
          Icons.play_arrow,
          size: 15.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
