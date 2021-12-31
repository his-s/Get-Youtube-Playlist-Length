import 'package:flutter/material.dart';
import 'package:get_length/presentation/screens/widgets/card_widget.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

import 'sub_card_widget.dart';
import 'video_card_listview.dart';

class PlayListLoadedWidget extends StatelessWidget {
  const PlayListLoadedWidget(
      {Key? key, required this.playlist, required this.totalDuration})
      : super(key: key);
  final List<Video> playlist;
  final Duration totalDuration;
  @override
  Widget build(BuildContext context) {
    format(Duration d) => d.toString().split('.').first.padLeft(8, "0");
    calcDurationInSpeed(double speed, Duration totalDuration) =>
        Duration(microseconds: (totalDuration.inMicroseconds ~/ speed));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CardWidget(
          wrapAlignment: WrapAlignment.start,
          title: "Author",
          widgets: [
            Text(
              playlist.first.author,
              textAlign: TextAlign.left,
            ),
          ],
        ),
        CardWidget(
          title: "Statistics",
          widgets: [
            SubCardWidget(
              title: "No Videos",
              value: playlist.length.toString(),
            ),
            SubCardWidget(
              title: "Avg Video Len",
              value: (totalDuration.inMinutes ~/ playlist.length).toString() +
                  " min",
            ),
            SubCardWidget(
                title: "Total Duration",
                value: format(totalDuration).toString()),
          ],
        ),
        CardWidget(
          title: "Speed",
          widgets: [
            SubCardWidget(
              title: "1.25X",
              value: format(
                calcDurationInSpeed(1.25, totalDuration),
              ),
            ),
            SubCardWidget(
              title: "1.50X",
              value: format(
                calcDurationInSpeed(1.5, totalDuration),
              ),
            ),
            SubCardWidget(
              title: "1.75X",
              value: format(
                calcDurationInSpeed(1.75, totalDuration),
              ),
            ),
            SubCardWidget(
              title: "2X",
              value: format(
                calcDurationInSpeed(2, totalDuration),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
