import 'package:music_mates_app/data/data_export.dart';

class HomeModel {
  final UserModel currentUser;
  final List<UserModel> musicMates;

  HomeModel.fromJson(Map<String, dynamic> json)
      : currentUser = UserModel.fromJson(json['userInfo']),
        musicMates = UserList.musicMatesJson(json).users;
}
