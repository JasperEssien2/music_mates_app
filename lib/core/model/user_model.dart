import 'package:music_mates_app/core/model/artist.dart';

class UserModel {
  UserModel(
      {required this.name,
      required this.imageUrl,
      required this.favouriteArtist});

  final String name;
  final String imageUrl;
  final List<ArtistModel> favouriteArtist;

  UserModel.dummy()
      : name = "Mike Doe",
        imageUrl =
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Eminem_-_Concert_for_Valor_in_Washington%2C_D.C._Nov._11%2C_2014_%282%29_%28Cropped%29.jpg/1280px-Eminem_-_Concert_for_Valor_in_Washington%2C_D.C._Nov._11%2C_2014_%282%29_%28Cropped%29.jpg',
        favouriteArtist = [ArtistModel.dummy()];
}
