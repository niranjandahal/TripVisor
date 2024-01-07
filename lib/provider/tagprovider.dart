import 'package:flutter/material.dart';
import 'package:tripvisor/Components/customtext.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
//ads images section
  List<String> adsimglist = [];

  bool adsimglistloaded = false;

  //selected image section

  List<String> selectedtagimg = [];

  String selectedtags = '';

  String content = '';

  //function to update data
  Color tagcolor(String tag) {
    if (selectedtags == tag) {
      return Colors.blue;
    } else {
      return Colors.white;
    }
  }

  void updatecontent() {
    content = selectedtags;
    notifyListeners();
  }

  void selecttags(String tag) {
    if (selectedtags == tag) {
      selectedtags = '';
      notifyListeners();
    } else {
      selectedtags = tag;
      notifyListeners();
    }
  }

  // https://picsum.photos/v2/list?page=2&limit=10

  Future<void> getadsimg() async {
    //if ads not loaded then load ads
    if (adsimglistloaded == false) {
      var url = Uri.parse('https://picsum.photos/v2/list?page=2&limit=10');
      var response = await http.get(url);
      var data = jsonDecode(response.body);
      for (var i = 0; i < data.length; i++) {
        adsimglist.add(data[i]['download_url']);
      }
      adsimglistloaded = true;
      notifyListeners();
    }
  }

  Future<void> getselectedtagimg(String tags) async {
    selectedtagimg.clear();
    print("getimgcalled");
    var url = Uri.parse('https://picsum.photos/v2/list?page=2&limit=10');
    var response = await http.get(url);
    var data = jsonDecode(response.body);
    for (var i = 0; i < data.length; i++) {
      selectedtagimg.add(
          'https://source.unsplash.com/random/300x200?sig=${DateTime.now().millisecondsSinceEpoch}');
    }
  }
}
