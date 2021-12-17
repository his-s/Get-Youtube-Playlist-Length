import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_length/logic/cubit/youtube_cubit.dart';
import 'package:get_length/presentation/screens/widgets/card_widget.dart';
import 'package:get_length/presentation/screens/widgets/no_information_widget.dart';
import 'package:get_length/presentation/screens/widgets/video_card_listview.dart';
import 'widgets/search_widget.dart';
import 'widgets/sub_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  format(Duration d) => d.toString().split('.').first.padLeft(8, "0");
  calcDurationInSpeed(double speed, Duration totalDuration) =>
      Duration(microseconds: (totalDuration.inMicroseconds ~/ speed));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.indigo,
        title: const Text(
          "Playlist Information",
        ),
      ),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SearchWidget(),
            BlocBuilder<YoutubeCubit, YoutubeState>(
              builder: (context, state) {
                if (state is PlayListVideosLoaded) {
                  return Column(
                    children: [
                      CardWidget(
                        mainAxisAlignment: MainAxisAlignment.start,
                        title: "Author",
                        widgets: [
                          Text(
                            state.playlist.first.author,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      CardWidget(
                        title: "Statistics",
                        widgets: [
                          SubCardWidget(
                            title: "No Videos",
                            value: state.playlist.length.toString(),
                          ),
                          SubCardWidget(
                            title: "Avg Video Len",
                            value: (state.totalDuration.inMinutes ~/
                                    state.playlist.length)
                                .toString(),
                          ),
                          SubCardWidget(
                              title: "Total Duration",
                              value: format(state.totalDuration).toString()),
                        ],
                      ),
                      CardWidget(
                        title: "Speed",
                        widgets: [
                          SubCardWidget(
                            title: "1.25X",
                            value: format(
                              calcDurationInSpeed(1.25, state.totalDuration),
                            ),
                          ),
                          SubCardWidget(
                            title: "1.50X",
                            value: format(
                              calcDurationInSpeed(1.5, state.totalDuration),
                            ),
                          ),
                          SubCardWidget(
                            title: "1.75X",
                            value: format(
                              calcDurationInSpeed(1.75, state.totalDuration),
                            ),
                          ),
                        ],
                      ),
                      VideoCardListViewWidget(playlist: state.playlist),
                    ],
                  );
                }
                return const NoInformationWidget();
              },
            ),
          ],
        ),
      ),
    );
  }
}
