import 'dart:convert';

import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/widgets/pokemonCard.dart';

class AllPoke extends StatefulWidget {
  final searchterm;
  AllPoke({this.searchterm});
  @override
  _AllPokeState createState() => _AllPokeState(searchterm: this.searchterm);
}

class _AllPokeState extends State<AllPoke> {
  var pokemondata;
  var listdata;
  var searchterm;
  _AllPokeState({this.searchterm});

  List<Widget> tileList;

  searchData() async {
    List tempList = [];
    List temp = [];
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/data/pkmnData.json");
    var jsonResult = json.decode(data);
    // print(jsonResult.runtimeType);
    jsonResult.forEach((k, v) {
      print(v["type"].toString());
      if (k
              .toString()
              .toUpperCase()
              .contains(widget.searchterm.toString().toUpperCase()) ||
          v["number"].toString().contains(widget.searchterm.toString()) ||
          v["type"]
              .toString()
              .toUpperCase()
              .split(', ')
              .join(',')
              .split('[')
              .join('')
              .split(']')
              .join("")
              .contains(widget.searchterm.toUpperCase().toString())) {
        temp.add(k);
        temp.add(v["number"]);
        temp.add(v["type"]);
        temp.add(v["sprite"]);
        tempList.add(temp);
        temp = [];
      }
    });
    setState(() {
      pokemondata = jsonResult;
      listdata = tempList;
    });
    makeTiles(listdata);
  }

  @override
  void initState() {
    searchData();
    super.initState();
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    searchData();
  }

  makeTiles(listdata) {
    List<Widget> tempTileList = [];
    for (var i = 0; i < listdata.length; i++) {
      tempTileList.add(
        PokemonCard(
          context: context,
          pokemondata: listdata[i],
        ),
      );
    }
    setState(() {
      tileList = tempTileList;
    });
  }

  @override
  Widget build(BuildContext context) {
    var numItems = 1024;
    ScrollController _semicircleController = ScrollController();
    print("Widget: " + widget.searchterm);
    return DraggableScrollbar.semicircle(
      labelTextBuilder: (offset) {
        print(_semicircleController.position);
        final int currentItem = true
            ? (_semicircleController.offset /
                    _semicircleController.position.maxScrollExtent *
                    numItems)
                .floor()
            : 0;

        return Text("$currentItem");
      },
      labelConstraints: BoxConstraints.tightFor(width: 80.0, height: 30.0),
      controller: _semicircleController,
      child: ListView(
        scrollDirection: Axis.vertical,
        controller: _semicircleController,
        children: tileList,
      ),
    );
  }
}
