import 'package:flutter/material.dart';
import 'package:tripvisor/Components/customtext.dart';
import 'package:tripvisor/Components/navcomponent.dart';
import 'package:tripvisor/Widgets/footer.dart';
import 'package:tripvisor/Widgets/header.dart';
import 'package:tripvisor/Widgets/populartags.dart';
import 'package:tripvisor/Widgets/searchbar.dart';
import 'package:tripvisor/provider/tagprovider.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          children: [Customappbar(), TagDisplay(), customfooter()],
        ),
      ),
    );
  }
}
