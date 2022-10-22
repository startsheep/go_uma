import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapsController extends GetxController {
  //TODO: Implement MapsController
  late GoogleMapController mapController;
  late CameraPosition initialCameraPosition;
  final Rx<LatLng> currentLocation = LatLng(-6.903257, 107.613144).obs;
  // late Set<Marker> markers;

  late String mapStyle;
  Map<String, Marker> markers = <String, Marker>{}.obs;
  final count = 0.obs;
  addMarker(String id, LatLng location) {
    var marker = Marker(
      markerId: MarkerId(id),
      position: location,
      infoWindow: InfoWindow(title: id, snippet: '*'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueViolet,
      ),
    );
    markers[id] = marker;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
