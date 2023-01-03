import 'package:conexio_dart_api/model/sare/sares_model.dart';
import 'package:conexio_dart_api/res/color.dart';
import 'package:conexio_dart_api/view/localitation/mapas.dart';
import 'package:flutter/material.dart';

class SareGetIdDetail extends StatefulWidget {
  final Sares? sares;
  SareGetIdDetail(
    this.sares, {
    super.key,
  });

  @override
  State<SareGetIdDetail> createState() => _SchoolGetIdDetailState();
}

class _SchoolGetIdDetailState extends State<SareGetIdDetail> {
  Sares schoolModel = Sares();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Detalle SARE"),
          centerTitle: true,
          backgroundColor: AppColors.grenSnackBar,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ListTile(
                  title: Text(
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                      ),

                      //textAlign: TextAlign.justify,
                      textAlign: TextAlign.left,
                      "Sare: ${widget.sares!.nameSare.toString().toUpperCase()}\n\nJefe: ${widget.sares!.nameJefeSare.toString().toUpperCase()} \n\nCorreo Electronico: ${widget.sares!.email.toString().toUpperCase()} \n\nTelefono: ${widget.sares!.telefono.toString().toUpperCase()}\n\nLocalidad: ${widget.sares!.localidad!.nameLoc.toString().toUpperCase()} \n\nClave Oficial: ${widget.sares!.localidad!.claveLocOfi.toString().toUpperCase()} \n\nMunicipio: ${widget.sares!.localidad!.municipio!.name.toString()} \n\nRegion: ${widget.sares!.localidad!.municipio!.region!.nameRegion.toString().toUpperCase()} \n "),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: "btn1",
                child: Icon(Icons.map_sharp),
                backgroundColor: AppColors.buttonColor,
                tooltip: 'Ver en Mapa',
                onPressed: () {
                  final lati = this.widget.sares!.latitud;
                  final long = this.widget.sares!.longitud;
                  final name = "Sare: ${this.widget.sares!.nameSare}";

                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          MapViews(latitud: lati, longitud: long, name: name)));
                  //Navigator.of(context).pushNamed(RoutesName.mapa);
                },
              ),
            ],
          ),
        ));
  }
}
