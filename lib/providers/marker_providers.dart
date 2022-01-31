// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerProvider extends ChangeNotifier {
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  BitmapDescriptor sportsMarkers = BitmapDescriptor.defaultMarker;
  BitmapDescriptor customIcon = BitmapDescriptor.defaultMarker;

  void setCustomMarker() async {
    customIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 10.0),
        'assets/images/user_location.png');

    sportsMarkers = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 10.0),
        'assets/images/markers.png');
  }

  void setMarker(double lat, double lon) {
    Marker marker = Marker(
      markerId: MarkerId('place_name'),
      position: LatLng(lat, lon),
      icon: customIcon,
      infoWindow: InfoWindow(
        title: 'title',
        snippet: 'address',
      ),
    );

    final markerThree = Marker(
      markerId: MarkerId('thrid'),
      position: LatLng(
        (lat + 0.012),
        (lon - 0.022),
      ),
      icon: sportsMarkers,
      infoWindow: InfoWindow(
        title: 'title',
        snippet: 'address',
      ),
    );

    final markerFour = Marker(
      markerId: MarkerId('fourth'),
      position: LatLng(
        (lat - 0.017),
        (lon + 0.028),
      ),
      icon: sportsMarkers,
      infoWindow: InfoWindow(
        title: 'title',
        snippet: 'address',
      ),
    );
    final markerFive = Marker(
      markerId: MarkerId('fifth'),
      position: LatLng(
        (lat + 0.027),
        (lon + 0.038),
      ),
      icon: sportsMarkers,
      infoWindow: InfoWindow(
        title: 'title',
        snippet: 'address',
      ),
    );
    final markerSix = Marker(
      markerId: MarkerId('sixth'),
      position: LatLng(
        (lat - 0.037),
        (lon - 0.048),
      ),
      icon: sportsMarkers,
      infoWindow: InfoWindow(
        title: 'title',
        snippet: 'address',
      ),
    );
    markers[MarkerId('place_name')] = marker;
    markers[MarkerId('third')] = markerThree;
    markers[MarkerId('fourth')] = markerFour;
    markers[MarkerId('fifth')] = markerFive;
    markers[MarkerId('sixth')] = markerSix;
    notifyListeners();
  }

  Set<Marker> get getMarkers {
    return markers.values.toSet();
  }
}
