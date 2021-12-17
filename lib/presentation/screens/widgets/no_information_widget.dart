import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class NoInformationWidget extends StatelessWidget {
  const NoInformationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "assets/images/3236267.jpg",
      "assets/images/3255309.jpg",
      "assets/images/3545760.jpg",
      "assets/images/5484597.jpg",
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 400.0,
            autoPlay: true,
            enlargeCenterPage: true,
          ),
          items: List.generate(
            images.length,
            (index) => Image.asset(
              images[index],
            ),
          ),
        ),
        const Text(
          "Get Playlist Information",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.indigoAccent,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Paste Your Link In Search Box And Hit Search To Get Playlist Information And Length",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
