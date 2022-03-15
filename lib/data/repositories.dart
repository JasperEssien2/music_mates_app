import 'package:google_sign_in/google_sign_in.dart';
import 'package:music_mates_app/domain/repository.dart';

class MusicMateRepositoryImpl implements MusicMateRepository {
  MusicMateRepositoryImpl({required this.signIn});

  final GoogleSignIn signIn;

  @override
  Future<String> createAccount(List<int> favouriteArtistId) async {
    final user = await signIn.signIn();

    return """
    mutation {
    createUser(name: ${user.displayName}, googleId: "${user.id}", imageUrl: ${user.photoUrl}, favouriteArtists:$favouriteArtistId){
      user{
        name
        googleId
        id
        imageUrl
        favouriteArtists{
          name
          description
          
        }
      }
    }
  }
    """;
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
