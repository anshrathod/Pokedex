import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class AboutTab extends StatefulWidget {
  final pokename;
  final pokedata;

  AboutTab({this.pokename, this.pokedata});

  @override
  _AboutTabState createState() => _AboutTabState(
        pokedata: this.pokedata,
        pokename: this.pokename,
      );
}

class _AboutTabState extends State<AboutTab> {
  List<Widget> egggroups = [];
  var pokedata;
  var pokename;
  double catchrateval;
  double basefriendshipval;
  double baseexpval;

  _AboutTabState({this.pokename, this.pokedata});

  getegggroups() {
    List<Widget> temp = [];
    for (var i = 0; i < pokedata['egg_groups'].length; i++) {
      temp.add(
        Padding(
          padding: EdgeInsets.only(),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: new BorderRadius.circular(
                7.5 * (MediaQuery.of(context).size.width / 454.7),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  left: 40 * (MediaQuery.of(context).size.width / 454.7),
                  right: 40 * (MediaQuery.of(context).size.width / 454.7),
                  top: 5 * (MediaQuery.of(context).size.height / 1010.5),
                  bottom: 5 * (MediaQuery.of(context).size.height / 1010.5)),
              child: Text(
                pokedata['egg_groups'][i].toString().toUpperCase(),
                textScaleFactor: 1.0,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  fontSize: 13.5 * (MediaQuery.of(context).size.width / 454.7),
                ),
              ),
            ),
          ),
        ),
      );
      temp.add(SizedBox(
        width: 20.0 * (MediaQuery.of(context).size.width / 454.7),
      ));
    }
    setState(() {
      egggroups = temp;
      catchrateval =
          double.parse(widget.pokedata['catch_rate'].toString()) / 192;
      basefriendshipval =
          double.parse(widget.pokedata['base_friendship'].toString()) / 105;
      baseexpval = double.parse(widget.pokedata['base_exp'].toString()) / 262;
    });
  }

  @override
  void didChangeDependencies() {
    getegggroups();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: false,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(height: 10.0),
          ListTile(
            title: Text(
              'Description',
              textScaleFactor: 1.0,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 22.5 * (MediaQuery.of(context).size.width / 454.7),
              ),
            ),
            subtitle: Text(
              widget.pokedata['pokedex_entry'],
              textScaleFactor: 1.0,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                color: Colors.black54,
                fontSize: 13.5 * (MediaQuery.of(context).size.width / 454.7),
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Height',
              textAlign: TextAlign.start,
              textScaleFactor: 1.0,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 22.5 * (MediaQuery.of(context).size.width / 454.7),
              ),
            ),
            subtitle: Text(
              widget.pokedata['height'].toString(),
              textAlign: TextAlign.start,
              textScaleFactor: 1.0,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                color: Colors.black54,
                fontSize: 13.5 * (MediaQuery.of(context).size.width / 454.7),
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Weight',
              textScaleFactor: 1.0,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 22.5 * (MediaQuery.of(context).size.width / 454.7),
              ),
            ),
            subtitle: Text(
              widget.pokedata['weight'].toString(),
              textAlign: TextAlign.start,
              textScaleFactor: 1.0,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                color: Colors.black54,
                fontSize: 13.5 * (MediaQuery.of(context).size.width / 454.7),
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Egg Groups',
              textAlign: TextAlign.start,
              textScaleFactor: 1.0,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 22.5 * (MediaQuery.of(context).size.width / 454.7),
              ),
            ),
            subtitle: Row(
              children: egggroups,
            ),
          ),
          ListTile(
            title: Text(
              'Catch Rate',
              textScaleFactor: 1.0,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 22.5 * (MediaQuery.of(context).size.width / 454.7),
              ),
            ),
            subtitle: LinearPercentIndicator(
              width: MediaQuery.of(context).size.width -
                  50 * (MediaQuery.of(context).size.width / 454.7),
              animation: true,
              lineHeight: 20 * (MediaQuery.of(context).size.height / 1010.5),
              animationDuration: 2500,
              percent: (catchrateval < 1) ? catchrateval : 1.0,
              center: Text(
                widget.pokedata['catch_rate'],
                textScaleFactor: 1.0,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: (catchrateval > 0.5) ? Colors.white : Colors.black,
                  fontSize: 11.25 * (MediaQuery.of(context).size.width / 454.7),
                ),
              ),
              progressColor: Colors.black87,
            ),
          ),
          ListTile(
            title: Text(
              'Base Friendship',
              textScaleFactor: 1.0,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 22.5 * (MediaQuery.of(context).size.width / 454.7),
              ),
            ),
            subtitle: LinearPercentIndicator(
              width: MediaQuery.of(context).size.width -
                  50 * (MediaQuery.of(context).size.width / 454.7),
              animation: true,
              lineHeight: 20 * (MediaQuery.of(context).size.height / 1010.5),
              animationDuration: 2500,
              percent: (basefriendshipval < 1) ? basefriendshipval : 1.0,
              center: Text(
                widget.pokedata['base_friendship'],
                textScaleFactor: 1.0,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color:
                      (basefriendshipval > 0.5) ? Colors.white : Colors.black,
                  fontSize: 11.25 * (MediaQuery.of(context).size.width / 454.7),
                ),
              ),
              progressColor: Colors.black87,
            ),
          ),
          ListTile(
            title: Text(
              'Base Exp.',
              textScaleFactor: 1.0,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 22.5 * (MediaQuery.of(context).size.width / 454.7),
              ),
            ),
            subtitle: LinearPercentIndicator(
              width: MediaQuery.of(context).size.width -
                  50 * (MediaQuery.of(context).size.width / 454.7),
              animation: true,
              lineHeight: 20 * (MediaQuery.of(context).size.height / 1010.5),
              animationDuration: 2500,
              percent: (baseexpval < 1) ? baseexpval : 1.0,
              center: Text(
                widget.pokedata['base_exp'],
                textScaleFactor: 1.0,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: (baseexpval > 0.5) ? Colors.white : Colors.black,
                  fontSize: 11.25 * (MediaQuery.of(context).size.width / 454.7),
                ),
              ),
              progressColor: Colors.black87,
            ),
          ),
          SizedBox(
            height: 50 * (MediaQuery.of(context).size.height / 1010.5),
          ),
        ],
      ),
    );
  }
}
