class MusicMateQueries {
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

  String updateUser() {
    return """
    mutation UpdateUser(\$name: String, \$googleId: String!, \$imageUrl: String, \$favouriteArtists: [ID]){
        updateUser(name: \$name, googleId: \$googleId, imageUrl: \$imageUrl, favouriteArtists: \$favouriteArtists){
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
      favouriteArtists {
        name
        imageUrl
        description
      }
    }
    
    musicMates(googleId: \$googleId){
      name
      imageUrl
    }
   
  }
   """;
  }
}
