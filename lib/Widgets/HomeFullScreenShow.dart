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
              return Container(
                width: MediaQuery.of(context).size.width,
                // margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                ),
                child: Image.network(
                  i,
                  fit: BoxFit.cover,
                  color: Colors.black.withOpacity(0.3),
                  colorBlendMode: BlendMode.darken,
                ),
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
