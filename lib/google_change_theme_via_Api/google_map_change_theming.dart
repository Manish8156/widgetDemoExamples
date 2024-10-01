import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapChangeTheming extends StatefulWidget {
  const GoogleMapChangeTheming({super.key});

  @override
  State<GoogleMapChangeTheming> createState() => _GoogleMapChangeThemingState();
}

class _GoogleMapChangeThemingState extends State<GoogleMapChangeTheming> {
  // final Completer<GoogleMapController> _controller = Completer();
  GoogleMapController? _controller;
  static const LatLng _center = LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    debugPrint('map id::${controller.mapId}');
    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maps Sample App'),
        backgroundColor: Colors.green[700],
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: const CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
    );
  }
}
