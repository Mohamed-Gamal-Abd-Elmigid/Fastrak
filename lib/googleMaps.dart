// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_map_location_picker/google_map_location_picker.dart';
// import 'package:google_map_location_picker/generated/l10n.dart'
//     as location_picker;
// import 'package:flutter_localizations/flutter_localizations.dart';
//
// class GoogleMaps extends StatefulWidget {
//   @override
//   _GoogleMapsState createState() => _GoogleMapsState();
// }
//
// class _GoogleMapsState extends State<GoogleMaps> {
//   // GoogleMapController mapController;
//   // String searchAddress;
//
//   // LocationResult result = await showLocationPicker(context, apiKey);
//
//   String APIKEY = "AIzaSyAuprYnabKPWTojt2BA6uTf-Ybe3m6Y5RM";
//   LocationResult _pickedLocation;
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'location picker',
//       localizationsDelegates: const [
//         location_picker.S.delegate,
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//       ],
//       supportedLocales: const <Locale>[
//         Locale('en', ''),
//         Locale('ar', ''),
//       ],
//       home: Scaffold(
//         body: Stack(
//           children: [
//             GoogleMap(
//               onMapCreated: onMapCreated,
//               initialCameraPosition: CameraPosition(
//                 target: LatLng(40.7128, -74.0060),
//                 zoom: 10.0,
//               ),
//             ),
//             Positioned(
//               top: 30.0,
//               right: 15.0,
//               left: 15.0,
//               child: Container(
//                 height: 50.0,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: Colors.white,
//                 ),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     hintText: "Enter Address",
//                     border: InputBorder.none,
//                     contentPadding: EdgeInsets.only(left: 15, right: 15),
//                     suffixIcon: IconButton(
//                       onPressed: () {},
//                       icon: Icon(Icons.search),
//                       onPressed: searchandNavigate,
//                       iconSize: 30,
//                     ),
//                   ),
//                   onChanged: (value) {
//                     // searchAddress = value;
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // void searchandNavigate() {
//   //     Geolocator().
//   // }
//
//   void onMapCreated(controller) {
//     setState(() {
//       // mapController = controller;
//     });
//   }
// }
