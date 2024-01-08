import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tripvisor/provider/offersectionprovider.dart';

class OfferSection extends StatefulWidget {
  //take parameter
  int sectionindex;
  OfferSection(this.sectionindex, {super.key});

  @override
  State<OfferSection> createState() => _OfferSectionState();
}

class _OfferSectionState extends State<OfferSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
      ],
    );
  }
}
