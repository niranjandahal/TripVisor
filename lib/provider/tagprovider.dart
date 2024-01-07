import 'package:flutter/material.dart';
import 'package:tripvisor/Components/customtext.dart';
import 'package:provider/provider.dart';

class tagprovider extends ChangeNotifier {
  List<String> tags = [
    'Beach',
    'Hill Station',
    'Historical',
    'Adventure',
    'Religious',
    'Wildlife',
    'Desert',
    'City',
    'Village',
    'Forest',
    'Lake',
    'River',
    'Waterfall',
    'Cave',
    'Island',
    'Museum',
    'Monument',
    'Palace',
    'Temple',
    'Church',
    'Mosque',
    'Garden',
    'Zoo',
    'National Park',
    'Sanctuary',
    'Fort',
    'Trekking',
    'Skiing',
    'Paragliding',
    'Scuba Diving',
    'Snorkeling',
    'Camping',
    'Safari',
    'Cycling',
    'Boating',
    'Rafting',
    'Kayaking',
    'Canyoning',
    'Bungee Jumping',
    'Sky Diving',
    'Cruise',
  ];

  String selectedtags = '';
  //change color of selected tags
  Color tagcolor(String tag) {
    if (selectedtags == tag) {
      return Colors.blue;
    } else {
      return Colors.white;
    }
  }

  void selecttags(String tag) {
    selectedtags = tag;
    notifyListeners();
  }

  void unselecttags(String tag) {
    selectedtags = '';
    notifyListeners();
  }
}
