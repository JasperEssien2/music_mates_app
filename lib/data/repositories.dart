import 'package:google_sign_in/google_sign_in.dart';
import 'package:music_mates_app/domain/repository.dart';

class MusicMateRepositoryImpl implements MusicMateRepository {
  MusicMateRepositoryImpl({required this.signIn});

  final GoogleSignIn signIn;
  
  @override
  Future<GoogleSignInAccount?> googleLogin() {
    // TODO: implement googleLogin
    throw UnimplementedError();
  }

  @override
  String createAccount() {
    // TODO: implement createAccount
    throw UnimplementedError();
  }

  @override
  String fetchAllArtist() {
    // TODO: implement fetchAllArtist
    throw UnimplementedError();
  }

  @override
  String fetchUserInfo() {
    // TODO: implement fetchUserInfo
    throw UnimplementedError();
  }
}
