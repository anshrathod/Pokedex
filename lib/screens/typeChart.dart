import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokedex/constants/colors.dart';

class TypeChart extends StatefulWidget {
  final type;
  TypeChart({this.type});
  @override
  _TypeChartState createState() => _TypeChartState(type: type);
}

class _TypeChartState extends State<TypeChart> {
  var type;
  var typechart = {};
  String dropdownValue = "normal";
  List<String> typenames = [
    "normal",
    "fire",
    "water",
    "electric",
    "grass",
    "ice",
    "fighting",
    "poison",
    "ground",
    "flying",
    "psychic",
    "bug",
    "rock",
    "ghost",
    "dragon",
    "dark",
    "steel",
    "fairy",
  ];
  List<Widget> strengthslist = [];
  List<Widget> weaknesslist = [];
  List<Widget> extweaklist = [];
  List<Widget> normallist = [];

  _TypeChartState({this.type});

  @override
  void initState() {
    setState(() {
      dropdownValue = type;
    });
    loadMove(type);
    super.initState();
  }

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  loadMove(dropdownValue) async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/data/typechart.json");
    var jsonResult = json.decode(data);
    setState(() {
      typechart = jsonResult[dropdownValue];
    });
    // print(typechart);
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
                      width: 8.0,
                    ),
                    Image.asset(
                      'assets/images/types/' +
                          typechart['strengths'][i].toString().toLowerCase() +
                          '.png',
                      height: 30,
                      width: 30,
                      // fit: BoxFit.fitHeight,
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
                      width: 8.0,
                    ),
                    Image.asset(
                      'assets/images/types/' +
                          typechart['weakness'][i].toString().toLowerCase() +
                          '.png',
                      height: 30,
                      width: 30,
                      // fit: BoxFit.fitHeight,
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
                      width: 8.0,
                    ),
                    Image.asset(
                      'assets/images/types/' +
                          typechart['extreme weakness'][i]
                              .toString()
                              .toLowerCase() +
                          '.png',
                      height: 30,
                      width: 30,
                      // fit: BoxFit.fitHeight,
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
                      width: 8.0,
                    ),
                    Image.asset(
                      'assets/images/types/' +
                          typechart['normal'][i].toString().toLowerCase() +
                          '.png',
                      height: 30,
                      width: 30,
                      // fit: BoxFit.fitHeight,
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

  gettypedata() {
    return ListView(
      children: <Widget>[
        Container(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 15.0,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 8.0,
                      ),
                      Image.asset(
                        'assets/images/types/' +
                            dropdownValue.toString().toLowerCase() +
                            '.png',
                        height: 30,
                        width: 30,
                        // fit: BoxFit.fitHeight,
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Text(
                        capitalize(dropdownValue),
                        textScaleFactor: 1.0,
                        style: TextStyle(
                          fontSize: 35.0,
                          color: colors[dropdownValue.toLowerCase()],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: Colors.white,
                ),
                child: DropdownButton<String>(
                  focusColor: Colors.white,
                  itemHeight: 60.0,
                  value: dropdownValue,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: colors[dropdownValue.toLowerCase()],
                    size: 30.0,
                  ),
                  elevation: 16,
                  underline: Container(
                    height: 2,
                    color: colors[dropdownValue.toLowerCase()],
                  ),
                  onChanged: (String newValue) {
                    loadMove(newValue.toLowerCase());
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items:
                      typenames.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 8.0,
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/images/types/' +
                                    value.toString().toLowerCase() +
                                    '.png',
                                height: 30,
                                width: 30,
                                // fit: BoxFit.fitHeight,
                              ),
                            ),
                            Text(
                              capitalize(value),
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                fontSize: 24.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Card(
            color: colorsgrad[dropdownValue.toString().toLowerCase()],
            child: Column(
              children: [
                (typechart['strengths'].length > 0)
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 25.0 *
                                (MediaQuery.of(context).size.width / 454.7),
                            vertical: 5.0 *
                                (MediaQuery.of(context).size.height / 1010.5)),
                        child: Card(
                          child: Column(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 25.0 *
                                          (MediaQuery.of(context).size.width /
                                              454.7),
                                      left: 25.0 *
                                          (MediaQuery.of(context).size.width /
                                              454.7),
                                      bottom: 10.0 *
                                          (MediaQuery.of(context).size.width /
                                              454.7),
                                    ),
                                    child: Text(
                                      "STRENGTHS",
                                      textAlign: TextAlign.left,
                                      textScaleFactor: 1.0,
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        fontSize: 22.5 *
                                            (MediaQuery.of(context).size.width /
                                                454.7),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 20.0,
                                      right: 5.0,
                                      bottom: 15.0,
                                    ),
                                    child: Text(
                                      capitalize(dropdownValue) +
                                          " type Attacks will deal 2x damages to pokémons with these types.",
                                      style: TextStyle(
                                        color: Colors.black,
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
                            horizontal: 25.0 *
                                (MediaQuery.of(context).size.width / 454.7),
                            vertical: 5.0 *
                                (MediaQuery.of(context).size.height / 1010.5)),
                        child: Card(
                          child: Column(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 25.0 *
                                          (MediaQuery.of(context).size.width /
                                              454.7),
                                      left: 25.0 *
                                          (MediaQuery.of(context).size.width /
                                              454.7),
                                      bottom: 10.0 *
                                          (MediaQuery.of(context).size.width /
                                              454.7),
                                    ),
                                    child: Text(
                                      "WEAKNESS",
                                      textAlign: TextAlign.left,
                                      textScaleFactor: 1.0,
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        fontSize: 22.5 *
                                            (MediaQuery.of(context).size.width /
                                                454.7),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 20.0,
                                      right: 5.0,
                                      bottom: 15.0,
                                    ),
                                    child: Text(
                                      capitalize(dropdownValue) +
                                          " type Attacks will deal 1/2x damages to pokémons with these types.",
                                      style: TextStyle(
                                        color: Colors.black,
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
                            horizontal: 25.0 *
                                (MediaQuery.of(context).size.width / 454.7),
                            vertical: 5.0 *
                                (MediaQuery.of(context).size.height / 1010.5)),
                        child: Card(
                          child: Column(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 25.0 *
                                          (MediaQuery.of(context).size.width /
                                              454.7),
                                      left: 25.0 *
                                          (MediaQuery.of(context).size.width /
                                              454.7),
                                      bottom: 10.0 *
                                          (MediaQuery.of(context).size.width /
                                              454.7),
                                    ),
                                    child: Text(
                                      "EXTREME WEAKNESS",
                                      textAlign: TextAlign.left,
                                      textScaleFactor: 1.0,
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        fontSize: 22.5 *
                                            (MediaQuery.of(context).size.width /
                                                454.7),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 20.0,
                                      right: 5.0,
                                      bottom: 15.0,
                                    ),
                                    child: Text(
                                      capitalize(dropdownValue) +
                                          " type Attacks will deal no damage to pokémons with these types.",
                                      style: TextStyle(
                                        color: Colors.black,
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
                            horizontal: 25.0 *
                                (MediaQuery.of(context).size.width / 454.7),
                            vertical: 5.0 *
                                (MediaQuery.of(context).size.height / 1010.5)),
                        child: Card(
                          child: Column(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 25.0 *
                                          (MediaQuery.of(context).size.width /
                                              454.7),
                                      left: 25.0 *
                                          (MediaQuery.of(context).size.width /
                                              454.7),
                                      bottom: 10.0 *
                                          (MediaQuery.of(context).size.width /
                                              454.7),
                                    ),
                                    child: Text(
                                      "NORMAL",
                                      textAlign: TextAlign.left,
                                      textScaleFactor: 1.0,
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        fontSize: 22.5 *
                                            (MediaQuery.of(context).size.width /
                                                454.7),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 20.0,
                                      right: 5.0,
                                      bottom: 15.0,
                                    ),
                                    child: Text(
                                      capitalize(dropdownValue) +
                                          " type Attacks will deal 1x damages to pokémons with these types.",
                                      style: TextStyle(
                                        color: Colors.black,
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
              ],
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
          "Type Chart",
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
      body: Container(
        child: gettypedata(),
      ),
    );
  }
}
