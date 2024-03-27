// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:parking/services/userData.dart';
import 'package:parking/screens/settings_screen.dart';

//permit
class Permit extends StatefulWidget {
  const Permit({super.key});

  @override
  State<Permit> createState() => _PermitState();
}

class _PermitState extends State<Permit> {

  List permits = ['Resident', 'Zone 1', 'Zone 2', 'Zone 3', 'Administrator', 'Testing'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(240, 80, 35, 1.0),
        title: Text("Select your Permit"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: permits.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
            child: Card(
                child: ListTile(
                  onTap: () async{
                    Navigator.pop(context, {'Campus': SettingsScreen.data['Campus'], 'Permit': index});
                    print('User chose Zone $index');
                    await UserData.storePermit(index);
                  },
                  title: Text('${permits[index]}'),
                )
            ),
          );
        },
      ),

    );
  }
}


//campus
class Campus extends StatefulWidget {
  const Campus({super.key});

  @override
  State<Campus> createState() => _CampusState();
}

class _CampusState extends State<Campus> {

  List campuses = ['UTRGV Edinburg Campus', 'UTRGV Brownsville Campus'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(240, 80, 35, 1.0),
        title: Text("Select your Campus"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
            child: Card(
                child: ListTile(
                  onTap: () async{
                    if (index == 0){Navigator.pop(context, {'Campus': 'Edinburg', 'Permit': SettingsScreen.data['Permit']}); }
                    else {Navigator.pop(context, {'Campus': 'Brownsville', 'Permit': SettingsScreen.data['Permit']}); }
                    print('finished selection');
                    await UserData.storeCampus(index);

                  },
                  title: Text(campuses[index]),
                )
            ),
          );
        },
      ),

    );
  }
}
