// ignore_for_file: camel_case_types, use_key_in_widget_constructors, unused_local_variable, avoid_unnecessary_containers
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gym1/utils/navigators.dart';
import '../../gyms/Armygym.dart';
import '../../widgets/appBar/custom_appBar.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  GoogleMapController? _mapController;
  Position? _currentPosition;
  final LatLng _initialPosition = LatLng(31.9544, 35.9106); // Default to San Francisco
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
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
      return Future.error('Location permissions are permanently denied.');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPosition = position;
      _markers.add(
        Marker(
          markerId: MarkerId('currentLocation'),
          position: LatLng(
            _currentPosition!.latitude,
            _currentPosition!.longitude,
          ),
          infoWindow: InfoWindow(
            title: 'Current Location',
            snippet: 'This is your current location',
            onTap: _onMarkerTapped,
          ),
        ),
      );
      _markers.add(
        Marker(
          markerId: MarkerId('anotherLocation'),
          position: LatLng(
              31.990607424867047, 35.909659606804034
          ),
          infoWindow: InfoWindow(
            title: 'Another Location',
            snippet: 'This is another location',
            onTap: _onAnotherMarkerTapped,
          ),
        ),
      );
      _mapController?.animateCamera(
        CameraUpdate.newLatLng(
          LatLng(position.latitude, position.longitude),
        ),
      );
    });
  }

  void _onMarkerTapped() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text('Current Location Marker tapped!'),
        );
      },
    );
  }

  void _onAnotherMarkerTapped() {
    pushNewScreen(context, Armygym());

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location on Map'),
      ),
      body: _currentPosition == null
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
        onMapCreated: (controller) {
          _mapController = controller;
        },
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 14.0,
        ),
        markers: _markers,
      ),
    );
  }
}