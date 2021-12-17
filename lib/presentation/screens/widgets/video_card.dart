import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class VideoCardWidget extends StatelessWidget {
  const VideoCardWidget({Key? key, required this.video}) : super(key: key);
  final Video video;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: Image.network(video.thumbnails.highResUrl),
        ),
        const SizedBox(
          width: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                video.title.characters.length > 40
                    ? video.title.substring(0, 35)
                    : video.title,
                overflow: TextOverflow.clip,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(video.author),
            ],
          ),
        ),
      ],
    );
  }
}
