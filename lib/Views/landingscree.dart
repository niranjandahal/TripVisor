import 'package:flutter/material.dart';
import 'package:tripvisor/Widgets/HomeFullScreenShow.dart';
import 'package:tripvisor/Components/customtext.dart';
import 'package:tripvisor/Components/navcomponent.dart';
import 'package:tripvisor/Widgets/customdrawer.dart';
import 'package:tripvisor/Widgets/footer.dart';
import 'package:tripvisor/Widgets/offersection1.dart';
import 'package:tripvisor/Widgets/offersectionrepeated.dart';
import 'package:tripvisor/Widgets/tagsandads.dart';
import 'package:tripvisor/Widgets/searchbar.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      drawer: Drawer(
        child: CustomDrawer(),
      ),
      body: CustomScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            toolbarHeight: 60,
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height,
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Color.fromARGB(255, 7, 58, 146),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              collapseMode: CollapseMode.parallax,
              title: Container(
                //fancy plan your trip interactive button here
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customText(
                      'Plan your trip',
                       20,
                      weight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                  ],
                ),

              ),
              background: HomeFullScreenShow(),
            ),
            actions: [
              Container(
                  margin: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.15),
                  child: customsearchbar()),
              navcomponent('Home', 1),
              navcomponent('About', 2),
              navcomponent('Contact', 3),
              navcomponent('Login', 4),
            ],
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            const SizedBox(
              height: 20,
            ),
            TagDisplay(),
            OfferSection1(),
            offersectionrepeated(2),
            offersectionrepeated(3),
            CustomFooter(),
          ])),
        ],
      ),
    );
  }
}
