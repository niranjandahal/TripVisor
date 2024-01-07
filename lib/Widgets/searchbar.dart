import 'package:flutter/material.dart';

class customsearchbar extends StatefulWidget {
  const customsearchbar({super.key});

  @override
  State<customsearchbar> createState() => _customsearchbarState();
}

class _customsearchbarState extends State<customsearchbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.4,
      //glassmorphic searchbar
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
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          border: InputBorder.none,
          suffixIcon: Icon(Icons.search),
        ),
      ),

      //glassmorphic searchbar
    );
  }
}
