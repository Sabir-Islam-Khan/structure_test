import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:matchmap_app/providers/map_style_provider.dart';
import 'package:matchmap_app/providers/marker_providers.dart';
import 'package:provider/provider.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final LatLng _initialcameraposition = LatLng(50.5937, 8.9629);

  late GoogleMapController _controller;

  final Location _location = Location();

  int animateValue = 1;

  void _onMapCreated(GoogleMapController _cntlr) {
    // setCustomMarker();
    _controller = _cntlr;

    String style = Provider.of<MapStyleProvider>(context, listen: false).data;

    _controller.setMapStyle(style);
    _location.onLocationChanged.listen((l) {
      Provider.of<MarkerProvider>(context, listen: false)
          .setMarker(l.latitude!, l.longitude!);
      if (animateValue == 1) {
        _controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: LatLng(l.latitude!, l.longitude!), zoom: 12),
          ),
        );
      }

      setState(() {
        animateValue++;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    Provider.of<MarkerProvider>(context, listen: false).setCustomMarker();
    Provider.of<MapStyleProvider>(context, listen: false).setMapStyle(context);
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition:
          CameraPosition(target: _initialcameraposition, zoom: 5.0),
      mapType: MapType.normal,
      onMapCreated: _onMapCreated,
      myLocationEnabled: false,
      zoomControlsEnabled: false,
      markers: Provider.of<MarkerProvider>(context).getMarkers,
    );
  }
}
