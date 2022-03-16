import 'package:flutter/material.dart';
import 'package:music_mates_app/data/model/artist.dart';

class ItemSelectArtist extends StatelessWidget {
  const ItemSelectArtist({
    Key? key,
    required this.artist,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  final ArtistModel artist;
  final Function() onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.grey[200],
        backgroundImage: NetworkImage(artist.imageUrl!),
      ),
      title: Text(artist.name!),
      subtitle: Text(
        artist.description!,
        maxLines: 2,
      ),
      trailing: isSelected
          ? const Icon(
              Icons.check_circle,
              color: Colors.lightGreen,
            )
          : const SizedBox.shrink(),
      onTap: onTap,
    );
  }
}
