import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pokedex/constants/colors.dart';
import 'package:pokedex/screens/pokemon.dart';

class EvolutionsTab extends StatefulWidget {
  final String pokename;
  final Map<String, dynamic> pokedata;
  EvolutionsTab({this.pokename, this.pokedata});

  @override
  _EvolutionsTabState createState() => _EvolutionsTabState();
}

class _EvolutionsTabState extends State<EvolutionsTab> {
  List<Widget> evolutions = [];

  getevolutions() async {
    List<Widget> temp = [
      SizedBox(
        height: 15.0 * (MediaQuery.of(context).size.height / 1010.5),
      ),
    ];
    var evollist = widget.pokedata['evolution'];
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/data/pkmnData.json");
    var jsonResult = json.decode(data);
    evollist.forEach(
      (k, v) {
        List<Widget> typelist = [];
        print(k.toString().toLowerCase());
        for (var j = 0;
            j < jsonResult[k.toString().toLowerCase()]['type'].length;
            j++) {
          typelist.add(
            Padding(
              padding: EdgeInsets.only(
                left: 10.0 * (MediaQuery.of(context).size.width / 454.7),
                right: 10.0 * (MediaQuery.of(context).size.width / 454.7),
                top: 12.5 * (MediaQuery.of(context).size.height / 1010.5),
              ),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: colors[jsonResult[k.toString().toLowerCase()]['type']
                          [j]
                      .toString()
                      .toLowerCase()],
                  borderRadius: new BorderRadius.circular(
                      10.0 * (MediaQuery.of(context).size.width / 454.7)),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 30 * (MediaQuery.of(context).size.width / 454.7),
                      right: 30 * (MediaQuery.of(context).size.width / 454.7),
                      top: 5 * (MediaQuery.of(context).size.height / 1010.5),
                      bottom:
                          5 * (MediaQuery.of(context).size.height / 1010.5)),
                  child: Text(
                    jsonResult[k.toString().toLowerCase()]['type'][j]
                        .toString()
                        .toUpperCase(),
                    textScaleFactor: 1.0,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize:
                          10.8 * (MediaQuery.of(context).size.width / 454.7),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        temp.add(
          Card(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PokePage(
                        pokename: k.toString().toLowerCase(),
                      ),
                    ));
              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: (jsonResult[k.toString().toLowerCase()]['type']
                                .length >
                            1)
                        ? [
                            colorsgrad[jsonResult[k.toString().toLowerCase()]
                                    ['type'][1]
                                .toString()
                                .toLowerCase()],
                            colorsgrad[jsonResult[k.toString().toLowerCase()]
                                    ['type'][0]
                                .toString()
                                .toLowerCase()],
                          ]
                        : [
                            colorsgrad[jsonResult[k.toString().toLowerCase()]
                                    ['type'][0]
                                .toString()
                                .toLowerCase()],
                            colorsgrad[jsonResult[k.toString().toLowerCase()]
                                    ['type'][0]
                                .toString()
                                .toLowerCase()],
                          ],
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Hero(
                        tag: k.toString().toLowerCase(),
                        child: Image.network(
                          jsonResult[k.toString().toLowerCase()]['sprite'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 8,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 10 *
                                          (MediaQuery.of(context).size.width /
                                              454.7)),
                                  child: Text(
                                    k,
                                    textAlign: TextAlign.left,
                                    textScaleFactor: 1.0,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 18 *
                                          (MediaQuery.of(context).size.width /
                                              454.7),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    right: 15.0 *
                                        (MediaQuery.of(context).size.width /
                                            454.7),
                                  ),
                                  child: Text(
                                    '#' +
                                        jsonResult[k.toString().toLowerCase()]
                                                ['number']
                                            .toString(),
                                    textScaleFactor: 1.0,
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                      fontSize: 13.5 *
                                          (MediaQuery.of(context).size.width /
                                              454.7),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 8,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 10 *
                                          (MediaQuery.of(context).size.width /
                                              454.7)),
                                  child: Text(
                                    v.split('(')[1].split(')')[0],
                                    textAlign: TextAlign.left,
                                    textScaleFactor: 1.0,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 13.5 *
                                          (MediaQuery.of(context).size.width /
                                              454.7),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: typelist,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
    temp.add(
      SizedBox(
        height: 50 * (MediaQuery.of(context).size.height / 1010.5),
      ),
    );
    setState(() {
      evolutions = temp;
    });
  }

  @override
  void didChangeDependencies() {
    getevolutions();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView(
        shrinkWrap: true,
        children: evolutions,
      ),
    );
  }
}
