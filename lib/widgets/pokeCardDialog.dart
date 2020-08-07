import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/constants/commonFunctions.dart';
import 'package:pokedex/services/shareAndWrite.dart';

class PokeCardDialog extends StatelessWidget {
  final String pokename;
  final ShareAndWrite _sw = ShareAndWrite();
  PokeCardDialog({this.pokename});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 100.0,
      // useMaterialBorderRadius: true,
      title: Text(
        (this.pokename.length < 10)
            ? "Download Pok\u00e9Card for " +
                capitalizeName(this.pokename) +
                "."
            : "Download Pok\u00e9Card for \n" +
                capitalizeName(this.pokename) +
                ".",
        textScaleFactor: 1.0,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          color: Colors.black,
          fontSize: 18 * (MediaQuery.of(context).size.width / 454.7),
        ),
      ),
      content: Container(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RawMaterialButton(
                  fillColor: Colors.black,
                  splashColor: Colors.grey,
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Center(
                      child: Text(
                        "Cancel".toUpperCase(),
                        textScaleFactor: 1.0,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize:
                              12 * (MediaQuery.of(context).size.width / 454.7),
                        ),
                      ),
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                ),
                RawMaterialButton(
                  fillColor: Colors.black,
                  splashColor: Colors.grey,
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Center(
                      child: Text(
                        "Download".toUpperCase(),
                        textScaleFactor: 1.0,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize:
                              12 * (MediaQuery.of(context).size.width / 454.7),
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    _sw.downloadpokemon(pokename);
                    Navigator.of(context).pop();
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                ),
                RawMaterialButton(
                  fillColor: Colors.black,
                  splashColor: Colors.grey,
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Center(
                      child: Text(
                        "Share".toUpperCase(),
                        textScaleFactor: 1.0,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize:
                              12 * (MediaQuery.of(context).size.width / 454.7),
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    _sw.sharemywithImage(pokename);
                    Navigator.of(context).pop();
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
