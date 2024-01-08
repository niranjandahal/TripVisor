import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class offersectionprovider extends ChangeNotifier {

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

  ///some function to manupulate above variables 
  ///
}
