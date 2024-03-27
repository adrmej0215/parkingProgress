import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:page_transition/page_transition.dart';
import 'package:parking/screens/list_screen.dart';
import 'package:parking/screens/settings_screen.dart';
import 'package:parking/models/navigation_bar.dart'; // Import the navigation bar model
import 'package:parking/services/lot.dart';
import 'package:parking/services/lotListForMap.dart';

class MapScreen extends StatefulWidget {
  final NavigationBarModel navigationBarModel;

  const MapScreen(this.navigationBarModel, {Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    setState(() {});
    const Ecoords = LatLng(26.307153008930648, -98.17271645927416);
    const Bcoords = LatLng(25.89390054163558, -97.4869341572851);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Screen'),
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
      body: FlutterMap(
        mapController: MapController(), // Assign the map controller
        options:  MapOptions(
          // Initial map center
          initialCenter: SettingsScreen.data['Campus'] == 'Edinburg' ? Ecoords : Bcoords,
          initialZoom: 16.0,
          initialRotation: 0,// Initial zoom level
          onTap: (tapPosition, point) => {
            print(point.toString()),
          },
        ),
        children: [
          TileLayer(
            // Tile provider URL
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            // Subdomains for the tile provider
            subdomains: ['a', 'b', 'c'],
          ),
          //OverlayImageLayer(overlayImages: lotList2),
          PolygonLayer(polygons: lotColor(),
          polygonLabels: true,)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: widget.navigationBarModel.items.map((item) {
          return BottomNavigationBarItem(
            icon: Icon(item.iconData),
            label: item.label,
          );
        }).toList(),
        currentIndex: 1, // Set initial selected index
        selectedItemColor: Colors.orange, // Change color of selected icon
        unselectedItemColor: Colors.grey, // Change color of unselected icons
        onTap: (index) {
          // Handle navigation here based on the index
          switch (index) {
            case 0:
              // Navigate to list screen
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: ListScreen(widget.navigationBarModel),
                ),
              );
              break;
            case 2:
              // Navigate to settings screen
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
