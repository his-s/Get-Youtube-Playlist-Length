import 'package:bloc/bloc.dart';
import 'package:get_length/services/youtube_repo.dart';
import 'package:meta/meta.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

part 'youtube_state.dart';

class YoutubeCubit extends Cubit<YoutubeState> {
  YoutubeCubit(this.youtubeRepo) : super(YoutubeInitial());
  final YoutubeRepo youtubeRepo;
  late List<Video> playlist;
  late int videosCount;
  late Duration totalDuration;

  Future<void> getPlayListVideos(String url) async {
    await youtubeRepo.getPlayListVideos(url).then((playlist) {
      totalDuration = playlist.fold(Duration.zero,
          (pre, element) => pre + (element.duration ?? Duration.zero));
      emit(PlayListVideosLoaded(playlist, totalDuration));
    });
  }
}
