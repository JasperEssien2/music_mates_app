import 'package:google_sign_in/google_sign_in.dart';
import 'package:music_mates_app/domain/repository.dart';

class MusicMateRepositoryImpl implements MusicMateRepository {
  MusicMateRepositoryImpl({required this.signIn});

  final GoogleSignIn signIn;

  @override
  Future<String?> createAccount(List<int> favouriteArtistId) async {
    final user = await signIn.signIn();

    if (user == null) return null;

    return """
    mutation {
    createUser(name: ${user.displayName}, googleId: "${user.id}", imageUrl: ${user.photoUrl}, favouriteArtists:$favouriteArtistId){
      user{
        name
        imageUrl
        favouriteArtists{
          name
          description
          imageUrl
        }
      }
    }
  }
    """;
  }

  @override
  String fetchAllArtist() {
   return """
    allArtists{
      id
      name
      imageUrl
      description
    }
   """;
  }

  @override
  String fetchUserInfo(String googleId) {
    return """
   query{

    userInfo(googleId: $googleId){
      name
      imageUrl
    }

    userFavouriteArtist(googleId: $googleId){
      name
      imageUrl
      description
    }
    
    musicMates(googleId: $googleId){
      name
      imageUrl
    }
   
  }
   """;
  }
}
