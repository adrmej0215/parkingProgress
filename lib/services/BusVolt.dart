// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:parking/screens/settings_screen.dart';

class Volt extends StatefulWidget {
  const Volt({super.key});

  @override
  State<Volt> createState() => _VoltState();
}

class _VoltState extends State<Volt> {
  @override
  Widget build(BuildContext context) {
    String img;
    if(SettingsScreen.data['Campus'] == 'Edinburg'){img = "lib/assets/voltEdinburg.png";} else {img = "lib/assets/voltBrownsville.png";}
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(240, 80, 35, 1.0),
        ),
      body: PhotoView(
        imageProvider: AssetImage(img),
      )
    );
  }
}


class Bus extends StatefulWidget {
  const Bus({super.key});

  @override
  State<Bus> createState() => _BusState();
}

class _BusState extends State<Bus> {

  @override
  Widget build(BuildContext context) {
    //Navigator.pop(context, {'bus finished'});
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(240, 80, 35, 1.0),
        ),
        body: PhotoView(
          imageProvider: AssetImage("lib/assets/busImg.png"),
        )
    );
  }
}
