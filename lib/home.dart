import 'package:flutter/material.dart';
import 'package:pokedex/widgets/navDrawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController editingController = TextEditingController();

  bool _issearching = false;
  Widget textbar;
  Widget searchBar;
  String searchterm = "";
  @override
  void didChangeDependencies() {
    setState(() {
      textbar = Row(
        children: <Widget>[
          Text(
            'P',
            textScaleFactor: 1.0,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 22.5 * (MediaQuery.of(context).size.width / 454.7),
            ),
          ),
          Image.asset(
            "assets/images/pokeball.jpeg",
            width: 15 * (MediaQuery.of(context).size.width / 454.7),
            height: 15 * (MediaQuery.of(context).size.width / 454.7),
          ),
          Text(
            'kédex',
            textScaleFactor: 1.0,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 22.5 * (MediaQuery.of(context).size.width / 454.7),
            ),
          ),
        ],
      );
      searchBar = TextField(
        controller: editingController,
        keyboardType: TextInputType.text,
        onChanged: (val) {
          setState(() {
            searchterm = val;
          });
        },
        autofocus: true,
        cursorColor: Colors.white,
        decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintText: "Name, Number or Types(comma separated)",
            hintStyle: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              color: Colors.white.withOpacity(0.5),
              fontSize: 12.5 * (MediaQuery.of(context).size.width / 454.7),
            )),
        style: TextStyle(
          decoration: TextDecoration.none,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          color: Colors.white,
          fontSize: 20 * (MediaQuery.of(context).size.width / 454.7),
        ),
      );
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: _issearching ? searchBar : textbar,
        actions: <Widget>[
          Padding(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _issearching = !_issearching;
                });
              },
              child: _issearching
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          searchterm = "";
                          _issearching = false;
                          editingController.clear();
                        });
                      },
                      child: Icon(Icons.cancel),
                    )
                  : Icon(Icons.search),
            ),
            padding: EdgeInsets.only(
                right: 15 * (MediaQuery.of(context).size.width / 454.7)),
          )
        ],
      ),
      body: Container(),
    );
  }
}
