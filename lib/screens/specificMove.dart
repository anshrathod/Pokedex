import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokedex/constants/colors.dart';
import 'package:pokedex/screens/typeChart.dart';

class SpecificMove extends StatefulWidget {
  final pokemove;

  SpecificMove({this.pokemove});
  @override
  _SpecificMoveState createState() =>
      _SpecificMoveState(pokemove: this.pokemove);
}

class _SpecificMoveState extends State<SpecificMove> {
  var pokemove;
  var movedata = {};
  var typechart = {};

  List<Widget> strengthslist = [];
  List<Widget> weaknesslist = [];
  List<Widget> extweaklist = [];
  List<Widget> normallist = [];

  _SpecificMoveState({this.pokemove});

  @override
  void didChangeDependencies() {
    loadMove();
    super.didChangeDependencies();
  }

  loadMove() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/data/moves.json");
    var jsonResult = json.decode(data);
    String data2 = await DefaultAssetBundle.of(context)
        .loadString("assets/data/typechart.json");
    var jsonResult2 = json.decode(data2);
    setState(() {
      movedata = jsonResult[pokemove];
      typechart =
          jsonResult2[jsonResult[pokemove]['type'].toString().toLowerCase()];
    });
    print(typechart);
    getstrengths();
    getweakness();
    getextweakness();
    getnormal();
  }

  getstrengths() {
    List<Widget> temp = [];
    for (var i = 0; i < typechart['strengths'].length; i++) {
      temp.add(
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TypeChart(
                  type: typechart['strengths'][i].toString().toLowerCase(),
                ),
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.only(
              right: 10.0 * (MediaQuery.of(context).size.width / 454.7),
              bottom: 10.0 * (MediaQuery.of(context).size.height / 1010.5),
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color:
                    colors[typechart['strengths'][i].toString().toLowerCase()],
                borderRadius: new BorderRadius.circular(
                  7.5 * (MediaQuery.of(context).size.width / 454.7),
                ),
              ),
              child: Container(
                width: 100 * (MediaQuery.of(context).size.height / 1010.5),
                height: 40 * (MediaQuery.of(context).size.width / 454.7),
                child: Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Image.asset(
                      'assets/images/types/' +
                          typechart['strengths'][i].toString().toLowerCase() +
                          '.png',
                      height: 20,
                      width: 20,
                      // fit: BoxFit.fitHeight,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Center(
                      child: Text(
                        typechart['strengths'][i].toString().toUpperCase(),
                        textAlign: TextAlign.justify,
                        textScaleFactor: 1.0,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 13.5 *
                              (MediaQuery.of(context).size.width / 454.7),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
    setState(() {
      strengthslist = temp;
    });
  }

  getweakness() {
    List<Widget> temp2 = [];
    print(typechart['weakness']);
    for (var i = 0; i < typechart['weakness'].length; i++) {
      temp2.add(
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TypeChart(
                  type: typechart['weakness'][i].toString().toLowerCase(),
                ),
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.only(
              right: 10.0 * (MediaQuery.of(context).size.width / 454.7),
              bottom: 10.0 * (MediaQuery.of(context).size.height / 1010.5),
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color:
                    colors[typechart['weakness'][i].toString().toLowerCase()],
                borderRadius: new BorderRadius.circular(
                  7.5 * (MediaQuery.of(context).size.width / 454.7),
                ),
              ),
              child: Container(
                width: 100 * (MediaQuery.of(context).size.height / 1010.5),
                height: 40 * (MediaQuery.of(context).size.width / 454.7),
                child: Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Image.asset(
                      'assets/images/types/' +
                          typechart['weakness'][i].toString().toLowerCase() +
                          '.png',
                      height: 20,
                      width: 20,
                      // fit: BoxFit.fitHeight,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Center(
                      child: Text(
                        typechart['weakness'][i].toString().toUpperCase(),
                        textAlign: TextAlign.justify,
                        textScaleFactor: 1.0,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 13.5 *
                              (MediaQuery.of(context).size.width / 454.7),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
    setState(() {
      weaknesslist = temp2;
    });
  }

  getextweakness() {
    List<Widget> temp3 = [];
    for (var i = 0; i < typechart['extreme weakness'].length; i++) {
      temp3.add(
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TypeChart(
                  type:
                      typechart['extreme weakness'][i].toString().toLowerCase(),
                ),
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.only(
              right: 10.0 * (MediaQuery.of(context).size.width / 454.7),
              bottom: 10.0 * (MediaQuery.of(context).size.height / 1010.5),
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: colors[
                    typechart['extreme weakness'][i].toString().toLowerCase()],
                borderRadius: new BorderRadius.circular(
                  7.5 * (MediaQuery.of(context).size.width / 454.7),
                ),
              ),
              child: Container(
                width: 100 * (MediaQuery.of(context).size.height / 1010.5),
                height: 40 * (MediaQuery.of(context).size.width / 454.7),
                child: Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Image.asset(
                      'assets/images/types/' +
                          typechart['extreme weakness'][i]
                              .toString()
                              .toLowerCase() +
                          '.png',
                      height: 20,
                      width: 20,
                      // fit: BoxFit.fitHeight,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Center(
                      child: Text(
                        typechart['extreme weakness'][i]
                            .toString()
                            .toUpperCase(),
                        textScaleFactor: 1.0,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 13.5 *
                              (MediaQuery.of(context).size.width / 454.7),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
    setState(() {
      extweaklist = temp3;
    });
  }

  getnormal() {
    List<Widget> temp4 = [];
    for (var i = 0; i < typechart['normal'].length; i++) {
      temp4.add(
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TypeChart(
                  type: typechart['normal'][i].toString().toLowerCase(),
                ),
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.only(
              right: 10.0 * (MediaQuery.of(context).size.width / 454.7),
              bottom: 10.0 * (MediaQuery.of(context).size.height / 1010.5),
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: colors[typechart['normal'][i].toString().toLowerCase()],
                borderRadius: new BorderRadius.circular(
                  7.5 * (MediaQuery.of(context).size.width / 454.7),
                ),
              ),
              child: Container(
                width: 100 * (MediaQuery.of(context).size.height / 1010.5),
                height: 40 * (MediaQuery.of(context).size.width / 454.7),
                child: Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Image.asset(
                      'assets/images/types/' +
                          typechart['normal'][i].toString().toLowerCase() +
                          '.png',
                      height: 20,
                      width: 20,
                      // fit: BoxFit.fitHeight,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Center(
                      child: Text(
                        typechart['normal'][i].toString().toUpperCase(),
                        textAlign: TextAlign.justify,
                        textScaleFactor: 1.0,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 13.5 *
                              (MediaQuery.of(context).size.width / 454.7),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
    setState(() {
      normallist = temp4;
    });
  }

  getmovedata() {
    return ListView(
      children: <Widget>[
        SizedBox(
          height: 25.0 * (MediaQuery.of(context).size.height / 1010.5),
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 8,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 25.0 * (MediaQuery.of(context).size.width / 454.7),
                ),
                child: Text(
                  pokemove.toString(),
                  textScaleFactor: 1.0,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 36 * (MediaQuery.of(context).size.width / 454.7),
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
                  left: 25.0 * (MediaQuery.of(context).size.width / 454.7),
                ),
                child: ListTile(
                  title: Text(
                    "Description",
                    textScaleFactor: 1.0,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize:
                          22.5 * (MediaQuery.of(context).size.width / 454.7),
                    ),
                  ),
                  subtitle: Text(
                    movedata['effect'].toString(),
                    textScaleFactor: 1.0,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize:
                          13.5 * (MediaQuery.of(context).size.width / 454.7),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 25.0 * (MediaQuery.of(context).size.width / 454.7),
                ),
                child: ListTile(
                  title: Text(
                    "Type",
                    textScaleFactor: 1.0,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize:
                          22.5 * (MediaQuery.of(context).size.width / 454.7),
                    ),
                  ),
                  subtitle: DecoratedBox(
                    decoration: BoxDecoration(
                      color: colors[movedata['type'].toString().toLowerCase()],
                      borderRadius: new BorderRadius.circular(
                        10.0 * (MediaQuery.of(context).size.width / 454.7),
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TypeChart(
                              type: movedata['type'].toString().toLowerCase(),
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          left:
                              10 * (MediaQuery.of(context).size.width / 454.7),
                          right:
                              10 * (MediaQuery.of(context).size.width / 454.7),
                          top: 15 *
                              (MediaQuery.of(context).size.height / 1010.5),
                          bottom: 15 *
                              (MediaQuery.of(context).size.height / 1010.5),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Image.asset(
                              'assets/images/types/' +
                                  movedata['type'].toString().toLowerCase() +
                                  '.png',
                              height: 30,
                              width: 30,
                              // fit: BoxFit.fitHeight,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Center(
                              child: Text(
                                movedata['type'].toString().toUpperCase(),
                                textScaleFactor: 1.0,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontSize: 15.75 *
                                      (MediaQuery.of(context).size.width /
                                          454.7),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 25.0 * (MediaQuery.of(context).size.width / 454.7),
                ),
                child: ListTile(
                  title: Text(
                    "Category",
                    textScaleFactor: 1.0,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize:
                          22.5 * (MediaQuery.of(context).size.width / 454.7),
                    ),
                  ),
                  subtitle: DecoratedBox(
                    decoration: BoxDecoration(
                      color: colorscat[
                          movedata['category'].toString().toLowerCase()],
                      borderRadius: new BorderRadius.circular(
                        10.0 * (MediaQuery.of(context).size.width / 454.7),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 30 * (MediaQuery.of(context).size.width / 454.7),
                        right: 30 * (MediaQuery.of(context).size.width / 454.7),
                        top: 15 * (MediaQuery.of(context).size.height / 1010.5),
                        bottom:
                            15 * (MediaQuery.of(context).size.height / 1010.5),
                      ),
                      child: Center(
                        child: Text(
                          movedata['category'].toString().toUpperCase(),
                          textScaleFactor: 1.0,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 15.75 *
                                (MediaQuery.of(context).size.width / 454.7),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 25.0 * (MediaQuery.of(context).size.width / 454.7),
                ),
                child: ListTile(
                  title: Text(
                    "Power",
                    textScaleFactor: 1.0,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize:
                          13.5 * (MediaQuery.of(context).size.width / 454.7),
                    ),
                  ),
                  subtitle: Text(
                    movedata['power'],
                    textAlign: TextAlign.start,
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize:
                          11.25 * (MediaQuery.of(context).size.width / 454.7),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 25.0 * (MediaQuery.of(context).size.width / 454.7),
                ),
                child: ListTile(
                  title: Text(
                    "Accuracy",
                    textScaleFactor: 1.0,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize:
                          13.5 * (MediaQuery.of(context).size.width / 454.7),
                    ),
                  ),
                  subtitle: Text(
                    movedata['acc'],
                    textAlign: TextAlign.start,
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize:
                          11.25 * (MediaQuery.of(context).size.width / 454.7),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(
                    left: 25.0 * (MediaQuery.of(context).size.width / 454.7)),
                child: ListTile(
                  title: Text(
                    "PP",
                    textScaleFactor: 1.0,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize:
                          13.5 * (MediaQuery.of(context).size.width / 454.7),
                    ),
                  ),
                  subtitle: Text(
                    movedata['pp'],
                    textScaleFactor: 1.0,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize:
                          11.25 * (MediaQuery.of(context).size.width / 454.7),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.only(
                    left: 25.0 * (MediaQuery.of(context).size.width / 454.7)),
                child: ListTile(
                  title: Text(
                    "Effective Probability",
                    textScaleFactor: 1.0,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize:
                          13.5 * (MediaQuery.of(context).size.width / 454.7),
                    ),
                  ),
                  subtitle: Text(
                    movedata['effect_prob'],
                    textScaleFactor: 1.0,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize:
                          11.25 * (MediaQuery.of(context).size.width / 454.7),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.only(
                    left: 25.0 * (MediaQuery.of(context).size.width / 454.7)),
                child: ListTile(
                  title: Text(
                    "TM Number",
                    textScaleFactor: 1.0,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize:
                          13.5 * (MediaQuery.of(context).size.width / 454.7),
                    ),
                  ),
                  subtitle: Text(
                    movedata['tm_number'],
                    textScaleFactor: 1.0,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize:
                          11.25 * (MediaQuery.of(context).size.width / 454.7),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        (typechart['strengths'].length > 0)
            ? Padding(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        25.0 * (MediaQuery.of(context).size.width / 454.7),
                    vertical:
                        5.0 * (MediaQuery.of(context).size.height / 1010.5)),
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                              top: 25.0 *
                                  (MediaQuery.of(context).size.width / 454.7),
                              left: 25.0 *
                                  (MediaQuery.of(context).size.width / 454.7),
                              bottom: 10.0 *
                                  (MediaQuery.of(context).size.width / 454.7),
                            ),
                            child: Text(
                              "STRENGTHS",
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontSize: 22.5 *
                                    (MediaQuery.of(context).size.width / 454.7),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Wrap(
                        runAlignment: WrapAlignment.spaceEvenly,
                        children: strengthslist,
                      ),
                    ],
                  ),
                ),
              )
            : Container(),
        (typechart['weakness'].length > 0)
            ? Padding(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        25.0 * (MediaQuery.of(context).size.width / 454.7),
                    vertical:
                        5.0 * (MediaQuery.of(context).size.height / 1010.5)),
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                              top: 25.0 *
                                  (MediaQuery.of(context).size.width / 454.7),
                              left: 25.0 *
                                  (MediaQuery.of(context).size.width / 454.7),
                              bottom: 10.0 *
                                  (MediaQuery.of(context).size.width / 454.7),
                            ),
                            child: Text(
                              "WEAKNESS",
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontSize: 22.5 *
                                    (MediaQuery.of(context).size.width / 454.7),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Wrap(
                        runAlignment: WrapAlignment.spaceEvenly,
                        children: weaknesslist,
                      ),
                    ],
                  ),
                ),
              )
            : Container(),
        (typechart['extreme weakness'].length > 0)
            ? Padding(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        25.0 * (MediaQuery.of(context).size.width / 454.7),
                    vertical:
                        5.0 * (MediaQuery.of(context).size.height / 1010.5)),
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                              top: 25.0 *
                                  (MediaQuery.of(context).size.width / 454.7),
                              left: 25.0 *
                                  (MediaQuery.of(context).size.width / 454.7),
                              bottom: 10.0 *
                                  (MediaQuery.of(context).size.width / 454.7),
                            ),
                            child: Text(
                              "EXTREME WEAKNESS",
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontSize: 22.5 *
                                    (MediaQuery.of(context).size.width / 454.7),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Wrap(
                        runAlignment: WrapAlignment.spaceEvenly,
                        children: extweaklist,
                      ),
                    ],
                  ),
                ),
              )
            : Container(),
        (typechart['normal'].length > 0)
            ? Padding(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        25.0 * (MediaQuery.of(context).size.width / 454.7),
                    vertical:
                        5.0 * (MediaQuery.of(context).size.height / 1010.5)),
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                              top: 25.0 *
                                  (MediaQuery.of(context).size.width / 454.7),
                              left: 25.0 *
                                  (MediaQuery.of(context).size.width / 454.7),
                              bottom: 10.0 *
                                  (MediaQuery.of(context).size.width / 454.7),
                            ),
                            child: Text(
                              "NORMAL",
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontSize: 22.5 *
                                    (MediaQuery.of(context).size.width / 454.7),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Wrap(
                        runAlignment: WrapAlignment.spaceEvenly,
                        children: normallist,
                      ),
                    ],
                  ),
                ),
              )
            : Container(),
        SizedBox(
          height: 20.0,
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
          "Move Info",
          textScaleFactor: 1.0,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            color: Colors.white,
            fontSize: 22.5 * (MediaQuery.of(context).size.width / 454.7),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 5.0,
        ),
        child: Card(
          color: Colors.white,
          elevation: 0.0,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: colorsgrad[movedata['type'].toString().toLowerCase()],
              borderRadius: new BorderRadius.circular(
                10.0 * (MediaQuery.of(context).size.width / 454.7),
              ),
            ),
            child: getmovedata(),
          ),
        ),
      ),
    );
  }
}
