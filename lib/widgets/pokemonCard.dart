import 'package:flutter/material.dart';
import 'package:pokedex/constants/colors.dart';
import 'package:pokedex/constants/commonFunctions.dart';

// ignore: must_be_immutable
class PokemonCard extends StatelessWidget {
  List<dynamic> pokemondata;
  BuildContext context;
  List<Widget> typelist = [];

  PokemonCard({this.pokemondata, this.context}) {
    for (var j = 0; j < pokemondata[2].length; j++) {
      typelist.add(
        Padding(
          padding: EdgeInsets.only(
            left: 10.0 * (MediaQuery.of(context).size.width / 454.7),
            right: 10.0 * (MediaQuery.of(context).size.width / 454.7),
            top: 12.5 * (MediaQuery.of(context).size.height / 1010.5),
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: colors[pokemondata[2][j].toString().toLowerCase()],
              borderRadius: new BorderRadius.circular(
                5.0 * (MediaQuery.of(context).size.width / 454.7),
              ),
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/types/' +
                      pokemondata[2][j].toString().toLowerCase() +
                      '.png',
                  height: 25,
                  width: 25,
                  // fit: BoxFit.fitHeight,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10 * (MediaQuery.of(context).size.width / 454.7),
                    right: 30 * (MediaQuery.of(context).size.width / 454.7),
                    top: 5 * (MediaQuery.of(context).size.height / 1010.5),
                    bottom: 5 * (MediaQuery.of(context).size.height / 1010.5),
                  ),
                  child: Text(
                    pokemondata[2][j].toString().toUpperCase(),
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
              ],
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: (pokemondata[2].length > 1)
                  ? [
                      colorsgrad[pokemondata[2][1].toString().toLowerCase()],
                      colorsgrad[pokemondata[2][0].toString().toLowerCase()],
                    ]
                  : [
                      colorsgrad[pokemondata[2][0].toString().toLowerCase()],
                      colorsgrad[pokemondata[2][0].toString().toLowerCase()],
                    ],
            ),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Hero(
                  tag: pokemondata[0].toString().toLowerCase(),
                  child: Image.network(
                    pokemondata[3],
                    // fit: BoxFit.cover,
                    height: 150,
                    width: 150,
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
                              capitalizeName(pokemondata[0].toString()),
                              textScaleFactor: 1.0,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 25.2 *
                                    (MediaQuery.of(context).size.width / 454.7),
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
                                        454.7)),
                            child: Text(
                              '#' + pokemondata[1].toString(),
                              textScaleFactor: 1.0,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontSize: 13.5 *
                                    (MediaQuery.of(context).size.width / 454.7),
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
    );
  }
}
