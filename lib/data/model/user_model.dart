import 'package:music_mates_app/data/model/artist.dart';

class UserModel {
  UserModel(
      {required this.name,
      required this.imageUrl,
      required this.favouriteArtist});

  final String? name;
  final String? imageUrl;
  final List<ArtistModel>? favouriteArtist;

  UserModel.dummy()
      : name = "Mike Doe",
        imageUrl =
            'https://cdns-images.dzcdn.net/images/artist/19cc38f9d69b352f718782e7a22f9c32/500x500.jpg',
        favouriteArtist = [ArtistModel.dummy()];
}
