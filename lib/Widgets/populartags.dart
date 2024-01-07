import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:tripvisor/Components/customtext.dart';
import 'package:tripvisor/provider/tagprovider.dart';

class TagDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width * 0.8,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 5,
                  color: Colors.grey.withOpacity(0.1),
                ),
              ],
            ),
            child: Column(
              children: [
                customText(
                  'Popular Tags',
                  20,
                  color: Colors.black,
                  weight: FontWeight.bold,
                ),
                SizedBox(
                  height: 10,
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.easeInOut,
                    pauseAutoPlayOnTouch: true,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                  ),
                  items: Provider.of<tagprovider>(context)
                      .tags
                      .map(
                        (item) => Container(
                          child: Center(
                            child: customText(
                              item,
                              20,
                              color: Colors.black,
                              weight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
