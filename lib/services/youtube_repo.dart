import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class YoutubeRepo {
  List<Video> playlistVideos = [];
  YoutubeExplode yt = YoutubeExplode();
  void checkTrueLink(String url) {
    if (!url.contains("playlist") || url.isEmpty) throw "Not Supported Link";
    return;
  }

  Future<List<Video>> getPlayListVideos(String url) async {
    checkTrueLink(url);

    return await yt.playlists.getVideos(url).toList();
  }

  Future<Playlist> platlistInfromation(String url) {
    checkTrueLink(url);
    return yt.playlists.get(url);
  }
}
