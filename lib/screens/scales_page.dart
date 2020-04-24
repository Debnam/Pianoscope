import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pianoscope/components/custom_app_bar.dart';
import 'package:pianoscope/components/key_selector.dart';
import 'package:pianoscope/states/home_state.dart';
import 'package:pianoscope/states/scales_state.dart';
import 'package:pianoscope/utilities/constants.dart';

class ScalesPage extends StatefulWidget {
  ScalesPage({Key key}) : super(key: key);

  @override
  ScalesPageState createState() => ScalesPageState();
}

class ScalesPageState extends State<ScalesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Choose a scale'),
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Material(
              color: Colors.transparent,
              elevation: 20.0,
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: KeySelector(
                        title: 'Key of',
                        parent: this,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: Text(
                        'Scale',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Center(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButtonFormField(
                              onChanged: (value) {
                                setState(() {
                                  ScalesState.scale = value;
                                });
                              },
                              value: ScalesState.scale,
                              items: scales.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              isExpanded: false,
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.4),
                                fontSize: 20.0,
                                fontWeight: FontWeight.w300,
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                isDense: true,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                    style: BorderStyle.solid,
                                  ),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            ScalesState.note + ScalesState.accidental + ' ${ScalesState.scale}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.lightBlueAccent,
                              fontSize: 32.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 25.0),
                      child: Container(
                        height: 60.0,
                        width: 60.0,
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
                              HomeState.lessonName =
                                  ScalesState.note + ScalesState.accidental + ' ${ScalesState.scale}';
                            },
                            child: Center(
                              child: Icon(
                                Icons.play_arrow,
                                size: 45.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
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
}
