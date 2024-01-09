import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OneClickPlan extends StatefulWidget {
  const OneClickPlan({Key? key}) : super(key: key);

  @override
  State<OneClickPlan> createState() => _OneClickPlanState();
}

class _OneClickPlanState extends State<OneClickPlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            color: Colors.red,
            // Ask all info from the user like destination, from and to, budget, no of people, etc
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder(
                future: Geolocator.getCurrentPosition(
                  desiredAccuracy: LocationAccuracy.high,
                ),
                builder: (BuildContext context,
                        AsyncSnapshot<Position> snapshot) =>
                    GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                            snapshot.data!.latitude, snapshot.data!.longitude),
                        zoom: 14,
                      ),
                      myLocationEnabled: true,
                      myLocationButtonEnabled: true,
                      mapType: MapType.normal,
                      zoomControlsEnabled: true,
                      zoomGesturesEnabled: true,
                      scrollGesturesEnabled: true,
                      tiltGesturesEnabled: true,
                      rotateGesturesEnabled: true,
                      compassEnabled: true,
                      mapToolbarEnabled: true,
                      trafficEnabled: true,
                      indoorViewEnabled: true,
                      buildingsEnabled: true,
                      onTap: (LatLng latLng) {
                        print(latLng);
                      },
                    )),
          ),
        ],
      ),
    );
  }
}
