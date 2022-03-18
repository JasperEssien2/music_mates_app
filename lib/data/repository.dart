import 'package:google_sign_in/google_sign_in.dart';
import 'package:music_mates_app/domain/repository.dart';

class MusicMateRepositoryImpl implements MusicMateRepository {
  MusicMateRepositoryImpl({required this.signIn});

  final GoogleSignIn signIn;

  @override
  Future<GoogleSignInAccount?> googleLogin() {
    return signIn.signIn();
  }

  @override
  String createAccount() {
    return """
    mutation createUser(\$name: String!, \$googleId: String!, \$imageUrl: String!, \$favouriteArtists: [ID]){
        createUser(name: \$name, googleId: \$googleId, imageUrl: \$imageUrl, favouriteArtists: \$favouriteArtists){
          user{
            name
            imageUrl
            favouriteArtists {
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
    query {
      allArtists {
            id
            name
            imageUrl
            description
        }
    }
   """;
  }

  @override
  String fetchUserInfo() {
    return """
   query UserInfo(\$googleId: String!){

    userInfo(googleId: \$googleId){
      name
      imageUrl
    }

    userFavouriteArtist(googleId: \$googleId){
      name
      imageUrl
      description
    }
    
    musicMates(googleId: \$googleId){
      name
      imageUrl
    }
   
  }
   """;
  }
}
