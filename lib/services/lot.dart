// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:latlong2/latlong.dart';
import 'package:parking/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class ParkingLot{
  String campus;
  List zone;
  String name;
  int maxCap;
  dynamic coords;
  int availSpots = 0;
  List <ParkingSpot> spots = [];
  Color? col = Colors.green[300];
  Color? mapcol = Colors.green[300];


  ParkingLot({required this.name, required this.maxCap, required this.campus, required this.zone, required this.coords});

  void getLots() {
    availSpots = 0;
    for(int i=0; i<maxCap; i++){
      var intValue = Random().nextInt(6) + 1;
      ParkingSpot(spotID: i, occupied: i%intValue == 0 ? true : false);
      i%intValue == 0 ? availSpots++ : availSpots;
    }

    double avail = availSpots/maxCap*100;
    if (avail <= 10){
       mapcol = Color(0x55FF0000);
       col = Colors.red[300];
    }else if(avail <= 20){
       mapcol = Color(0x55FFA200);
       col = Colors.orange[300];
    }else if(avail <= 40){
       mapcol = Color(0x55FFFF00);
       col = Colors.yellow[300];
    }else{
      mapcol = Color(0x5500FF00);
      col = Colors.green[300];
    }
  }
}


class ParkingSpot{
  int spotID = 0;
  bool occupied = false;

  ParkingSpot({required this.spotID, required this.occupied});
}


List availLots(){
  List avail = [];
  for(int i=0; i < utrgvLots.length; i++){
    if(utrgvLots[i].zone[SettingsScreen.data['Permit']] == true && SettingsScreen.data['Campus'] == utrgvLots[i].campus){
      avail.add(utrgvLots[i]);
    }
  }
  print('lots updated');
  return avail;
}

