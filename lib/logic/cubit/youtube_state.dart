part of 'youtube_cubit.dart';

@immutable
abstract class YoutubeState {}

class YoutubeInitial extends YoutubeState {}

class PlayListVideosLoaded extends YoutubeState {
  final List<Video> playlist;
  final Duration totalDuration;

  PlayListVideosLoaded(this.playlist, this.totalDuration);
}
