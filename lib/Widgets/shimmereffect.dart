import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class tagsloadshimmereffect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.6),
            Colors.white.withOpacity(0.8),
            Colors.white,
            Colors.white.withOpacity(0.8),
            Colors.white.withOpacity(0.6),
          ],
          begin: Alignment(-1.0, -0.5),
          end: Alignment(1.0, 0.5),
          stops: [0.0, 0.25, 0.5, 0.75, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
            margin: EdgeInsets.all(15),
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.4,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
