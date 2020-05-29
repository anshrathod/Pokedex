import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokedex/constants/colors.dart';
import 'package:pokedex/constants/commonFunctions.dart';
import 'package:pokedex/tabs/about.dart';
import 'package:pokedex/tabs/evolutions.dart';
import 'package:pokedex/tabs/moves.dart';
import 'package:pokedex/tabs/stats.dart';

class PokePage extends StatefulWidget {
  final pokename;
  PokePage({this.pokename});

  @override
  _PokePageState createState() => _PokePageState(pokename: this.pokename);
}

class _PokePageState extends State<PokePage> with TickerProviderStateMixin {
  var pokename;
  var pokemondata;
  _PokePageState({this.pokename});
  TabController _tabController;
  String generation;

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  loadData() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/data/pkmnData.json");
    var jsonResult = json.decode(data);
    setState(() {
      pokemondata = jsonResult[pokename];
    });
    if (int.parse(pokemondata['number']) <= 151) {
      generation = "Gen. I Pokémon";
    } else if (int.parse(pokemondata['number']) <= 251) {
      generation = "Gen. II Pokémon";
    } else if (int.parse(pokemondata['number']) <= 386) {
      generation = "Gen. III Pokémon";
    } else if (int.parse(pokemondata['number']) <= 493) {
      generation = "Gen. IV Pokémon";
    } else if (int.parse(pokemondata['number']) <= 649) {
      generation = "Gen. V Pokémon";
    } else if (int.parse(pokemondata['number']) <= 721) {
      generation = "Gen. VI Pokémon";
    } else if (int.parse(pokemondata['number']) <= 809) {
      generation = "Gen. VII Pokémon";
    } else {
      generation = "Gen. VIII Pokémon";
    }
  }

  getpokemondata() {
    List<Widget> typelist = [];
    for (var j = 0; j < pokemondata['type'].length; j++) {
      typelist.add(
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.only(
              left: 20.0 * (MediaQuery.of(context).size.width / 454.7),
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: colors[pokemondata['type'][j].toString().toLowerCase()],
                borderRadius: new BorderRadius.circular(
                  7.5 * (MediaQuery.of(context).size.width / 454.7),
                ),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/types/' +
                        pokemondata['type'][j].toString().toLowerCase() +
                        '.png',
                    height: 30,
                    width: 30,
                    // fit: BoxFit.fitHeight,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10 * (MediaQuery.of(context).size.width / 454.7),
                      right: 40 * (MediaQuery.of(context).size.width / 454.7),
                      top: 5 * (MediaQuery.of(context).size.height / 1010.5),
                      bottom: 5 * (MediaQuery.of(context).size.height / 1010.5),
                    ),
                    child: Text(
                      pokemondata['type'][j].toString().toUpperCase(),
                      textScaleFactor: 1.0,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontSize:
                            13.5 * (MediaQuery.of(context).size.width / 454.7),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return ListView(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              flex: 7,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height:
                        10.0 * (MediaQuery.of(context).size.height / 1010.5),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 7,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 25.0 *
                                  (MediaQuery.of(context).size.width / 454.7)),
                          child: Text(
                            capitalizeName(pokename.toString()),
                            textScaleFactor: 1.0,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 27 *
                                  (MediaQuery.of(context).size.width / 454.7),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          "#" + pokemondata['number'],
                          textScaleFactor: 1.0,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 22.5 *
                                (MediaQuery.of(context).size.width / 454.7),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width:
                            25.0 * (MediaQuery.of(context).size.width / 454.7),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          pokemondata['species'],
                          textScaleFactor: 1.0,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 17.5 *
                                (MediaQuery.of(context).size.width / 454.7),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width:
                            25.0 * (MediaQuery.of(context).size.width / 454.7),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          generation,
                          textScaleFactor: 1.0,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 17.5 *
                                (MediaQuery.of(context).size.width / 454.7),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height:
                        10.0 * (MediaQuery.of(context).size.height / 1010.5),
                  ),
                  Row(
                    children: typelist,
                  ),
                  SizedBox(
                    height:
                        10.0 * (MediaQuery.of(context).size.height / 1010.5),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Hero(
                tag: pokename.toString().toLowerCase(),
                child: Image.network(
                  pokemondata['sprite'],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2 +
              250 * (MediaQuery.of(context).size.height / 1010.5),
          child: Container(
            child: DefaultTabController(
              initialIndex: 0,
              length: 4,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: PreferredSize(
                  preferredSize:
                      Size.fromHeight(50.0), // here the desired height
                  child: AppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    bottom: TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.black,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            10 * (MediaQuery.of(context).size.width / 454.7),
                          ),
                          topRight: Radius.circular(
                            10 * (MediaQuery.of(context).size.width / 454.7),
                          ),
                        ),
                        color: Colors.white,
                      ),
                      tabs: [
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "ABOUT",
                              textScaleFactor: 1.0,
                              textAlign: TextAlign.start,
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
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "STATS",
                              textScaleFactor: 1.0,
                              textAlign: TextAlign.start,
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
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "EVOLUTIONS",
                              textScaleFactor: 1.0,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontSize: 12.5 *
                                    (MediaQuery.of(context).size.width / 454.7),
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "MOVES",
                              textScaleFactor: 1.0,
                              textAlign: TextAlign.start,
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
                  ),
                ),
                body: TabBarView(
                  children: [
                    AboutTab(
                      pokedata: pokemondata,
                      pokename: pokename,
                    ),
                    StatsTab(),
                    EvolutionsTab(),
                    MovesTab(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Colors.black87,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          "Poke Info",
          textScaleFactor: 1.0,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            color: Colors.white,
            fontSize: 22.5 * (MediaQuery.of(context).size.width / 454.7),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: GestureDetector(
              onTap: () {},
              child: Image.asset(
                'assets/images/pokeball.jpeg',
                height: 150,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(Icons.share),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: (pokemondata['type'].length > 1)
                ? [
                    colorsgrad[pokemondata['type'][1].toString().toLowerCase()],
                    colorsgrad[pokemondata['type'][0].toString().toLowerCase()],
                  ]
                : [
                    colorsgrad[pokemondata['type'][0].toString().toLowerCase()],
                    colorsgrad[pokemondata['type'][0].toString().toLowerCase()],
                  ],
          ),
        ),
        child: getpokemondata(),
      ),
    );
  }
}
