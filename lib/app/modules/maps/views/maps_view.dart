import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controllers/maps_controller.dart';

class MapsView extends GetView<MapsController> {
  const MapsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Obx(
        () {
          return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: controller.currentLocation.value,
              zoom: 20,
            ),
            mapType: MapType.normal,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            zoomControlsEnabled: true,
            zoomGesturesEnabled: true,
            onMapCreated: (GoogleMapController controllers) {
              controller.mapController = controllers;
              controller.addMarker('Ahmad', controller.currentLocation.value);

              // controller.setMapStyle(controller.mapStyle);
            },
            markers: {
              for (final marker in controller.markers.values) marker,
            },
          );
        },
      )),
    );
  }
}
