import 'package:conexio_dart_api/model/sare/sares_model.dart';
import 'package:conexio_dart_api/res/color.dart';
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
              /* onTap: () {
                if (kDebugMode) {
                  print(widget.schols!.id.toString());
                }
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HomeScreenSchoolUpdate(
                          id: this.widget.schols!.id.toString(),
                          name: this.widget.schols!.nameSchool.toString(),
                          clave: this.widget.schols!.cct.toString(),
                          nivel: this.widget.schols!.nivel.toString(),
                          calle: this.widget.schols!.calle.toString(),
                          noExterior: this.widget.schols!.noExterior.toString(),
                          noInteriror:
                              this.widget.schols!.numeroInterior.toString(),
                          asentamiento:
                              this.widget.schols!.asentamiento.toString(),
                          email: this.widget.schols!.email.toString(),
                          telefono: this.widget.schols!.telefono.toString(),
                          localidadId:
                              this.widget.schols!.localidadId.toString(),
                          nameLoc:
                              this.widget.schols!.localidad!.nameLoc.toString(),
                        )));
              },*/
              title: Text(
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                  ),

                  //textAlign: TextAlign.justify,
                  textAlign: TextAlign.left,
                  "Sare: ${widget.sares!.nameSare.toString().toUpperCase()}\n\nJefe: ${widget.sares!.nameJefeSare.toString().toUpperCase()} \n\nCorreo Electronico: ${widget.sares!.email.toString().toUpperCase()} \n\nTelefono: ${widget.sares!.telefono.toString().toUpperCase()} \n\nLatitud: ${widget.sares!.latitud.toString().toUpperCase()} \n\nLongitud: ${widget.sares!.longitud.toString().toUpperCase()} \n\nLocalidad: ${widget.sares!.localidad!.nameLoc.toString().toUpperCase()} \n\nClave Oficial: ${widget.sares!.localidad!.claveLocOfi.toString().toUpperCase()} \n\nMunicipio: ${widget.sares!.localidad!.municipio!.name.toString()} \n\nRegion: ${widget.sares!.localidad!.municipio!.region!.nameRegion.toString().toUpperCase()} \n "),
            ),
          ],
        ),
      )),
    );
  }
}
