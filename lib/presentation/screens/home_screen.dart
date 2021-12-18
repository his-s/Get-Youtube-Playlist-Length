import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_length/logic/cubit/youtube_cubit.dart';

import 'package:get_length/presentation/screens/widgets/no_information_widget.dart';
import 'package:get_length/presentation/screens/widgets/playlist_loaded_widget.dart';

import 'widgets/search_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
                  return PlayListLoadedWidget(
                    playlist: state.playlist,
                    totalDuration: state.totalDuration,
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
