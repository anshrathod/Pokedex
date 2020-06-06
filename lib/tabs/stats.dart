import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class StatsTab extends StatefulWidget {
  final String pokename;
  final Map<String, dynamic> pokedata;

  StatsTab({this.pokename, this.pokedata});

  @override
  _StatsTabState createState() => _StatsTabState(
        pokedata: this.pokedata,
        pokename: this.pokename,
      );
}

class _StatsTabState extends State<StatsTab> {
  var pokedata;
  Widget genderWidget;
  var pokename;

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  _StatsTabState({this.pokename, this.pokedata});
  @override
  Widget build(BuildContext context) {
    double hpval =
        double.parse(widget.pokedata['stats']['HP'].toString()) / 192;
    double attackval =
        double.parse(widget.pokedata['stats']['Attack'].toString()) / 136;
    double defenseval =
        double.parse(widget.pokedata['stats']['Defense'].toString()) / 172;
    double spattackval =
        double.parse(widget.pokedata['stats']['Sp. Atk'].toString()) / 130;
    double spdefenseval =
        double.parse(widget.pokedata['stats']['Sp. Def'].toString()) / 172;
    double speedval =
        double.parse(widget.pokedata['stats']['Speed'].toString()) / 120;
    if (widget.pokedata['gender'].length > 0) {
      genderWidget = ListTile(
        title: Row(
          children: <Widget>[
            Text(
              'Gender',
              textScaleFactor: 1.0,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 22.5 * (MediaQuery.of(context).size.width / 454.7),
              ),
            ),
            SizedBox(
              width: 30.0 * (MediaQuery.of(context).size.width / 454.7),
            ),
            Text(
              "Male:  ",
              textScaleFactor: 1.0,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 18 * (MediaQuery.of(context).size.width / 454.7),
              ),
            ),
            Text(
              widget.pokedata['gender'][0].toString().split(" ")[0],
              textScaleFactor: 1.0,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                color: Colors.blue,
                fontSize: 18 * (MediaQuery.of(context).size.width / 454.7),
              ),
            ),
            SizedBox(
              width: 25.0 * (MediaQuery.of(context).size.width / 454.7),
            ),
            Text(
              "Female:  ",
              textScaleFactor: 1.0,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 18 * (MediaQuery.of(context).size.width / 454.7),
              ),
            ),
            Text(
              widget.pokedata['gender'][1].toString().split(" ")[0],
              textScaleFactor: 1.0,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                color: Colors.pink,
                fontSize: 18 * (MediaQuery.of(context).size.width / 454.7),
              ),
            ),
          ],
        ),
        subtitle: CircularPercentIndicator(
          radius: MediaQuery.of(context).size.width / 3,
          lineWidth: 25.0 * (MediaQuery.of(context).size.height / 1010.5),
          animation: true,
          animationDuration: 1200,
          percent: double.parse(
                  widget.pokedata['gender'][0].toString().split('%')[0]) /
              100,
          circularStrokeCap: CircularStrokeCap.butt,
          backgroundColor: Colors.pinkAccent,
          progressColor: Colors.blueAccent,
        ),
      );
    } else {
      genderWidget = ListTile(
        title: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'Gender',
                  textScaleFactor: 1.0,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize:
                        22.5 * (MediaQuery.of(context).size.width / 454.7),
                  ),
                ),
                SizedBox(
                  width: 30.0 * (MediaQuery.of(context).size.width / 454.7),
                ),
                Text(
                  "Male:  ",
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: 18 * (MediaQuery.of(context).size.width / 454.7),
                  ),
                ),
                Text(
                  "0%",
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: Colors.blue,
                    fontSize: 18 * (MediaQuery.of(context).size.width / 454.7),
                  ),
                ),
                SizedBox(
                  width: 25.0 * (MediaQuery.of(context).size.width / 454.7),
                ),
                Text(
                  "Female:  ",
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: 18 * (MediaQuery.of(context).size.width / 454.7),
                  ),
                ),
                Text(
                  "0%",
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: Colors.pink,
                    fontSize: 18 * (MediaQuery.of(context).size.width / 454.7),
                  ),
                ),
              ],
            ),
            Center(
              child: Text(
                capitalize(pokename) + ' has no gender. ',
                textScaleFactor: 1.0,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                  fontSize: 17.5 * (MediaQuery.of(context).size.width / 454.7),
                ),
              ),
            ),
          ],
        ),
        subtitle: CircularPercentIndicator(
          radius: MediaQuery.of(context).size.width / 3,
          lineWidth: 25.0 * (MediaQuery.of(context).size.height / 1010.5),
          animation: true,
          animationDuration: 1200,
          percent: double.parse("0"),
          circularStrokeCap: CircularStrokeCap.butt,
        ),
      );
    }
    return Card(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(
            height: 10.0 * (MediaQuery.of(context).size.height / 1010.5),
          ),
          genderWidget,
          ListTile(
            title: Text(
              'HP',
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
              percent: (hpval < 1) ? hpval : 1.0,
              center: Text(
                widget.pokedata['stats']['HP'],
                textScaleFactor: 1.0,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: (hpval > 0.5) ? Colors.white : Colors.black,
                  fontSize: 11.25 * (MediaQuery.of(context).size.width / 454.7),
                ),
              ),
              progressColor: Colors.red[600],
            ),
          ),
          ListTile(
            title: Text(
              'Attack',
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
              percent: (attackval < 1) ? attackval : 1.0,
              center: Text(
                widget.pokedata['stats']['Attack'],
                textScaleFactor: 1.0,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: (attackval > 0.5) ? Colors.white : Colors.black,
                  fontSize: 11.25 * (MediaQuery.of(context).size.width / 454.7),
                ),
              ),
              progressColor: Colors.green[600],
            ),
          ),
          ListTile(
            title: Text(
              'Defense',
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
              percent: (defenseval < 1) ? defenseval : 1.0,
              center: Text(
                widget.pokedata['stats']['Defense'],
                textScaleFactor: 1.0,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: (defenseval > 0.5) ? Colors.white : Colors.black,
                  fontSize: 11.25 * (MediaQuery.of(context).size.width / 454.7),
                ),
              ),
              progressColor: Colors.indigo[600],
            ),
          ),
          ListTile(
            title: Text(
              'Special Attack',
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
              percent: (spattackval < 1) ? spattackval : 1.0,
              center: Text(
                widget.pokedata['stats']['Sp. Atk'],
                textScaleFactor: 1.0,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: (spattackval > 0.5) ? Colors.white : Colors.black,
                  fontSize: 11.25 * (MediaQuery.of(context).size.width / 454.7),
                ),
              ),
              progressColor: Colors.lightGreen[600],
            ),
          ),
          ListTile(
            title: Text(
              'Special Defense',
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
              percent: (spdefenseval < 1) ? spdefenseval : 1.0,
              center: Text(
                widget.pokedata['stats']['Sp. Def'],
                textScaleFactor: 1.0,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: (spdefenseval > 0.5) ? Colors.white : Colors.black,
                  fontSize: 11.25 * (MediaQuery.of(context).size.width / 454.7),
                ),
              ),
              progressColor: Colors.blue[600],
            ),
          ),
          ListTile(
            title: Text(
              'Speed',
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
              percent: (speedval < 1) ? speedval : 1.0,
              center: Text(
                widget.pokedata['stats']['Speed'],
                textScaleFactor: 1.0,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: (speedval > 0.5) ? Colors.black : Colors.black,
                  fontSize: 11.25 * (MediaQuery.of(context).size.width / 454.7),
                ),
              ),
              progressColor: Colors.limeAccent,
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
