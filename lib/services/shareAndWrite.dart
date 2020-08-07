import 'dart:io';
import 'dart:typed_data';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:launch_review/launch_review.dart';
import 'package:pokedex/constants/commonFunctions.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:permission_handler/permission_handler.dart';

class ShareAndWrite {
  ShareAndWrite();
  sharemyapp() {
    var link = "https://play.google.com/store/apps/details?id=un.shh.pokedex";
    try {
      Share.text(
          'Try This Amazing Pokedex',
          'Awesome UI with information about all the Pok\u00e9mon.\nDownload the app using this link\n ' +
              link,
          'text/css');
    } catch (e) {
      print('error: $e');
    }
  }

  sharemywithImage(pokename) async {
    var link = "https://play.google.com/store/apps/details?id=un.shh.pokedex";
    try {
      var request = await HttpClient().getUrl(Uri.parse(
        "https://raw.githubusercontent.com/abhiratt/pokecards/master/images/" +
            pokename.toString().toLowerCase().split(' ').join('_') +
            ".png",
      ));
      var response = await request.close();
      Uint8List bytes = await consolidateHttpClientResponseBytes(response);
      await Share.file(
          link, capitalizeName(pokename) + '.png', bytes, 'image/png',
          text: "I got this Pok\u00e9Card of " +
              capitalizeName(pokename) +
              " from the Pok\u00e9dex app.\n Check out the app from playstore : \n" +
              link);
    } catch (e) {
      print('error: $e');
    }
  }

  _requestPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();

    final _ = statuses[Permission.storage].toString();
  }

  downloadpokemon(pokemonName) async {
    _requestPermission();
    List<String> w = pokemonName.toString().toLowerCase().split(" ");
    var response = await Dio().get(
        "https://raw.githubusercontent.com/abhiratt/pokecards/master/images/" +
            w.join('_') +
            ".png",
        options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(
      Uint8List.fromList(response.data),
      quality: 60,
      name: capitalizeName(pokemonName),
    );
    print(result);
    _toastInfo(
        capitalizeName(pokemonName) + "'s Pok\u00e9Card has been downloaded.");
  }

  rateus() {
    LaunchReview.launch(androidAppId: "un.shh.pokedex", writeReview: true);
  }

  sendMail() async {
    // Android and iOS
    const uri =
        'mailto:developandroidmobileapps@gmail.com?subject=Suggestions/Feedback - Pok\u00e9dex&body=\n';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }

  _toastInfo(String info) {
    Fluttertoast.showToast(
        msg: info,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.black);
  }
}