// permits = ['Resident', '1', '2', '3', '5'];
//Example Lot list
List<ParkingLot> utrgvLots = [
  //edinburg
  //coordinates go clockwise starting at top left
  ParkingLot(name: 'E1', maxCap: 100, campus: 'Edinburg', zone: [false, false, false, false, true, true], coords: [LatLng(26.304637, -98.173798),LatLng(26.304648, -98.173545), LatLng(26.304324, -98.173525), LatLng(26.30431, -98.173777)]),
  ParkingLot(name: 'E2', maxCap: 100, campus: 'Edinburg', zone: [false, false, false, false, false, true], coords: [LatLng(26.303981, -98.174014), LatLng(26.303928, -98.173596), LatLng(26.303585, -98.173649), LatLng(26.303648, -98.174065)]),
  ParkingLot(name: 'E3', maxCap: 100, campus: 'Edinburg', zone: [false, false, false, false, false, true], coords: [LatLng(26.304092, -98.174825),LatLng(26.304038, -98.174396), LatLng(26.303691, -98.174459), LatLng(26.303764, -98.174876)]),
  ParkingLot(name: 'E4', maxCap: 100, campus: 'Edinburg', zone: [false, false, false, true, false, true], coords: [LatLng(26.304908, -98.17567), LatLng(26.304941, -98.174957), LatLng(26.304686, -98.174928), LatLng(26.304673, -98.175673)]),
  ParkingLot(name: 'E5', maxCap: 100, campus: 'Edinburg', zone: [false, false, false, true, false, true], coords: [LatLng(26.304242, -98.176602), LatLng(26.30401, -98.175014), LatLng(26.303699, -98.175003), LatLng(26.303942, -98.176658)]),
  ParkingLot(name: 'E6', maxCap: 100, campus: 'Edinburg', zone: [false, false, false, true, false, true], coords: [LatLng(26.303553, -98.173261), LatLng(26.303569, -98.172649), LatLng(26.303407, -98.172638), LatLng(26.303381, -98.173254)]),
  ParkingLot(name: 'E7', maxCap: 100, campus: 'Edinburg', zone: [true, false, false, true, false, true], coords: [LatLng(26.305511, -98.177532), LatLng(26.305527, -98.17682), LatLng(26.304946, -98.176686), LatLng(26.304903, -98.177587)]),
  ParkingLot(name: 'E8', maxCap: 100, campus: 'Edinburg', zone: [false, false, false, true, false, true], coords: [LatLng(26.304765, -98.177588), LatLng(26.30481, -98.176698), LatLng(26.304305, -98.17665), LatLng(26.304278, -98.177513)]),
  ParkingLot(name: 'E9', maxCap: 100, campus: 'Edinburg', zone: [false, true, true, true, true, true], coords: [LatLng(26.310589, -98.176951), LatLng(26.310399, -98.175637), LatLng(26.308699, -98.175942), LatLng(26.308904, -98.177254)]),
  ParkingLot(name: 'E10', maxCap: 100, campus: 'Edinburg', zone: [false, false, false, true, false, true], coords: [LatLng(26.30838, -98.176119), LatLng(26.307987, -98.176087), LatLng(26.308048, -98.175011), LatLng(26.30844, -98.17505)]),
  ParkingLot(name: 'E11', maxCap: 100, campus: 'Edinburg', zone: [false, false, false, true, true, true], coords: [LatLng(26.309968, -98.175705), LatLng(26.30994, -98.175482), LatLng(26.308795, -98.175676), LatLng(26.308749, -98.175495), LatLng(26.308753, -98.17535), LatLng(26.308611, -98.175346), LatLng(26.308613, -98.175641), LatLng(26.308729, -98.175934)]),
  ParkingLot(name: 'E12', maxCap: 100, campus: 'Edinburg', zone: [false, false, false, true, false, true], coords: [LatLng(26.308918, -98.173234), LatLng(26.308621, -98.171142), LatLng(26.308408, -98.171203), LatLng(26.30846, -98.171794), LatLng(26.308416, -98.171856), LatLng(26.308618, -98.17328)]),
  ParkingLot(name: 'E13', maxCap: 100, campus: 'Edinburg', zone: [false, false, false, true, false, true], coords: [LatLng(26.308614, -98.171021), LatLng(26.308437, -98.169793), LatLng(26.308124, -98.169851), LatLng(26.308316, -98.171029)]),
  ParkingLot(name: 'E14', maxCap: 100, campus: 'Edinburg', zone: [false, false, false, true, false, true], coords: [LatLng(26.308574, -98.173293), LatLng(26.308482, -98.172572), LatLng(26.30825, -98.172611), LatLng(26.308352, -98.173334)]),
  ParkingLot(name: 'E15', maxCap: 100, campus: 'Edinburg', zone: [false, false, false, false, false, true], coords: [LatLng(26.308072, -98.174047), LatLng(26.308085, -98.173715), LatLng(26.307966, -98.1737), LatLng(26.307953, -98.174029)]),
  ParkingLot(name: 'E16', maxCap: 100, campus: 'Edinburg', zone: [false, false, true, true, true, true], coords: [LatLng(26.308285, -98.169084), LatLng(26.308162, -98.168252), LatLng(26.305275, -98.168762), LatLng(26.305405, -98.169605), LatLng(26.306058, -98.169489), LatLng(26.306214, -98.169355)]),
  ParkingLot(name: 'E17', maxCap: 100, campus: 'Edinburg', zone: [false, false, false, true, false, true], coords: [LatLng(26.307997, -98.169764), LatLng(26.307913, -98.169174), LatLng(26.307549, -98.169232), LatLng(26.307628, -98.169817)]),
  ParkingLot(name: 'E18', maxCap: 100, campus: 'Edinburg', zone: [false, false, false, true, false, true], coords: [LatLng(26.307361, -98.170707), LatLng(26.307462, -98.169325), LatLng(26.307327, -98.169307), LatLng(26.307231, -98.170646)]),
  ParkingLot(name: 'E19', maxCap: 100, campus: 'Edinburg', zone: [false, false, true, true, true, true], coords: [LatLng(26.303955, -98.171417), LatLng(26.303787, -98.170258), LatLng(26.304312, -98.170177), LatLng(26.304424, -98.169872), LatLng(26.304331, -98.169091), LatLng(26.304021, -98.16914), LatLng(26.303396, -98.170068), LatLng(26.302818, -98.170326), LatLng(26.302993, -98.171581)]),
  ParkingLot(name: 'E20', maxCap: 100, campus: 'Edinburg', zone: [false, false, false, true, false, true], coords: [LatLng(26.303741, -98.16897), LatLng(26.303596, -98.168852), LatLng(26.303462, -98.169055), LatLng(26.303323, -98.168944), LatLng(26.303157, -98.169149), LatLng(26.303463, -98.169388)]),
  ParkingLot(name: 'E21', maxCap: 100, campus: 'Edinburg', zone: [false, true, true, true, true, true], coords: [LatLng(26.307179, -98.168065), LatLng(26.307133, -98.167755), LatLng(26.305237, -98.168077), LatLng(26.304464, -98.168338), LatLng(26.304511, -98.168495)]),
  ParkingLot(name: 'E22', maxCap: 100, campus: 'Edinburg', zone: [false, true, true, true, true, true], coords: [LatLng(26.30916, -98.167728), LatLng(26.309112, -98.167358), LatLng(26.308355, -98.167478), LatLng(26.308414, -98.167866)]),
  ParkingLot(name: 'E23', maxCap: 100, campus: 'Edinburg', zone: [false, true, true, true, true, true], coords: [LatLng(26.309099, -98.167206), LatLng(26.309037, -98.166847), LatLng(26.308482, -98.16695), LatLng(26.308535, -98.167308)]),
  ParkingLot(name: 'E24', maxCap: 100, campus: 'Edinburg', zone: [false, false, false, true, false, true], coords: [LatLng(26.308493, -98.167062), LatLng(26.308471, -98.166927), LatLng(26.308236, -98.166956), LatLng(26.308258, -98.167105)]),
  ParkingLot(name: 'E25', maxCap: 100, campus: 'Edinburg', zone: [false, false, true, true, true, true], coords: [LatLng(26.309523, -98.170425), LatLng(26.309355, -98.169074), LatLng(26.308569, -98.169206), LatLng(26.30877, -98.170549)]),
  ParkingLot(name: 'E26', maxCap: 100, campus: 'Edinburg', zone: [false, false, true, true, true, true], coords: [LatLng(26.309939, -98.173012), LatLng(26.309676, -98.171192), LatLng(26.308899, -98.171373), LatLng(26.309158, -98.173106)]),
  ParkingLot(name: 'E27', maxCap: 100, campus: 'Edinburg', zone: [false, false, true, true, true, true], coords: [LatLng(26.310056, -98.17352), LatLng(26.309958, -98.173154), LatLng(26.309148, -98.173314), LatLng(26.309163, -98.173465), LatLng(26.308771, -98.173521), LatLng(26.308792, -98.173724)]),
  ParkingLot(name: 'E28', maxCap: 100, campus: 'Edinburg', zone: [false, false, false, true, false, true], coords: [LatLng(26.30908, -98.174656), LatLng(26.309016, -98.174012), LatLng(26.308472, -98.174148), LatLng(26.308566, -98.174736)]),
  ParkingLot(name: 'E29', maxCap: 100, campus: 'Edinburg', zone: [false, false, true, true, true, true], coords: [LatLng(26.309729, -98.174251), LatLng(26.309661, -98.173737), LatLng(26.309194, -98.173813), LatLng(26.309272, -98.174356)]),
  ParkingLot(name: 'E30', maxCap: 100, campus: 'Edinburg', zone: [false, false, false, true, false, true], coords: [LatLng(26.310625, -98.174071), LatLng(26.310564, -98.17367), LatLng(26.310266, -98.173718), LatLng(26.310349, -98.174132)]),
  ParkingLot(name: 'E31', maxCap: 100, campus: 'Edinburg', zone: [false, true, true, true, true, true], coords: [LatLng(26.311776, -98.174316), LatLng(26.311626, -98.173483), LatLng(26.310592, -98.173666), LatLng(26.310721, -98.174488)]),
  ParkingLot(name: 'E32', maxCap: 100, campus: 'Edinburg', zone: [false, true, true, true, true, true], coords: [LatLng(26.311581, -98.176823), LatLng(26.311334, -98.174958), LatLng(26.310569, -98.175082), LatLng(26.310843, -98.176931)]),
  ParkingLot(name: 'E33', maxCap: 100, campus: 'Edinburg', zone: [false, true, true, true, true, true], coords: [LatLng(26.313626, -98.174554), LatLng(26.313399, -98.172756), LatLng(26.312071, -98.172917), LatLng(26.312405, -98.17472)]),
  ParkingLot(name: 'E34', maxCap: 100, campus: 'Edinburg', zone: [false, true, true, true, true, true], coords: [LatLng(26.311081, -98.180815), LatLng(26.310773, -98.178613), LatLng(26.310393, -98.178669), LatLng(26.310716, -98.180849)]),
  ParkingLot(name: 'E35', maxCap: 100, campus: 'Edinburg', zone: [false, true, true, true, true, true], coords: [LatLng(26.309784, -98.184682), LatLng(26.309699, -98.183996), LatLng(26.308565, -98.184179), LatLng(26.308693, -98.184868)]),
  ParkingLot(name: 'E36', maxCap: 100, campus: 'Edinburg', zone: [true, false, false, false, false, true], coords: [LatLng(26.309045, -98.179035), LatLng(26.308959, -98.178228), LatLng(26.308679, -98.178272), LatLng(26.308588, -98.177598), LatLng(26.308407, -98.177619), LatLng(26.308603, -98.179118)]),
  ParkingLot(name: 'E37', maxCap: 100, campus: 'Edinburg', zone: [false, false, false, true, false, true], coords: [LatLng(26.308473, -98.179297), LatLng(26.308395, -98.178763), LatLng(26.307549, -98.178904), LatLng(26.307664, -98.179454)]),
  ParkingLot(name: 'E38', maxCap: 100, campus: 'Edinburg', zone: [true, false, false, false, false, true], coords: [LatLng(26.3086, -98.179271), LatLng(26.30839, -98.177621), LatLng(26.308245, -98.177649), LatLng(26.308473, -98.179297)]),
  ParkingLot(name: 'E39', maxCap: 100, campus: 'Edinburg', zone: [false, false, true, true, true, true], coords: [LatLng(26.307092, -98.178519), LatLng(26.306979, -98.177808), LatLng(26.306827, -98.177834), LatLng(26.306896, -98.178378), LatLng(26.306392, -98.178467), LatLng(26.306313, -98.177925), LatLng(26.30615, -98.177944), LatLng(26.306247, -98.178679)]),

  //brownsville
  ParkingLot(name: 'B1', maxCap: 100, campus: 'Brownsville', zone: [false,false,true, true, true, true], coords: [LatLng(25.892374, -97.488736), LatLng(25.892163, -97.487617), LatLng(25.892208, -97.486932), LatLng(25.89197, -97.486591), LatLng(25.892029, -97.486107), LatLng(25.892381, -97.485948), LatLng(25.892562, -97.485024), LatLng(25.89253, -97.484497),
              LatLng(25.892084, -97.484523), LatLng(25.891952, -97.484164), LatLng(25.891237, -97.484486), LatLng(25.890809, -97.48505), LatLng(25.892029, -97.486107), LatLng(25.89197, -97.486591), LatLng(25.89127, -97.486698), LatLng(25.891783, -97.48883)]),
  ParkingLot(name: 'B2', maxCap: 100, campus: 'Brownsville', zone: [false, true, true, true, true, true], coords: [LatLng(25.897193, -97.486192), LatLng(25.896317, -97.484902), LatLng(25.895786, -97.485334), LatLng(25.896708, -97.486599)]),
  ParkingLot(name: 'B3', maxCap: 100, campus: 'Brownsville', zone: [false, true, true, true, true, true], coords: [LatLng(25.896254, -97.484821), LatLng(25.895129, -97.483479), LatLng(25.895035, -97.483544), LatLng(25.894992, -97.484318), LatLng(25.895641, -97.485308)]),
  ParkingLot(name: 'B4', maxCap: 100, campus: 'Brownsville', zone: [false, true, true, true, true, true], coords: [LatLng(25.894932, -97.482065), LatLng(25.895714, -97.48081), LatLng(25.895734, -97.480294), LatLng(25.895261, -97.480262), LatLng(25.895264, -97.480602), LatLng(25.894546, -97.481758)]),
  ParkingLot(name: 'B5', maxCap: 100, campus: 'Brownsville', zone: [false, true, true, true, true, true], coords: [LatLng(25.896648, -97.484462), LatLng(25.896276, -97.483948), LatLng(25.896053, -97.484164), LatLng(25.896395, -97.484669)]),
  ParkingLot(name: 'B6', maxCap: 100, campus: 'Brownsville', zone: [true, false, false, false, false, true], coords: [LatLng(25.896218, -97.482849), LatLng(25.897179, -97.481786), LatLng(25.896487, -97.481285), LatLng(25.896187, -97.481823), LatLng(25.896348, -97.481999), LatLng(25.895803, -97.482853)]),
  ParkingLot(name: 'B7', maxCap: 100, campus: 'Brownsville', zone: [true, false, false, false, false, true], coords: [LatLng(25.896199, -97.481404), LatLng(25.896348, -97.481163), LatLng(25.895898, -97.480837), LatLng(25.895771, -97.481142)]),
  ParkingLot(name: 'B8', maxCap: 100, campus: 'Brownsville', zone: [false, false, true, true, true, true], coords: [LatLng(25.895729, -97.479786), LatLng(25.895736, -97.479547), LatLng(25.894991, -97.479517), LatLng(25.894994, -97.47991), LatLng(25.895211, -97.479927), LatLng(25.895225, -97.479767)]),
  ParkingLot(name: 'B9', maxCap: 100, campus: 'Brownsville', zone: [false, false, true, true, true, true], coords: [LatLng(25.895676, -97.478978), LatLng(25.895689, -97.478675), LatLng(25.89552, -97.47856), LatLng(25.895329, -97.478838), LatLng(25.895318, -97.479398), LatLng(25.895471, -97.479335), LatLng(25.895508, -97.479014)]),
  ParkingLot(name: 'B14', maxCap: 100, campus: 'Brownsville', zone: [false, false, false, true, false, true], coords: [LatLng(25.897785, -97.486068), LatLng(25.897622, -97.485796), LatLng(25.897335, -97.486013), LatLng(25.897509, -97.486278)]),
  
];

