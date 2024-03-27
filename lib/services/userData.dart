import 'package:shared_preferences/shared_preferences.dart';

class UserInfo{
  String UserCampus;
  String UserPermit;

  UserInfo({required this.UserCampus, required this.UserPermit});

}

List campuses = ["Edinburg", "Brownsville"];
List permits = ['Resident', '1', '2', '3', '5'];

class UserData{
  static SharedPreferences _preferences = _preferences;
  static const _keyCampus = 'Campus';
  static const _keyPermit = 'Permit';

  static Future init() async{ _preferences = await SharedPreferences.getInstance(); }


  static Future storeCampus(int campusIndex) async{
    await _preferences.setInt(_keyCampus, campusIndex);
    print('campus saved');
  }

  static Future storePermit(int permitIndex) async{
    await _preferences.setInt(_keyPermit, permitIndex);
    print('permit saved');
  }

  static Future loadCampus() async{
    dynamic campus = _preferences.getInt(_keyCampus) ?? 0;
    if(campus == 0) {
      campus = 'Edinburg';
    } else {
      campus = 'Brownsville';
    }
    print('campus loaded: $campus');
    return campus;
  }

  static Future loadPermit() async{
    int? permit = _preferences.getInt(_keyPermit) ?? 1;
    print('permit loaded: $permit');
    return permit;
  }


}