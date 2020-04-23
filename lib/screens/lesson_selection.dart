import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pianoscope/screens/songs_page.dart';

class LessonSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
                      image: AssetImage('assets/images/scales.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  constraints: BoxConstraints.expand(),
                  child: FlatButton(
                    onPressed: () {
//                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SongsPage()));
                    },
                    padding: EdgeInsets.only(left: 35.0, right: 10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Scales',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 48.0,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          Text(
                            'Train your fundamentals',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
                      image: AssetImage('assets/images/chords.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  constraints: BoxConstraints.expand(),
                  child: FlatButton(
                    onPressed: () {
//                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SongsPage()));
                    },
                    padding: EdgeInsets.only(left: 20.0, right: 40.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'Chords',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 48.0,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          Text(
                            'Learn the harmony of notes',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.65), BlendMode.darken),
                      image: AssetImage('assets/images/songs.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  constraints: BoxConstraints.expand(),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SongsPage()));
                    },
                    padding: EdgeInsets.only(left: 40.0, right: 10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Songs',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 48.0,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          Text(
                            'Master songs of varying difficulty',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 20.0,
            left: 2.0,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              iconSize: 30.0,
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          )
        ],
      ),
    );
  }
}
