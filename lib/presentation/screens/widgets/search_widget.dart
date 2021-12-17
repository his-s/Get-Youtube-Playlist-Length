import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_length/logic/cubit/youtube_cubit.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  TextEditingController textEditingController = TextEditingController();
  String playlistUrl = "";
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  bool isEmpty() {
    return playlistUrl.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: textEditingController,
                  onChanged: (value) => setState(() => playlistUrl = value),
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade300,
                    filled: true,
                    hintText: "Playlist Url",
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: !isEmpty()
                        ? GestureDetector(
                            onTap: () {
                              textEditingController.clear();
                              setState(() {
                                playlistUrl = "";
                              });
                            },
                            child: const Icon(Icons.close),
                          )
                        : const SizedBox(),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 55,
              child: TextButton(
                onPressed: () {
                  if (textEditingController.text.isEmpty ||
                      !textEditingController.text.contains("playlist")) return;
                  BlocProvider.of<YoutubeCubit>(context)
                      .getPlayListVideos(textEditingController.text);
                },
                child: Text(
                  "Search".toUpperCase(),
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
