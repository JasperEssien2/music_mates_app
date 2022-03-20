import 'package:google_sign_in/google_sign_in.dart';

class MusicMateRepository {
  MusicMateRepository({required this.signIn});

  final GoogleSignIn signIn;

  Future<GoogleSignInAccount?> googleLogin() {
    // TODO: implement googleLogin
    throw UnimplementedError();
  }

  String createAccount() {
    // TODO: implement createAccount
    throw UnimplementedError();
  }

  String fetchAllArtist() {
    // TODO: implement fetchAllArtist
    throw UnimplementedError();
  }

  String fetchUserInfo() {
    // TODO: implement fetchUserInfo
    throw UnimplementedError();
  }
}
