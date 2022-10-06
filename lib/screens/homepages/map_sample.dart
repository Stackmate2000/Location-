import 'dart:async';
import 'dart:math' as Math;
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:free_place_search/core/api.dart';
import 'package:free_place_search/models/address.dart';
import 'package:free_place_search/place_search.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  late GoogleMapController googleMapController;
  static const CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14,
    tilt: 30,
  );

  Set<Marker> markers = {};
  String Address = "", stAdd = "";

  StreamController<Position> _locStream = StreamController();
  late StreamSubscription<Position> locationSubscription;
  late Color textColor = Colors.blue;

  @override
  void initState() {
    super.initState();
    GeolocatorPlatform.instance.requestPermission();
  }

  @override
  void dispose() {
    _locStream.close();
    locationSubscription.cancel();
    super.dispose();
  }

  startLocation() {
    final positionStream =
        Geolocator.getPositionStream().handleError((error) {});
    locationSubscription = positionStream.listen((Position position) {
      _locStream.sink.add(position);

      if (textColor == Colors.blue) {
        textColor = Colors.red;
      } else {
        textColor = Colors.blue;
      }
    });
  }

  pauseLocation() async {
    locationSubscription.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: _locStream.stream,
        builder: (context, snapshot) => Stack(
          children: [
            GoogleMap(
              initialCameraPosition: initialCameraPosition,
              markers: markers,
              mapType: MapType.normal,
              zoomControlsEnabled: false,
              onMapCreated: (GoogleMapController controller) {
                googleMapController = controller;
              },
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xff000000),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    right: 15.0,
                    top: 30.0,
                    bottom: 30.0,
                  ),
                  child: SafeArea(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.location,
                                color: Color(0xffFFFFFF),
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text(
                                  Address,
                                  style: GoogleFonts.nunito(
                                      color: Color(0xffFFFFFF),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(height: 10.0),
                        // Container(
                        //   child: Row(
                        //     children: [
                        //       Icon(
                        //         CupertinoIcons.location,
                        //         color: Color(0xffFFFFFF),
                        //       ),
                        //       SizedBox(
                        //         width: 15.0,
                        //       ),
                        //       Text(
                        //         snapshot.data == null
                        //             ? "Stream location"
                        //             : snapshot.connectionState ==
                        //                     ConnectionState.waiting
                        //                 ? "Connecting"
                        //                 : snapshot.data.toString(),
                        //         style: GoogleFonts.nunito(
                        //             color: Color(0xffFFFFFF).withOpacity(0.9),
                        //             fontSize: 14,
                        //             fontWeight: FontWeight.w400),
                        //       ),
                        //     ],
                        //   ),
                        // ),

                        SizedBox(
                          height: 15.0,
                        ),

                        Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () async {
                              //streamPosition
                              // startLocation();

                              //Distance Caluculator
                              // double distanceInMeters = Geolocator.distanceBetween(
                              //     26.7500, 94.2200, 26.9800, 94.6299);
                              // print(distanceInMeters);

                              // setState(() {});

                              //geolocator
                              Position position =
                                  await _getGeoLocationPosition();
                              googleMapController.animateCamera(
                                  CameraUpdate.newCameraPosition(CameraPosition(
                                      target: LatLng(position.latitude,
                                          position.longitude),
                                      zoom: 18,
                                      tilt: 30)));

                              markers.clear();
                              markers.add(
                                Marker(
                                  markerId: const MarkerId("currentLocation"),
                                  position: LatLng(
                                      position.latitude, position.longitude),
                                ),
                              );

                              setState(() {});
                              //Geocoding
                              Position pposition =
                                  await _getGeoLocationPosition();
                              var location =
                                  'Lat: ${position.latitude} , Long: ${position.longitude}';
                              GetAddressFromLatLong(position);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                "get current location",
                                style: GoogleFonts.nunito(
                                    color: Color(0xffFFFFFF),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
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
          ],
        ),
      ),
    );
  }

  double deg2rad(deg) {
    return deg * (Math.pi / 180);
  }

  Future<void> GetAddressFromLatLong(Position pposition) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(pposition.latitude, pposition.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    Address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(() {});
  }

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}
