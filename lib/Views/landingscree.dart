import 'package:flutter/material.dart';
import 'package:tripvisor/Components/customtext.dart';
import 'package:tripvisor/Components/navcomponent.dart';
import 'package:tripvisor/Widgets/customdrawer.dart';
import 'package:tripvisor/Widgets/footer.dart';
import 'package:tripvisor/Widgets/header.dart';
import 'package:tripvisor/Widgets/tagsandads.dart';
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
      backgroundColor: Colors.grey[300],
      drawer: Drawer(
        child: CustomDrawer(),
      ),
      // appBar: AppBar(
      //   iconTheme: IconThemeData(color: Colors.white),
      //   backgroundColor: Color.fromARGB(255, 7, 58, 146),
      //   title: customText(
      //     'Tripvisor',
      //     20,
      //     color: Colors.white,
      //     weight: FontWeight.bold,
      //   ),
      //   actions: [
      //     Container(
      //         margin: EdgeInsets.only(
      //             right: MediaQuery.of(context).size.width * 0.15),
      //         child: customsearchbar()),
      //     navcomponent('Home', 1),
      //     navcomponent('About', 2),
      //     navcomponent('Contact', 3),
      //     navcomponent('Login', 4),
      //   ],
      // ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(),
          SliverList(
              delegate: SliverChildListDelegate([
            TagDisplay(),
            customfooter(),
          ]))
        ],
        // child: Column(
        //   children: [TagDisplay(), customfooter()],
        // ),
      ),
    );
  }
}
