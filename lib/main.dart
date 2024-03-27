// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:parking/screens/splash_screen.dart';
import 'package:parking/models/navigation_bar.dart'; // Import the navigation bar model
import 'package:parking/services/BusVolt.dart';
import 'package:parking/services/selection.dart';
import 'package:parking/services/userData.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await UserData.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final NavigationBarModel navigationBarModel = NavigationBarModel([
    NavigationBarItem(iconData: Icons.format_list_bulleted, label: 'List'),
    NavigationBarItem(iconData: Icons.map, label: 'Map'),
    NavigationBarItem(iconData: Icons.settings_outlined, label: 'Settings'),
    // Add more items as needed
  ]);

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(navigationBarModel: navigationBarModel),
    routes: {
      '/bus': (context) => Bus(),
      '/volt': (context) => Volt(),
      '/permit': (context) => Permit(),
      '/campus': (context) => Campus(),
    }
    );
  }
}
