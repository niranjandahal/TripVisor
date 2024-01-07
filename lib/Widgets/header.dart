// import 'package:flutter/material.dart';
// import 'package:tripvisor/Components/customtext.dart';
// import 'package:tripvisor/Components/navcomponent.dart';
// import 'package:tripvisor/Widgets/customdrawer.dart';
// import 'package:tripvisor/Widgets/searchbar.dart';

// class Customappbar extends StatefulWidget {
//   const Customappbar({super.key});

//   @override
//   State<Customappbar> createState() => _CustomappbarState();
// }

// class _CustomappbarState extends State<Customappbar> {
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: Color.fromARGB(255, 7, 58, 146),
//       title: customText(
//         'Tripvisor',
//         20,
//         color: Colors.black,
//         weight: FontWeight.bold,
//       ),
//       actions: [
//         Container(
//             margin: EdgeInsets.only(
//                 right: MediaQuery.of(context).size.width * 0.15),
//             child: customsearchbar()),
//         navcomponent('Home', 1),
//         navcomponent('About', 2),
//         navcomponent('Contact', 3),
//         navcomponent('Login', 4),
//         customdrawer()
//       ],
//     );
//   }
// }
