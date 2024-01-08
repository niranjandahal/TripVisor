import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tripvisor/Components/customtext.dart';
import 'package:tripvisor/provider/offersectionprovider.dart';

class OfferSection1 extends StatefulWidget {
  const OfferSection1({super.key});

  @override
  State<OfferSection1> createState() => _OfferSection1State();
}

class _OfferSection1State extends State<OfferSection1> {
  @override
  Widget build(BuildContext context) {
    return Consumer<offersectionprovider>(
      builder: (context, offerSectionProvider, child) {
        return Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              height: 50,
              margin: EdgeInsets.all(20),
              child: customText('OfferSection1', 30,weight: FontWeight.bold),
            ),
            Wrap(
              spacing: 8.0, // Adjust spacing between items
              runSpacing: 8.0, // Adjust spacing between rows
              alignment: WrapAlignment.spaceEvenly, //
              children: List.generate(
                growable: true,
                offerSectionProvider.offerlist1.length,
                (index) => Container(
                  height: 350,
                  width: 400,
                  margin: EdgeInsets.all(20),
                  color: Colors.red,
                  child: Center(
                    child: Text('Offer $index'),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
