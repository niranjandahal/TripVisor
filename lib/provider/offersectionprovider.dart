import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class offersectionprovider extends ChangeNotifier {
  int datacount = 0;

  List<String> offerlist1 = [
    'https://source.unsplash.com/random/300x200?sig=${DateTime.now().millisecondsSinceEpoch}',
    'https://source.unsplash.com/random/300x200?sig=${DateTime.now().millisecondsSinceEpoch}',
    'https://source.unsplash.com/random/300x200?sig=${DateTime.now().millisecondsSinceEpoch}',
    'https://source.unsplash.com/random/300x200?sig=${DateTime.now().millisecondsSinceEpoch}',
    'https://source.unsplash.com/random/300x200?sig=${DateTime.now().millisecondsSinceEpoch}',
  ];

  bool offerlist1loaded = false;

  List<String> offerlist2 = [
    'https://source.unsplash.com/random/300x200?sig=${DateTime.now().millisecondsSinceEpoch}',
    'https://source.unsplash.com/random/300x200?sig=${DateTime.now().millisecondsSinceEpoch}',
    'https://source.unsplash.com/random/300x200?sig=${DateTime.now().millisecondsSinceEpoch}',
    'https://source.unsplash.com/random/300x200?sig=${DateTime.now().millisecondsSinceEpoch}',
    'https://source.unsplash.com/random/300x200?sig=${DateTime.now().millisecondsSinceEpoch}',
  ];

  bool offerlist2loaded = false;

  List<String> offerlist3 = [
    'https://source.unsplash.com/random/300x200?sig=${DateTime.now().millisecondsSinceEpoch}',
    'https://source.unsplash.com/random/300x200?sig=${DateTime.now().millisecondsSinceEpoch}',
    'https://source.unsplash.com/random/300x200?sig=${DateTime.now().millisecondsSinceEpoch}',
  ];

  bool offerlist3loaded = false;

  int getcounts(int index) {
    if (index == 1) {
      datacount = offerlist1.length;
    } else if (index == 2) {
      datacount = offerlist2.length;
    } else if (index == 3) {
      datacount = offerlist3.length;
    }
    return datacount;
  }

  ///some function to manupulate above variables
  ///
}
