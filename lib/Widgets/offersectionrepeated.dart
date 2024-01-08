import 'package:flutter/material.dart';
import 'package:tripvisor/Components/customtext.dart';
import 'package:tripvisor/Widgets/footer.dart';
import 'package:provider/provider.dart';
import 'package:tripvisor/provider/offersectionprovider.dart';

class offersectionrepeated extends StatefulWidget {
  int sectionindex;
  offersectionrepeated(this.sectionindex, {super.key});

  @override
  State<offersectionrepeated> createState() => _offersectionrepeatedState();
}

class _offersectionrepeatedState extends State<offersectionrepeated> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        alignment: Alignment.centerLeft,
        height: 50,
        margin: EdgeInsets.all(20),
        child: customText('OfferSection2', 30, weight: FontWeight.bold),
      ),
      Container(
        height: 400,
        margin: EdgeInsets.all(20),
        color: Colors.green,
        child: Consumer<offersectionprovider>(
          builder: (context, offerSectionProvider, child) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: offerSectionProvider.getcounts(widget.sectionindex),
              itemBuilder: (context, index) {
                return Container(
                  height: 350,
                  width: 400,
                  margin: EdgeInsets.all(20),
                  color: Colors.red,
                  child: Center(
                    child: Text('Offer $index'),
                  ),
                );
              },
            );
          },
        ),
      ),
    ]);
  }
}
