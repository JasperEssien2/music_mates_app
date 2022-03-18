import 'package:google_sign_in/google_sign_in.dart';

class MusicMateRepository {
  MusicMateRepository({required this.signIn});

  final GoogleSignIn signIn;

  Future<GoogleSignInAccount?> googleLogin() {
    return signIn.signIn();
  }

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
