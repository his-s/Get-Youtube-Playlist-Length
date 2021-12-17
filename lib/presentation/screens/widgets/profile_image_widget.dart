import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_length/logic/cubit/youtube_cubit.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 165,
      child: SizedBox(
        height: 110,
        width: 110,
        child: BlocBuilder<YoutubeCubit, YoutubeState>(
          builder: (context, state) {
            if (state is PlayListVideosLoaded) {
              return Center(child: Text(state.playlist.first.author));
            }
            return const Icon(
              Icons.account_circle_outlined,
              size: 70,
              color: Colors.cyan,
            );
          },
        ),
      ),
    );
  }
}
