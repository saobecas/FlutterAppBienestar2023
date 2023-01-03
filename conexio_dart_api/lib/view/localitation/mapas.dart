import 'dart:async';
import 'package:conexio_dart_api/res/color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViews extends StatefulWidget {
  final latitud;
  final longitud;
  final name;

  const MapViews({super.key, this.latitud, this.longitud, this.name});

  @override
  State<MapViews> createState() => _MapViewsState();
}

class _MapViewsState extends State<MapViews> {
  final TextEditingController _coordenadas = TextEditingController();
  final TextEditingController _lat = TextEditingController();
  final TextEditingController _long = TextEditingController();
  FocusNode latitud = FocusNode();
  FocusNode longitud = FocusNode();
  Completer<GoogleMapController> _controller = Completer();
  var _botonLocatitation = false;
  var _mylocalitation = false;
  // on below line we have specified camera position
  static CameraPosition _kGoogle = CameraPosition(
    target: LatLng(17.060668, -96.725646),
    zoom: 14.4746,
  );

  final List<Marker> _markers = <Marker>[];

  //Location _location = Location();
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      if (kDebugMode) {
        print("ERROR" + error.toString());
      }
    });
    setState(() {
      if (_mylocalitation != true || _botonLocatitation != true) {
        _mylocalitation = true;
        _botonLocatitation = true;
      }
    });
    if (kDebugMode) {
      print("My position desde el future: ${_mylocalitation}");
    }
    return await Geolocator.getCurrentPosition();
  }

  void setCoordenadas() {
    _lat.text = this.widget.latitud.toString();
    _long.text = this.widget.longitud.toString();
    print("Estableciendo coordenadas: ");
    print("Estableciendo latitud: " + _lat.text.toString());

    print("Estableciendo longitud: " + _long.text.toString());
  }

  void setMakert() async {
    _markers.add(Marker(
      markerId: MarkerId("2"),
      //position: LatLng(value.latitude, value.longitude),
      position: LatLng(this.widget.latitud, this.widget.longitud),
      infoWindow: InfoWindow(
        title: this.widget.name.toString(),
      ),
    ));

    _mylocalitation = true;
    _botonLocatitation = true;
    _kGoogle = new CameraPosition(
        target: LatLng(this.widget.latitud, this.widget.longitud), zoom: 10);

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kGoogle));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getUserCurrentLocation();
    setCoordenadas();
    setMakert();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: Text("Ubicacion"),
          centerTitle: true,
          backgroundColor: AppColors.grenSnackBar),
      body: GoogleMap(
        initialCameraPosition: _kGoogle,
        markers: Set<Marker>.of(_markers),
        mapType: MapType.normal,
        zoomControlsEnabled: true,
        buildingsEnabled: true,
        compassEnabled: true,
        rotateGesturesEnabled: true,
        scrollGesturesEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        myLocationButtonEnabled: _botonLocatitation,
        myLocationEnabled: _mylocalitation,
      ),
    );
  }
}
