import 'package:flutter/material.dart';

class PackageDetails extends StatefulWidget {
  const PackageDetails({super.key});

  @override
  State<PackageDetails> createState() => _PackageDetailsState();
}

class _PackageDetailsState extends State<PackageDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //every details of tour package in this page with images and all other details
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            
          ),
          SliverList(delegate: SliverChildListDelegate([]))
        ],
      ),
    );
  }
}
