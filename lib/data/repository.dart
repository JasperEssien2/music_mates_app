import 'package:music_mates_app/data/model/user_model.dart';

abstract class MusicMateRepository {
  Future<String?> signInWithGoogle();

  Future<String> createAccount(UserModel userModel);

  String fetchUserInfo();
  
  String fetchAllArtist();
}
