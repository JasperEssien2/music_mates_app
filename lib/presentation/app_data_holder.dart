import 'package:music_mates_app/data/data_export.dart';

class AppDataHolder {
  late String googleId;

  late UserModel _currentUser;

  UserModel get currentUser => _currentUser;

  late List<UserModel> _musicMates;
  List<UserModel> get musicMates => _musicMates;


  set appData(Map<String, dynamic> data) {
    _musicMates = UserList.musicMatesJson(data).users;

    _currentUser = UserModel.fromJson(data['userInfo']);

   
  }
}
