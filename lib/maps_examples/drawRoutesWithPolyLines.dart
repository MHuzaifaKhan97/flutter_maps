import 'package:flutter/material.dart';
import 'package:google_map_polyline/google_map_polyline.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class DrawRoutesWithPolyLines extends StatefulWidget {
  @override
  _DrawRoutesWithPolyLinesState createState() =>
      _DrawRoutesWithPolyLinesState();
}

// It's not working until we Enabled DirectionAPI which is actually paid.
class _DrawRoutesWithPolyLinesState extends State<DrawRoutesWithPolyLines> {
  GoogleMapController _controller;
  final Set<Polyline> polyline = {};
  List<LatLng> routeCoords;
  GoogleMapPolyline googleMapPolyline =
      new GoogleMapPolyline(apiKey: 'AIzaSyDbSvp9iW6DnqHroXOxB5QX2TBExz5OWAE');
  Permission _permission;
  PermissionStatus _permissionStatus = PermissionStatus.denied;

  void _listenForPermissionStatus() async {
    final status = await _permission.status;
    setState(() => _permissionStatus = status);
  }

  Future<void> requestPermission(Permission permission) async {
    final status = await permission.request();

    setState(() {
      print(status);
      _permissionStatus = status;
      print(_permissionStatus);
    });
  }

  @override
  initState() {
    super.initState();
    getSomePoints();
  }

  getSomePoints() async {
    routeCoords = await googleMapPolyline.getCoordinatesWithLocation(
        origin: LatLng(24.8379341, 67.0786426),
        destination: LatLng(24.8281093, 67.1573888),
        mode: RouteMode.driving);
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
      _controller = controller;
      polyline.add(Polyline(
        polylineId: PolylineId('route1'),
        visible: true,
        points: routeCoords,
        width: 4,
        color: Colors.blue,
        startCap: Cap.roundCap,
        endCap: Cap.buttCap,
      ));
    });
  }
}
