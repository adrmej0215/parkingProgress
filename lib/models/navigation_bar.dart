import 'package:flutter/material.dart';

class NavigationBarItem {
  final IconData iconData;
  final String label;

  NavigationBarItem({required this.iconData, required this.label});
}

class NavigationBarModel {
  final List<NavigationBarItem> items;

  NavigationBarModel(this.items);
}
