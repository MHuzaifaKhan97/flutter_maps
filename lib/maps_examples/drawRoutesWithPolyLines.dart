import 'package:flutter/material.dart';
import 'package:google_map_polyline/google_map_polyline.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DrawRoutesWithPolyLines extends StatefulWidget {
  @override
  _DrawRoutesWithPolyLinesState createState() =>
      _DrawRoutesWithPolyLinesState();
}

// It's not working until we Enabled DirectionAPI which is actually paid.
class _DrawRoutesWithPolyLinesState extends State<DrawRoutesWithPolyLines> {
  GoogleMapController controller;
  final Set<Polyline> polyline = {};
  List<LatLng> routeCoords;
  GoogleMapPolyline googleMapPolyline =
      new GoogleMapPolyline(apiKey: 'yourapikey');

  getSomePoints() async {
    routeCoords = await googleMapPolyline.getCoordinatesWithLocation(
        origin: LatLng(24.8379341, 67.0786426),
        destination: LatLng(24.8281093, 67.1573888),
        mode: RouteMode.driving);

    print(routeCoords);
  }

  getaddressPoints() async {
    routeCoords = await googleMapPolyline.getPolylineCoordinatesWithAddress(
        origin: '55 Kingston Ave, Brooklyn, NY 11213, USA',
        destination: '178 Broadway, Brooklyn, NY 11211, USA',
        mode: RouteMode.driving);
  }

  @override
  initState() {
    super.initState();
    getSomePoints();
    // getaddressPoints();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Google Maps Example')),
        body: GoogleMap(
          initialCameraPosition:
              CameraPosition(target: LatLng(24.8379341, 67.0786426), zoom: 15),
          mapType: MapType.normal,
          polylines: polyline,
          onMapCreated: onMapCreated,
        ));
  }

  void onMapCreated(GoogleMapController controller) {
    setState(() {
      controller = controller;
      polyline.add(Polyline(
        polylineId: PolylineId('route1'),
        visible: true,
        points: routeCoords ?? routeCoords,
        width: 4,
        color: Colors.blue,
        startCap: Cap.roundCap,
        endCap: Cap.buttCap,
      ));
    });
  }
}
