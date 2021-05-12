// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong/latlong.dart';

// class MapsAndMarker extends StatefulWidget {
//   @override
//   _MapsAndMarkerState createState() => _MapsAndMarkerState();
// }

// class _MapsAndMarkerState extends State<MapsAndMarker> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Google Maps Example')),
//       body: Stack(
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height - 50,
//             width: MediaQuery.of(context).size.width,
//             child: FlutterMap(
//                 options: MapOptions(
//                     zoom: 14,
//                     minZoom: 10.0,
//                     center: LatLng(24.8281142, 67.1573888)),
//                 layers: [
//                   TileLayerOptions(
//                       urlTemplate:
//                           'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
//                       subdomains: ['a', 'b', 'c']),
//                   MarkerLayerOptions(markers: [
//                     Marker(
//                       width: 45,
//                       height: 45,
//                       point: LatLng(24.8281142, 67.1573888),
//                       builder: (context) => Container(
//                         child: IconButton(
//                           icon: Icon(
//                             Icons.location_on,
//                             color: Colors.red,
//                           ),
//                           onPressed: () {},
//                           iconSize: 45,
//                         ),
//                       ),
//                     )
//                   ])
//                 ]),
//           )
//         ],
//       ),
//     );
//   }
// }
