abstract class MusicMateRepository {
  Future<String?> createAccount(List<int> favouriteArtistId);

  String fetchUserInfo(String googleId);

  String fetchAllArtist();
}
