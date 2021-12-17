import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget(
      {Key? key,
      required this.title,
      required this.widgets,
      this.mainAxisAlignment = MainAxisAlignment.spaceAround})
      : super(key: key);
  final String title;
  final List<Widget> widgets;
  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 3,
        shadowColor: Colors.grey.shade100,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: mainAxisAlignment,
                children: widgets,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
