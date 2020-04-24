import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pianoscope/screens/home_page.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(this._title);

  final String _title;

  @override
  Size get preferredSize => Size(screenWidth, screenHeight / 12.4);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(screenWidth, screenHeight / 12.4),
      child: Material(
        elevation: 5.0,
        child: Stack(
          children: <Widget>[
            Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.greenAccent, Colors.lightBlueAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            Positioned(
              top: screenHeight / 24.0,
              left: 5.0,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back),
                iconSize: 28.0,
                color: Colors.white,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: screenHeight / 28.0),
                child: Text(
                  _title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
