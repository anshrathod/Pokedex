import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokedex/constants/colors.dart';
import 'package:pokedex/screens/specificMove.dart';

class MovesTab extends StatefulWidget {
  final String pokename;
  final Map<String, dynamic> pokedata;
  MovesTab({this.pokename, this.pokedata});

  @override
  _MovesTabState createState() => _MovesTabState();
}

class _MovesTabState extends State<MovesTab> {
  List<Widget> pokemoves = [];
  getmoves() async {
    List<Widget> temp = [
      SizedBox(height: 15.0 * (MediaQuery.of(context).size.height / 1010.5)),
    ];
    var evollist = widget.pokedata['moves'];
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/data/moves.json");
    var jsonResult = json.decode(data);
    evollist.forEach(
      (k, v) {
        List<Widget> allmoves = [];
        for (var i = 0; i < v.length; i++) {
          allmoves.add(
            Card(
              color: colors[jsonResult[v[i]]['type'].toString().toLowerCase()],
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SpecificMove(pokemove: v[i]),
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 15.0,
                      ),
                      Image.asset(
                        'assets/images/types/' +
                            jsonResult[v[i]]['type'].toString().toLowerCase() +
                            '.png',
                        height: 30.0,
                        width: 30.0,
                      ),
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: 20.0 *
                                (MediaQuery.of(context).size.height / 1010.5),
                            top: 20.0 *
                                (MediaQuery.of(context).size.height / 1010.5),
                            left: 15.0,
                          ),
                          child: Text(
                            v[i],
                            textAlign: TextAlign.left,
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 13.5 *
                                  (MediaQuery.of(context).size.width / 454.7),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Power: ",
                              textAlign: TextAlign.left,
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 11.25 *
                                    (MediaQuery.of(context).size.width / 454.7),
                              ),
                            ),
                            Text(
                              jsonResult[v[i]]['power'],
                              textAlign: TextAlign.left,
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 11.25 *
                                    (MediaQuery.of(context).size.width / 454.7),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Acc.: ",
                              textScaleFactor: 1.0,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 11.25 *
                                    (MediaQuery.of(context).size.width / 454.7),
                              ),
                            ),
                            Text(
                              jsonResult[v[i]]['acc'],
                              textAlign: TextAlign.right,
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 11.25 *
                                    (MediaQuery.of(context).size.width / 454.7),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        temp.add(
          ListTile(
              title: Text(
                "Level " + k,
                textAlign: TextAlign.start,
                textScaleFactor: 1.0,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: 19.75 * (MediaQuery.of(context).size.width / 454.7),
                ),
              ),
              subtitle: Column(
                children: allmoves,
              )),
        );
      },
    );
    temp.add(
      SizedBox(
        height: 50 * (MediaQuery.of(context).size.height / 1010.5),
      ),
    );
    setState(() {
      pokemoves = temp;
    });
  }

  @override
  void didChangeDependencies() {
    getmoves();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView(
        shrinkWrap: true,
        children: pokemoves,
      ),
    );
  }
}
