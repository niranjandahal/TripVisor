import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeFullScreenShow extends StatefulWidget {
  const HomeFullScreenShow({super.key});

  @override
  State<HomeFullScreenShow> createState() => _HomeFullScreenShowState();
}

class _HomeFullScreenShowState extends State<HomeFullScreenShow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      // https://source.unsplash.com/random/300x200?sig=${DateTime.now().millisecondsSinceEpoch}

      child: CarouselSlider(
        //show same image 5 times
        items: [
          'https://source.unsplash.com/random/300x200?sig=${DateTime.now().millisecondsSinceEpoch}',
          'https://source.unsplash.com/random/300x200?sig=${DateTime.now().millisecondsSinceEpoch}',
          'https://source.unsplash.com/random/300x200?sig=${DateTime.now().millisecondsSinceEpoch}',
          'https://source.unsplash.com/random/300x200?sig=${DateTime.now().millisecondsSinceEpoch}',
          'https://source.unsplash.com/random/300x200?sig=${DateTime.now().millisecondsSinceEpoch}',
        ].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Stack(
  children: [
    Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey[300],
      ),
      child: Image.network(
        i,
        fit: BoxFit.cover,
        color: Colors.black.withOpacity(0.3),
        colorBlendMode: BlendMode.darken,
      ),
    ),
    Positioned(
      top: MediaQuery.of(context).size.height / 2 - 30.0, // Adjust as needed
      left: 16.0,
      right: 16.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Your Text Here',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: () {
              // Handle button click
            },
            child: Text('View Details'),
          ),
        ],
      ),
    ),
  ],
);

            },
          );
        }).toList(),
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height,
          aspectRatio: 16 / 9,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 4),
          autoPlayAnimationDuration: Duration(milliseconds: 2000),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
