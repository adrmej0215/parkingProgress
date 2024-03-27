// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:parking/screens/map_screen.dart';
import 'package:parking/screens/settings_screen.dart';
import 'package:parking/models/navigation_bar.dart'; // Import the navigation bar model
import 'package:parking/services/lot.dart';

class ListScreen extends StatefulWidget {
  final NavigationBarModel navigationBarModel;


  ListScreen(this.navigationBarModel, {super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  Future<void> updateLotInfo(lotIndex) async{
    ParkingLot instance = lotIndex;
    instance.getLots();
  }

  @override
  Widget build(BuildContext context) {
    for(int z=0; z<utrgvLots.length; z++){
      updateLotInfo(utrgvLots[z]);
    }
    dynamic availableLots = availLots();

    return Scaffold(
      appBar: AppBar(
        title: const Text('List Screen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh Map',
            onPressed: () {
              availLots();
              print('refresh');// handle the press
              setState(() {

              });
            },
          ),
        ],
        centerTitle: true,
        automaticallyImplyLeading: false, // Disable back arrow
      ),
      body: ListView.builder(
          itemCount: availableLots.length,
          itemBuilder: (context, lotIndex) {
            double avail = availableLots[lotIndex].availSpots/availableLots[lotIndex].maxCap*100;

            return Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 2.0, horizontal: 4.0),
                child: Card(
                  child: ListTile(
                    onTap: () {
                      print(availableLots[lotIndex].availSpots);
                    },
                    leading:Text(
                      availableLots[lotIndex].name,
                      style: TextStyle(fontSize: 30.0),
                    ),
                    title: Text('${availableLots[lotIndex].availSpots} available of ${availableLots[lotIndex].maxCap}'),
                    trailing: Text('${avail.toStringAsFixed(2)}%',
                      style: TextStyle(fontSize: 30.0),
                    ),
                    tileColor: availableLots[lotIndex].col,
                    //leading: CircleAvatar(),
                  ),
                )
            );
          }),
      bottomNavigationBar: BottomNavigationBar(
        items: widget.navigationBarModel.items.map((item) {
          return BottomNavigationBarItem(
            icon: Icon(item.iconData),
            label: item.label,
          );
        }).toList(),
        currentIndex: 0, // Set initial selected index
        selectedItemColor: Colors.orange, // Change color of selected icon
        unselectedItemColor: Colors.grey, // Change color of unselected icons
        onTap: (index) {
          // Handle navigation here based on the index
          switch (index) {
            case 1:
              // Navigate to map screen with navigationBarModel
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: MapScreen(widget.navigationBarModel),
                ),
              );
              break;
            case 2:
              // Navigate to settings screen with navigationBarModel
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: SettingsScreen(widget.navigationBarModel),
                ),
              );
              break;
            default:
              // Do nothing or handle other cases
              break;
          }
        },
      ),
    );
  }
}
