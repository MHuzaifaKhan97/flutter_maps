import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddMarkerOnTap extends StatefulWidget {
  @override
  _AddMarkerOnTapState createState() => _AddMarkerOnTapState();
}

class _AddMarkerOnTapState extends State<AddMarkerOnTap> {
  List<Marker> myMarker = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Google Maps Example')),
        body: GoogleMap(
          initialCameraPosition:
              CameraPosition(target: LatLng(24.8379341, 67.0786426), zoom: 15),
          markers: Set.from(myMarker),
          mapType: MapType.normal,
          onTap: _handleTap,
        ));
  }

  _handleTap(LatLng tappedPoint) {
    setState(() {
      myMarker = [];
      myMarker.add(Marker(
        markerId: MarkerId(tappedPoint.toString()),
        position: tappedPoint,
        draggable: true,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        onDragEnd: (dragEndPosition) {
          print("Drag End Position");
          print(dragEndPosition);
        },
      ));
    });
    print("Tapped Point");
    print(tappedPoint);
  }
}
