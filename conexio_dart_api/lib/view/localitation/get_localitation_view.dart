import 'package:conexio_dart_api/res/components/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:geolocator/geolocator.dart';

class GetLocations extends StatefulWidget {
  const GetLocations({super.key});

  @override
  State<GetLocations> createState() => _GetLocationsState();
}

class _GetLocationsState extends State<GetLocations> {
  var locationsMessage = "";

  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    print("Last: " + lastPosition.toString());

    setState(() {
      locationsMessage =
          "Latitud: ${position.latitude}\n" + "Longitud: ${position.longitude}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SERVICIO DE UBICACION"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on,
              size: 50,
              color: Colors.blue,
            ),
            SizedBox(height: 12),
            Text("Get ubicacion",
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text("Position: ${locationsMessage}"),
            RoundButton(
              title: "Obtener",
              onPress: () {
                getCurrentLocation();
              },
            )
          ],
        ),
      ),
    );
  }
}
