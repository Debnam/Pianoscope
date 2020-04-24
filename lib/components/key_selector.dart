import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pianoscope/screens/chords_page.dart';
import 'package:pianoscope/states/chords_state.dart';
import 'package:pianoscope/states/scales_state.dart';
import 'package:pianoscope/utilities/constants.dart';
import 'package:pianoscope/screens/home_page.dart';

class KeySelector extends StatefulWidget {
  KeySelector({Key key, @required this.title, @required this.parent}) : super(key: key);

  final String title;
  final State parent;

  @override
  _KeySelectorState createState() => _KeySelectorState(title, parent);
}

class _KeySelectorState extends State<KeySelector> {
  _KeySelectorState(this._title, this._parent);

  final State _parent;
  final String _title;
  List<bool> _note = [true, false, false, false, false, false, false];
  List<bool> _accidental = [false, true, false];

  @override
  Widget build(BuildContext context) {
    retrieveState();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  _title,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ToggleButtons(
                onPressed: (index) {
                  for (int i = 0; i < _note.length; i++) {
                    if (i == index) {
                      _note[i] = true;
                    } else {
                      _note[i] = false;
                    }
                  }
                  setState(() {
                    setNoteState(index);
                    _parent.setState(() {});
                  });
                },
                isSelected: _note,
                children: _buildChildren(notes),
                color: Colors.grey,
                highlightColor: Colors.grey.withOpacity(0.25),
                selectedColor: Colors.grey,
                fillColor: Colors.tealAccent,
                borderRadius: BorderRadius.circular(50.0),
                borderWidth: 1.5,
                constraints: BoxConstraints(minHeight: 0.0, minWidth: screenWidth / 8.5),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ToggleButtons(
                onPressed: (index) {
                  for (int i = 0; i < _accidental.length; i++) {
                    if (i == index) {
                      _accidental[i] = true;
                    } else {
                      _accidental[i] = false;
                    }
                  }
                  setState(() {
                    setAccidentalState(index);
                    _parent.setState(() {});
                  });
                },
                isSelected: _accidental,
                children: _buildChildren(accidentals),
                color: Colors.black.withOpacity(0.5),
                highlightColor: Colors.grey.withOpacity(0.25),
                selectedColor: Colors.white,
                fillColor: Colors.tealAccent,
                borderRadius: BorderRadius.circular(50.0),
                borderWidth: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildChildren(List<String> strings) {
    return strings.map<Widget>((String string) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          string,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w300,
          ),
        ),
      );
    }).toList();
  }

  void retrieveState() {
    if (_parent is ChordsPageState) {
      _note = ChordsState.noteList;
      _accidental = ChordsState.accidentalList;
    } else {
      _note = ScalesState.noteList;
      _accidental = ScalesState.accidentalList;
    }
  }

  void setNoteState(int index) {
    if (_parent is ChordsPageState) {
      ChordsState.noteList = _note;
      ChordsState.note = notes[index].trim();
    } else {
      ScalesState.noteList = _note;
      ScalesState.note = notes[index].trim();
    }
  }

  void setAccidentalState(int index) {
    String accidental = '';
    if (index == 0) {
      accidental = '-flat';
    } else if (index == 2) {
      accidental = '-sharp';
    }

    if (_parent is ChordsPageState) {
      ChordsState.accidentalList = _accidental;
      ChordsState.accidental = accidental;
    } else {
      ScalesState.accidentalList = _accidental;
      ScalesState.accidental = accidental;
    }
  }
}
