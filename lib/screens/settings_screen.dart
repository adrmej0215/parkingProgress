// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:parking/screens/list_screen.dart';
import 'package:parking/screens/map_screen.dart';
import 'package:parking/models/navigation_bar.dart'; // Import the navigation bar model
import 'package:page_transition/page_transition.dart';
import 'package:settings_ui/settings_ui.dart';


class SettingsScreen extends StatelessWidget {
  final NavigationBarModel navigationBarModel;

  SettingsScreen(this.navigationBarModel, {Key? key}) : super(key: key);

  static Map data = {};

  @override
  Widget build(BuildContext context) {
    bool themeSwitch = false;
    data = data.isNotEmpty ? data : {'Campus': 'Edinburg', 'Permit': 1};
    data =  {'Campus': 'Edinburg', 'Permit': 3};


    return Scaffold(
      appBar: AppBar(
        title: Text('Settings Screen'),
        centerTitle: true,
        automaticallyImplyLeading: false, // Disable back arrow
      ),
      body: Scaffold(
          body: SettingsList(
              sections: [
                SettingsSection(
                    margin: EdgeInsetsDirectional.fromSTEB(20.0, 50.0, 20.0, 0.0),
                    tiles: [
                      //selecting parking permit
                      SettingsTile(
                        title: Text('Parking Permits'),
                        leading: Icon(Icons.local_parking),
                        onPressed: (_) async {
                          print("choose permit");
                          dynamic result = await Navigator.pushNamed(context, '/permit');
                          data = {
                            'Campus': result['Campus'],
                            'Permit': result['Permit'],
                          };
                          print(data);
                        } ,
                      ),

                      //Selecting campus
                      SettingsTile(
                          title: Text("Campus"),
                          leading: Icon(Icons.location_on),
                          onPressed: (_) async {
                            print("choose campus");
                            dynamic result = await Navigator.pushNamed(context, '/campus');
                            data = {
                              'Campus': result['Campus'],
                              'Permit': result['Permit'],
                            };
                            print(data);

                          }
                      ),

                      //Showing bus/volt routes and times
                      SettingsTile(
                          title: Text("Show Vaquero Express Schedule"),
                          leading: Icon(Icons.directions_bus),
                          onPressed: (_) async {
                            Navigator.pushNamed(context, '/bus');
                            print("show bus");
                            print(data);
                          }
                      ),
                      SettingsTile(
                          title: Text("Show UTRGV Volt Route"),
                          leading: Icon(Icons.bolt),
                          onPressed: (_)  {
                            Navigator.pushNamed(context, '/volt', arguments:{});
                            print("show volt ");
                            print(data);
                          }
                      ),

                      //selecting theme
                      SettingsTile.switchTile(
                        title: Text("Theme"),
                        leading: Icon(Icons.dark_mode),
                        initialValue: themeSwitch,
                        onToggle: (bool value) {
                          print("change theme");
                        },
                      )
                    ]
                )
              ]
          )
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: navigationBarModel.items.map((item) {
          return BottomNavigationBarItem(
            icon: Icon(item.iconData),
            label: item.label,
          );
        }).toList(),
        currentIndex: 2, // Set initial selected index
        selectedItemColor: Colors.orange, // Change color of selected icon
        unselectedItemColor: Colors.grey, // Change color of unselected icons
        onTap: (index) {
          // Handle navigation here based on the index
          switch (index) {
            case 0:
              // Navigate to list screen with page transition
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: ListScreen(navigationBarModel),
                ),
              );
              break;
            case 1:
              // Navigate to map screen with page transition
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: MapScreen(navigationBarModel),
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
