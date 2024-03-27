// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:parking/services/lot.dart';


Future<void> updateLotInfo(lotIndex) async{
  ParkingLot instance = lotIndex;
  instance.getLots();
}

List<Polygon> lotColor() {

  for(int z=0; z<utrgvLots.length; z++){
    updateLotInfo(utrgvLots[z]);
  }

  dynamic avail = availLots();
  List<Polygon> cols = [];
  Polygon lot;
  for(int i=0; i<avail.length; i++){
         lot = Polygon(points: avail[i].coords,
         color: avail[i].mapcol,
         isFilled: true,
         label: avail[i].name,
         labelStyle: TextStyle(
             fontSize: 20,
             color: Colors.black,
             fontWeight: FontWeight.bold)
         );
    cols.add(lot);
  }
  return cols;
}



// List<Polygon> lotList1 = [
//   OverlayImage(
//       bounds: LatLngBounds(
//         LatLng(26.3095, -98.1700),
//         LatLng(26.3090, -98.1695),
//       ),
//       imageProvider: AssetImage('lib/assets/green.png'),
//       opacity: .3),
//   OverlayImage(
//       bounds: LatLngBounds(
//         LatLng(26.3095, -98.1700),
//         LatLng(26.3090, -98.1705),
//       ),
//       imageProvider: AssetImage('lib/assets/yellow.png'),
//       opacity: .3),
//   OverlayImage(
//       bounds: LatLngBounds(
//         LatLng(26.3085, -98.1700),
//         LatLng(26.3090, -98.1695),
//       ),
//       imageProvider: AssetImage('lib/assets/orange.png'),
//       opacity: .3),
//   OverlayImage(
//       bounds: LatLngBounds(
//         LatLng(26.3085, -98.1700), //top left
//         LatLng(26.3090, -98.1705), //bottom right
//       ),
//       imageProvider: AssetImage('lib/assets/red.png'),
//       opacity: .3),
// ];
//
// List<LatLngBounds> coordList = [
//   LatLngBounds(LatLng(26.3095, -98.1700), LatLng(26.3090, -98.1695))
// ];
