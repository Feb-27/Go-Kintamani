import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MySlider extends StatefulWidget {
  const MySlider({super.key});

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  final myitems = [
    Image.asset('images/apl.png'),
    Image.asset('images/toya.jpg'),
    Image.asset('images/hotel.jpg'),
    Image.asset('images/mujair.jpg'),
  ];

  int myCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade700,
        body: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                    autoPlay: true,
                    height: 200,
                    onPageChanged: (index, reason) {
                      setState(
                        () {
                          myCurrentIndex = index;
                        },
                      );
                    }),
                items: myitems,
              ),
            ],
          ),
        ));
  }
}
