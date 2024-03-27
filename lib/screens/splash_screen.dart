import 'dart:async';
import 'package:flutter/material.dart';
import 'package:parking/screens/map_screen.dart'; // Import your map screen
import 'package:parking/models/navigation_bar.dart'; // Import the navigation bar model
import 'package:parking/screens/settings_screen.dart';
import 'package:parking/services/userData.dart';

class SplashScreen extends StatefulWidget {
  final NavigationBarModel navigationBarModel;

  const SplashScreen({Key? key, required this.navigationBarModel})
      : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToMapScreen();
  }

  void _navigateToMapScreen() {
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => MapScreen(widget.navigationBarModel),
        ),
      );
    });
  }
  void setupCampusPermit() async{
    dynamic permitKey = await UserData.loadPermit();
    dynamic campusKey = await UserData.loadCampus();
    SettingsScreen.data = {"Campus": campusKey, "Permit": permitKey};
    print("loaded data: ${SettingsScreen.data}");
  }


  @override
  Widget build(BuildContext context) {
    setupCampusPermit();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text('UTRGV Parking', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
