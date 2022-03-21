class ArtistModel {
  ArtistModel({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.id,
  });

  final String? name;
  final String? imageUrl;
  final String? description;
  final int? id;

  ArtistModel.fromJson(Map<String, dynamic> data)
      : name = data['name'],
        id = data['id'] == null ? null : int.parse(data['id']),
        imageUrl = data['imageUrl'],
        description = data['description'];

  ArtistModel.dummy({int id_ = 0})
      : name = "Artist Name",
        id = id_,
        imageUrl =
            'https://imageio.forbes.com/specials-images/imageserve/5f754f07d6105e8c6185c377/0x0.jpg?format=jpg&width=1200&fit=bounds',
        description = "This is a very good artist";
}

class ArtistList {
  final List<ArtistModel> artists;

  ArtistList.allArtistFromJson(Map<String, dynamic> json)
      : artists = json['allArtists']
            .list
            .map((e) => ArtistModel.fromJson(e))
            .toList();
}
