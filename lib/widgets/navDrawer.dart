// import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(
            title: Text(
              'Pokédex',
              textScaleFactor: 1.0,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins',
                fontSize: 40 * (MediaQuery.of(context).size.width / 454.7),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 10 * MediaQuery.of(context).size.height / 1000,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0 * MediaQuery.of(context).size.width / 450,
            ),
            child: Divider(),
          ),
          SizedBox(
            height: 10 * MediaQuery.of(context).size.height / 1000,
          ),
          GestureDetector(
            onTap: () {},
            child: ListTile(
              leading: Icon(Icons.multiline_chart),
              title: Text(
                'Type Chart',
                textScaleFactor: 1.0,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontSize: 18 * (MediaQuery.of(context).size.width / 454.7),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: ListTile(
              leading: Icon(Icons.share),
              title: Text(
                'Share',
                textScaleFactor: 1.0,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontSize: 18 * (MediaQuery.of(context).size.width / 454.7),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: ListTile(
              leading: Icon(Icons.border_color),
              title: Text(
                'Feedback',
                textScaleFactor: 1.0,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontSize: 18 * (MediaQuery.of(context).size.width / 454.7),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: ListTile(
              leading: Icon(Icons.star_border),
              title: Text(
                'Rate US',
                textScaleFactor: 1.0,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontSize: 18 * (MediaQuery.of(context).size.width / 454.7),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: ListTile(
              leading: Icon(Icons.android),
              title: Text(
                'More Apps',
                textScaleFactor: 1.0,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontSize: 18 * (MediaQuery.of(context).size.width / 454.7),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30 * MediaQuery.of(context).size.height / 1000,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0 * MediaQuery.of(context).size.width / 450,
            ),
            child: Divider(),
          ),
          SizedBox(
            height: 20 * MediaQuery.of(context).size.height / 1000,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "v1.0.0 © Rathod Apps",
              textScaleFactor: 1.0,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 15 * (MediaQuery.of(context).size.width / 454.7),
              ),
            ),
          ),
          SizedBox(
            height: 20 * MediaQuery.of(context).size.height / 1000,
          ),
          Center(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Made with ",
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize:
                          15 * (MediaQuery.of(context).size.width / 454.7),
                    ),
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.redAccent,
                  ),
                  Text(
                    " in India",
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize:
                          15 * (MediaQuery.of(context).size.width / 454.7),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
