import 'package:flutter/material.dart';

class SubCardWidget extends StatelessWidget {
  const SubCardWidget({Key? key, required this.title, required this.value})
      : super(key: key);
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style:
              const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          value,
          style: const TextStyle(
              color: Colors.black, fontSize: 23, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
