import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:pianoscope/components/custom_app_bar.dart';
import 'package:pianoscope/models/song.dart';
import 'package:pianoscope/states/home_state.dart';
import 'package:pianoscope/utilities/constants.dart';

class SongsPage extends StatefulWidget {
  SongsPage({Key key}) : super(key: key);

  @override
  _SongsPageState createState() => _SongsPageState();
}

class _SongsPageState extends State<SongsPage> {
  final _textController = TextEditingController();
  FocusNode _focus = FocusNode();

  @override
  void initState() {
    super.initState();
    KeyboardVisibilityNotification().addNewListener(
      onHide: () => _focus.unfocus(),
    );
    _focus.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    if (!_focus.hasFocus) {
      _textController.text = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _focus.unfocus(),
      child: Scaffold(
        appBar: CustomAppBar('Choose a song'),
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[Colors.greenAccent, Colors.lightBlueAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(30.0),
                    elevation: 30.0,
                    child: TextField(
                      focusNode: _focus,
                      controller: _textController,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search for a song...',
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            style: BorderStyle.none,
                          ),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            style: BorderStyle.none,
                          ),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 10.0),
                    child: Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(15.0),
                      elevation: 20.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: ListView.separated(
                          padding: EdgeInsets.only(bottom: 12.0),
                          physics: ScrollPhysics(),
                          itemCount: songs.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (index == 0 && songs[index].title == 'Upload song') {
                              return Padding(
                                padding: const EdgeInsets.only(top: 14.0, bottom: 4.0),
                                child: ListTile(
                                  trailing: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.blue.withOpacity(0.8),
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '+',
                                        style: TextStyle(
                                          fontSize: 32,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    'Upload song',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return ListTile(
                                isThreeLine: true,
                                title: Text(
                                  songs[index].title,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                subtitle: Container(
                                  constraints: BoxConstraints.loose(Size(double.infinity, 50.0)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        songs[index].artist,
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      Text(
                                        describeEnum(songs[index].difficulty),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
//                                      Row(
//                                        mainAxisAlignment: MainAxisAlignment.start,
//                                        children: difficultyIcon(songs[index].difficulty),
//                                      ),
                                    ],
                                  ),
                                ),
                                trailing: Container(
                                  height: 40.0,
                                  width: 40.0,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: <Color>[Colors.lightBlueAccent, Colors.greenAccent],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: Center(
                                    child: FlatButton(
                                      shape: CircleBorder(),
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        Navigator.of(context).pop();
                                        HomeState.lessonName = songs[index].toString();
                                      },
                                      child: Center(
                                        child: Icon(
                                          Icons.play_arrow,
                                          size: 35.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return Divider(
                              height: 24.0,
                              thickness: 0.4,
                              indent: 10.0,
                              endIndent: 10.0,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> difficultyIcon(Difficulty difficulty) {
    List<Widget> icons = <Widget>[];
    int difficultyNumber;

    switch (difficulty) {
      case Difficulty.Easy:
        difficultyNumber = 1;
        break;
      case Difficulty.Medium:
        difficultyNumber = 2;
        break;
      case Difficulty.Hard:
        difficultyNumber = 3;
        break;
      default:
        difficultyNumber = -1;
    }

    for (int i = 0; i < difficultyNumber; i++) {
      icons.add(Icon(
        Icons.music_note,
        size: 16.0,
      ));
    }
    return icons;
  }
}
