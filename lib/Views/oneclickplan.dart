import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps/google_maps.dart' as maps;

class OneClickPlan extends StatefulWidget {
  const OneClickPlan({Key? key}) : super(key: key);

  @override
  State<OneClickPlan> createState() => _OneClickPlanState();
}

class _OneClickPlanState extends State<OneClickPlan> {
//google maps all setup


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            color: Colors.red,
            //ask all info from user like destination from and to, budget, no of people,etc
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder(
              future: Geolocator.getCurrentPosition(
                  desiredAccuracy: LocationAccuracy.high),
              builder: (context, AsyncSnapshot<Position> snapshot) {
                if (snapshot.hasData) {
                  return maps.GoogleMap(
                    initialCameraPosition: maps.CameraPosition(
                      target: maps.LatLng(
                          snapshot.data!.latitude, snapshot.data!.longitude),
                      zoom: 15,
                    ),
                    mapType: maps.MapType.normal,
                    onMapCreated: (maps.GoogleMapController controller) {},
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
