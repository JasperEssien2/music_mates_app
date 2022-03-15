import 'package:flutter/material.dart';
import 'package:music_mates_app/core/helpers/constants.dart';
import 'package:music_mates_app/data/data_export.dart';
import 'package:music_mates_app/presentation/widgets/item_select_artist.dart';

class SelectFavouriteArtist extends StatefulWidget {
  const SelectFavouriteArtist({Key? key}) : super(key: key);

  @override
  _SelectFavouriteArtistState createState() => _SelectFavouriteArtistState();
}

class _SelectFavouriteArtistState extends State<SelectFavouriteArtist> {
  List<int> selectedArtist = [];

  @override
  Widget build(BuildContext context) {
    final list = List.generate(9, (_) => ArtistModel.dummy(id_: _));

    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: const TextSpan(
            text: "Your Favourite Artist\n",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            children: [
              TextSpan(
                text: "Select up to 2 favourite artist to proceed",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: list.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (c, index) {
                  var artist = list[index];
                  return ItemSelectArtist(
                    artist: artist,
                    onTap: () => onTap(artist.id),
                    isSelected: selectedArtist.contains(artist.id),
                  );
                },
              ),
            ),
            AppSpacing.v24,
            _DoneButton(selectedArtist: selectedArtist),
            AppSpacing.v24,
          ],
        ),
      ),
    );
  }

  void onTap(int artistId) {
    if (selectedArtist.contains(artistId)) {
      selectedArtist.remove(artistId);
    } else {
      selectedArtist.add(artistId);
    }

    setState(() {});
  }
}

class _DoneButton extends StatelessWidget {
  const _DoneButton({
    Key? key,
    required this.selectedArtist,
  }) : super(key: key);

  final List<int> selectedArtist;

  @override
  Widget build(BuildContext context) {
    final isEnabled = selectedArtist.length >= 2;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: TextButton(
        style: ButtonStyle(
          enableFeedback: isEnabled,
          backgroundColor: MaterialStateProperty.all(
            Colors.grey[300],
          ),
        ),
        onPressed: () =>
            isEnabled ? Navigator.pop(context, selectedArtist) : null,
        child: SizedBox(
          width: double.infinity,
          child: Center(
            child: Opacity(
              opacity: isEnabled ? 1 : 0.2,
              child: const Text(
                "DONE",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
