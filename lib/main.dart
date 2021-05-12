import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_maps/maps_examples/drawRoutesWithPolyLines.dart';
import 'package:flutter_maps/maps_examples/addMarkerOnTap.dart';
import 'package:flutter_maps/maps_examples/mapsAndMarker.dart';

void main() {
  runZoned<Future<Null>>(() async {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: MapsAndMarker(),
      home: AddMarkerOnTap(),
      // home: DrawRoutesWithPolyLines(),
    );
  }
}
