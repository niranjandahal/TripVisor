import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class descriptionprovider extends ChangeNotifier {
  List _description = [];
  List get description => _description;

  void setdescription(String somekey) {
    //add the place name description wheather climate best time to visit and all other links to the description list

    //key value pair addtition on _description list
    _description.add({
      'key': 'somekey',
      'name': 'sample place name',
      'description': 'sample place description',
      'climate': 'sample place climate',
      'besttime': 'sample place best time to visit',
      'link1': 'sample place link1',
      'link2': 'sample place link2',
      'link3': 'sample place link3',
      'link4': 'sample place link4',
      'images': [
        'https://source.unsplash.com/random/300x200?sig=${DateTime.now().millisecondsSinceEpoch}',
        'https://source.unsplash.com/random/300x200?sig=${DateTime.now().millisecondsSinceEpoch}',
      ],
    });
  }
}