import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_length/logic/cubit/youtube_cubit.dart';
import 'package:get_length/services/youtube_repo.dart';

import 'presentation/screens/home_screen.dart';

void main() {
  runApp(
    MyApp(
      youtubeRepo: YoutubeRepo(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.youtubeRepo}) : super(key: key);
  final YoutubeRepo youtubeRepo;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => YoutubeCubit(youtubeRepo),
        child: const HomeScreen(),
      ),
    );
  }
}
