import 'package:google_sign_in/google_sign_in.dart';

abstract class MusicMateRepository {
  Future<GoogleSignInAccount?> googleLogin();

  String createAccount();

  String fetchUserInfo();

  String fetchAllArtist();
}
