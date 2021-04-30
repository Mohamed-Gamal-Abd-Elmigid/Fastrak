import 'package:country_code_picker/country_code_picker.dart';
import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:loginscreen/testMap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_map_location_picker/generated/l10n.dart'
    as location_picker;
import 'package:google_map_location_picker/generated/l10n.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';
// import 'package:google_map_location_picker_example/keys.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class pickUpLocations extends StatefulWidget {
  @override
  _pickUpLocationsState createState() => _pickUpLocationsState();
}

class _pickUpLocationsState extends State<pickUpLocations> {
  var _blankFocusNode = new FocusNode();
  String dropdownValue = 'One';

  LocationResult _pickedLocation;

  String apiKey = "AIzaSyAuprYnabKPWTojt2BA6uTf-Ybe3m6Y5RM";

  List items = [
    "inside the city",
    "Brasil",
    "Itália",
    "Estados Unidos",
    "Canadá"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'location picker',
      localizationsDelegates: const [
        location_picker.S.delegate,
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[
        Locale('en', ''),
        Locale('ar', ''),
        Locale('pt', ''),
        Locale('tr', ''),
        Locale('es', ''),
        Locale('it', ''),
        Locale('ru', ''),
      ],
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          // title: Image('assets/logo.png'),You can add title here
          title: Image(
            image: AssetImage(
              'assets/logo.png',
            ),
            width: MediaQuery.of(context).size.width * 0.35,
            height: MediaQuery.of(context).size.height * 0.066,
          ),
          leading: new IconButton(
            icon: new Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
              size: MediaQuery.of(context).size.width * 0.07,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Color(0xFFF9FAFF), //You can make this transparent
          elevation: 0.0, //No shadow
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(_blankFocusNode);
          },
          child: SafeArea(
            child: Container(
              color: Color(0xFFF9FAFF),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Pickup "),
                          Text('Locations'),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Container(
                            //   padding: EdgeInsets.only(top: 10),
                            height: 4.0,
                            width: MediaQuery.of(context).size.width / 7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.all(20),
                        width: double.infinity,
                        height: 200,
                        child: Image(
                          image: AssetImage('assets/location.png'),
                          // fit: BoxFit.contain,
                        ),
                      ),
                      // FindDropdown(
                      //   items: [
                      //     "inside the city",
                      //     "Brasil",
                      //     "Itália",
                      //     "Estados Unidos",
                      //     "Canadá"
                      //   ],
                      //   label: "Type of delivery",
                      //   labelStyle: TextStyle(
                      //     fontSize: 14,
                      //     color: Colors.grey.shade600,
                      //   ),
                      //   onChanged: (String item) => print(item),
                      //   selectedItem: "inside the city",
                      // ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Type of delivery',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: TextFormField(
                                textAlignVertical: TextAlignVertical.bottom,
                                onChanged: (String item) => print(item),
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(10.0),
                                    ),
                                  ),
                                  suffixIcon: Icon(Icons.arrow_drop_down),
                                  errorStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 10),
                                  hintText: 'inside the city',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.teal,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'pickup location',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Container(
//                               child: RaisedButton.icon(
//                                 // textAlignVertical: TextAlignVertical.bottom,
//                                 onPressed: () async {
//                                   LocationResult result =
//                                       await showLocationPicker(
//                                     context,
//                                     apiKey,
//                                     initialCenter:
//                                         LatLng(31.1975844, 29.9598339),
// //                      automaticallyAnimateToCurrentLocation: true,
// //                      mapStylePath: 'assets/mapStyle.json',
//                                     myLocationButtonEnabled: true,
//                                     // requiredGPS: true,
//                                     layersButtonEnabled: true,
//                                     countries: ['AE', 'NG'],
//
// //                      resultCardAlignment: Alignment.bottomCenter,
//                                     desiredAccuracy: LocationAccuracy.best,
//                                   );
//                                   print("result = $result");
//                                   setState(() => _pickedLocation = result);
//                                 },
//                                 label: Text('${_pickedLocation}'),
//                                 icon: Icon(Icons.add_location),
//                                 // decoration: InputDecoration(
//                                 //   focusedBorder: OutlineInputBorder(
//                                 //     borderSide: BorderSide(
//                                 //       color: Colors.black,
//                                 //     ),
//                                 //     borderRadius: const BorderRadius.all(
//                                 //       const Radius.circular(10.0),
//                                 //     ),
//                                 //   ),
//                                 //   suffixIcon: Icon(Icons.location_on_outlined),
//                                 //   errorStyle: TextStyle(
//                                 //     color: Colors.grey,
//                                 //     fontWeight: FontWeight.bold,
//                                 //     fontSize: 15,
//                                 //   ),
//                                 //   contentPadding: EdgeInsets.symmetric(
//                                 //       vertical: 20, horizontal: 10),
//                                 //   hintText: 'pickup location',
//                                 //   border: OutlineInputBorder(
//                                 //     borderSide: BorderSide(
//                                 //       color: Colors.teal,
//                                 //     ),
//                                 //     borderRadius: const BorderRadius.all(
//                                 //       const Radius.circular(10.0),
//                                 //     ),
//                                 //   ),
//                                 // ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
                      SizedBox(height: 15),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Delever to',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: TextFormField(
                                textAlignVertical: TextAlignVertical.bottom,
                                onChanged: (text) {
                                  // value = text;
                                },
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(10.0),
                                    ),
                                  ),
                                  suffixIcon: Icon(Icons.location_on_outlined),
                                  errorStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 10),
                                  hintText: 'drop-of location',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.teal,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(10.0),
                                    ),
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Requird";
                                  } else if (value.length < 10 ||
                                      value.length > 11) {
                                    return "Not Valid Number";
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xFF4B0082),
                            ),
                          ),
                          child: Text(
                            'Next',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void pickLocation(context) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        backgroundColor: Colors.white,
        isScrollControlled: true,
        builder: (BuildContext bc) {
          return Container(
            height: MediaQuery.of(context).size.height / 2,
            child: Center(
              child: Container(
                padding: EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Add pickup locatioin",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 40,
                        right: 40,
                      ),
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'My Addresses',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: TextFormField(
                              textAlignVertical: TextAlignVertical.bottom,
                              onChanged: (String item) => print(item),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(10.0),
                                  ),
                                ),
                                suffixIcon: Icon(Icons.keyboard_arrow_down),
                                errorStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 10),
                                hintText: 'Choose Address',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.teal,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: ButtonTheme(
                        height: MediaQuery.of(context).size.height / 14,
                        child: FlatButton(
                          onPressed: () {},
                          child: Center(
                              child: Text(
                            "Confirm",
                            style: TextStyle(
                                color: Color(0xFF4B0082),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFF4B0082),
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: ButtonTheme(
                        height: MediaQuery.of(context).size.height / 14,
                        child: FlatButton(
                          onPressed: () {
                            newAddress(context);
                          },
                          child: Center(
                              child: Text(
                            "Add New Address",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFF4B0082),
                        ),
                        color: Color(0xFF4B0082),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  void newAddress(context) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        backgroundColor: Colors.white,
        isScrollControlled: true,
        builder: (BuildContext bc) {
          return Container(
            height: MediaQuery.of(context).size.height / 1.1,
            child: Center(
              child: Container(
                padding: EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Add New Address Title",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 40,
                        right: 40,
                      ),
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'City',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: TextFormField(
                              textAlignVertical: TextAlignVertical.bottom,
                              onChanged: (String item) => print(item),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(10.0),
                                  ),
                                ),
                                suffixIcon: Icon(Icons.keyboard_arrow_down),
                                errorStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 10),
                                hintText: 'City',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.teal,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Area',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: TextFormField(
                              textAlignVertical: TextAlignVertical.bottom,
                              onChanged: (String item) => print(item),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(10.0),
                                  ),
                                ),
                                suffixIcon: Icon(Icons.keyboard_arrow_down),
                                errorStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 10),
                                hintText: 'Maadi',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.teal,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Address',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: TextFormField(
                              textAlignVertical: TextAlignVertical.bottom,
                              onChanged: (String item) => print(item),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(10.0),
                                  ),
                                ),
                                suffixIcon: Icon(Icons.keyboard_arrow_down),
                                errorStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 10),
                                hintText:
                                    '347 Nile Corniche , Al Maadi , Cairo.',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.teal,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Location on map',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: TextFormField(
                              textAlignVertical: TextAlignVertical.bottom,
                              onChanged: (String item) => print(item),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(10.0),
                                  ),
                                ),
                                suffixIcon: Icon(Icons.keyboard_arrow_down),
                                errorStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 10),
                                hintText: 'Default Location',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.teal,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Mobile Number',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: TextFormField(
                              textAlignVertical: TextAlignVertical.bottom,
                              onChanged: (text) {
                                // value = text;
                              },
                              // controller: PhoneNumberController,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(10.0),
                                  ),
                                ),
                                prefixIcon: Container(
                                  width: MediaQuery.of(context).size.width / 5,
                                  child: Row(
                                    children: [
                                      CountryCodePicker(
                                        onInit: (value) {},
                                        initialSelection: 'EG',
                                        showFlag: false,
                                        alignLeft: false,
                                        textStyle: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(right: 10),
                                        height: 20.0,
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                    ],
                                  ),
                                ),
                                errorStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 10),
                                hintText: '11234567890',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.teal,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(10.0),
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                // if (value.isEmpty) {
                                //   return "Requird";
                                // } else if (value.length < 10 ||
                                //     value.length > 11) {
                                //   return "Not Valid Number";
                                // }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: ButtonTheme(
                        height: MediaQuery.of(context).size.height / 14,
                        child: FlatButton(
                          onPressed: () {},
                          child: Center(
                              child: Text(
                            "Add Adress",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFF4B0082),
                        ),
                        color: Color(0xFF4B0082),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
