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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff8460eb),
        title: Icon(
          CupertinoIcons.tortoise_fill,
          size: 30,
          color: Color(0xffFFFFFF),
        ),
      ),
      body: StreamBuilder(
        stream: _locStream.stream,
        builder: (context, snapshot) => Stack(
          children: [
            GoogleMap(
              initialCameraPosition: initialCameraPosition,
              markers: markers,
              mapType: MapType.hybrid,
              zoomControlsEnabled: false,
              onMapCreated: (GoogleMapController controller) {
                googleMapController = controller;
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16.0),
                        ),
                        color: Color(0xffFFFFFF),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff000000).withOpacity(0.1),
                            blurRadius: 20.0,
                            spreadRadius: 2.0,
                            offset: Offset(0.0, 10.0),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.stream),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              snapshot.data == null
                                  ? "Stream location"
                                  : snapshot.connectionState ==
                                          ConnectionState.waiting
                                      ? "Connecting"
                                      : snapshot.data.toString(),
                              style: GoogleFonts.montserrat(
                                  color: Color(0xff000000).withOpacity(0.9),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16.0),
                        ),
                        color: Color(0xffFFFFFF),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff000000).withOpacity(0.1),
                            blurRadius: 20.0,
                            spreadRadius: 2.0,
                            offset: Offset(0.0, 10.0),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          Address,
                          style: GoogleFonts.montserrat(
                              color: Color(0xff000000).withOpacity(0.9),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () async {
                    //streamPosition
                    startLocation();

                    //Distance Caluculator
                    double distanceInMeters = Geolocator.distanceBetween(
                        26.7500, 94.2200, 26.9800, 94.6299);
                    print(distanceInMeters);

                    setState(() {});

                    //geolocator
                    Position position = await _getGeoLocationPosition();
                    googleMapController.animateCamera(
                        CameraUpdate.newCameraPosition(CameraPosition(
                            target:
                                LatLng(position.latitude, position.longitude),
                            zoom: 18,
                            tilt: 30)));

                    markers.clear();
                    markers.add(
                      Marker(
                        markerId: const MarkerId("currentLocation"),
                        position: LatLng(position.latitude, position.longitude),
                      ),
                    );

                    setState(() {});
                    //Geocoding
                    Position pposition = await _getGeoLocationPosition();
                    var location =
                        'Lat: ${position.latitude} , Long: ${position.longitude}';
                    GetAddressFromLatLong(position);
                  },
                  child: Container(
                      alignment: Alignment.center,
                      height: 55,
                      width: 55,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff000000).withOpacity(0.4),
                            blurRadius: 20.0,
                            spreadRadius: 2.0,
                            offset: Offset(0.0, 10.0),
                          ),
                        ],
                        color: Color(0xff8460eb),
                        borderRadius: BorderRadius.all(
                          Radius.circular(16.0),
                        ),
                      ),
                      child: Icon(
                        CupertinoIcons.map_pin,
                        color: Color(0xffFFFFFF),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void main() =>
      print(getDistanceFromLatLonInKm(73.4545, 73.4545, 83.5454, 83.5454));

  double getDistanceFromLatLonInKm(lat1, lon1, lat2, lon2) {
    var R = 6371; // Radius of the earth in km
    var dLat = deg2rad(lat2 - lat1); // deg2rad below
    var dLon = deg2rad(lon2 - lon1);
    var a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
        Math.cos(deg2rad(lat1)) *
            Math.cos(deg2rad(lat2)) *
            Math.sin(dLon / 2) *
            Math.sin(dLon / 2);
    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    var d = R * c; // Distance in km
    return d;
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
