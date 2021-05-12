import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:search_map_place/search_map_place.dart';

class SearchPlaceMap extends StatefulWidget {
  @override
  _SearchPlaceMapState createState() => _SearchPlaceMapState();
}

class _SearchPlaceMapState extends State<SearchPlaceMap> {
  GoogleMapController mapController;
  List<Marker> myMarker = [];

  @override
  void initState() {
    super.initState();

    addInitialMarker();
  }

  void addInitialMarker() {
    setState(() {
      myMarker = [];
      myMarker.add(
        Marker(
          markerId: MarkerId('MyMarkerID'),
          draggable: true,
          onTap: () {
            print('Marker Tapped');
          },
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          position: LatLng(24.8281142, 67.1573888),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.only(top: 16),
            child: GoogleMap(
              onCameraMove: (CameraPosition position) {},
              onMapCreated: (GoogleMapController googleMapController) {
                setState(() {
                  mapController = googleMapController;
                });
              },
              initialCameraPosition: CameraPosition(
                  zoom: 14, target: LatLng(24.8281142, 67.1573888)),
              mapType: MapType.normal,
              markers: Set.from(myMarker),
              onTap: _handleTap,
            ),
          ),
          Container(
            // height: 100,
            alignment: Alignment.topCenter,
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.09),
            child: SearchMapPlaceWidget(
              hasClearButton: true,
              placeType: PlaceType.address,
              placeholder: 'Enter Location',
              apiKey: 'AIzaSyDbSvp9iW6DnqHroXOxB5QX2TBExz5OWAE',
              onSelected: (Place place) async {
                Geolocation geolocation = await place.geolocation;
                mapController.animateCamera(
                    CameraUpdate.newLatLng(geolocation.coordinates));
                mapController.animateCamera(
                    CameraUpdate.newLatLngBounds(geolocation.bounds, 0));

                setState(() {
                  myMarker = [];
                  myMarker.add(
                    Marker(
                      markerId: MarkerId('MyMarkerID'),
                      draggable: true,
                      onTap: () {
                        print('Marker Tapped');
                      },
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueRed),
                      position: geolocation.coordinates,
                    ),
                  );
                });
              },
            ),
          ),
        ],
      ),
    );
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
