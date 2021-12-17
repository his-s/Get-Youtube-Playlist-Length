import 'package:flutter/material.dart';
import 'package:get_length/presentation/screens/widgets/video_card.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class VideoCardListViewWidget extends StatelessWidget {
  const VideoCardListViewWidget({Key? key, required this.playlist})
      : super(key: key);
  final List<Video> playlist;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      width: double.infinity,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: playlist.length,
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: VideoCardWidget(
                  video: playlist[index],
                ),
              )),
    );
  }
}
