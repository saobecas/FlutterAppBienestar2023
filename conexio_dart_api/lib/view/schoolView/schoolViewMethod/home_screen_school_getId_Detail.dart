import 'package:conexio_dart_api/model/school/school_list_model.dart';
import 'package:conexio_dart_api/model/school/school_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/response/status.dart';
import '../../../res/color.dart';
import '../../../view_model/school/home_view_model_school.dart';

class SchoolGetIdDetail extends StatefulWidget {
  final Schols? schols;
  SchoolGetIdDetail(
    this.schols, {
    super.key,
  });

  @override
  State<SchoolGetIdDetail> createState() => _SchoolGetIdDetailState();
}

class _SchoolGetIdDetailState extends State<SchoolGetIdDetail> {
  //HomeViewModelScholl homeViewModelScholl = HomeViewModelScholl();
  SchoolModel schoolModel = SchoolModel();
  @override
  void initState() {
    // homeViewModelScholl.fechtSchoolListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalle Escuela"),
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
              /*leading: Icon(
                Icons.details,
                color: Colors.white,
                size: 25,
              ),*/
              shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(20)),
              tileColor: AppColors.grenSnackBar,
              // leading: Icon(Icons.school),
              title: const Text(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                  textAlign: TextAlign.center,
                  "DETALLES DE LA ESCUELA :"),
            ),
            ListTile(
              title: Text(
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                  ),

                  //textAlign: TextAlign.justify,
                  textAlign: TextAlign.left,
                  "Escuela: ${widget.schols!.nameSchool.toString().toUpperCase()}\n\nClave: ${widget.schols!.cct.toString().toUpperCase()} \n\nNivel Educativo: ${widget.schols!.nivel.toString().toUpperCase()} \n\nCalle: ${widget.schols!.calle.toString().toUpperCase()} \n\nNumero Exterior: ${widget.schols!.noExterior.toString().toUpperCase()} \n\nNumero Interior: ${widget.schols!.numeroInterior.toString().toUpperCase()} \n\nAsentamiento: ${widget.schols!.asentamiento.toString().toUpperCase()} \n\nCorreo Institucional: ${widget.schols!.email.toString().toUpperCase()} \n\nTelefono: ${widget.schols!.telefono.toString().toUpperCase()} \n\nNombre De La Localidad: ${widget.schols!.localidad!.nameLoc.toString().toUpperCase()} \n\nClave Oficial De Localidad: ${widget.schols!.localidad!.claveLocOfi.toString().toUpperCase()} \n "),
            ),
            ListTile(
              shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(20)),
              tileColor: AppColors.grenSnackBar,
              title: const Text(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                  textAlign: TextAlign.center,
                  "DETALLES DEL DIRECTOR :"),
            ),
            ListTile(
              title: Text(
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                  ),
                  "Director: ${widget.schols!.director!.name.toString().toUpperCase()}\n\nSindicato: ${widget.schols!.director!.sindicato.toString().toUpperCase()}\n\nTelefono: ${widget.schols!.director!.telephone.toString().toUpperCase()}\n\nPuesto: ${widget.schols!.director!.puesto.toString().toUpperCase()}\n\nCorreo Electronico: ${widget.schols!.director!.email.toString().toUpperCase()} \n\nEstatus: ${widget.schols!.director!.status.toString().toUpperCase()}\n"),
            ),
            ListTile(
              tileColor: AppColors.grenSnackBar,
              shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(20)),
              title: const Text(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    //backgroundColor: AppColors.grenSnackBar,
                  ),
                  textAlign: TextAlign.center,
                  "DETALLES DEL SUPERVISOR :"),
            ),
            ListTile(
              title: Text(
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                  ),
                  "Supervisor: ${widget.schols!.director!.supervisor!.name.toString().toUpperCase()}\n\nTelefono: ${widget.schols!.director!.supervisor!.telephone.toString().toUpperCase()}\n\nCorreo Electronico: ${widget.schols!.director!.supervisor!.email.toString().toUpperCase()}\n\nRecuperado: ${widget.schols!.director!.supervisor!.recuperado.toString().toUpperCase()}\n\nFecha Del Directorio Recuperado: ${widget.schols!.director!.supervisor!.directorioRecuperado.toString().toUpperCase()} \n\nFecha de la Creacion de la Escuela: ${widget.schols!.director!.supervisor!.createdAt.toString().toUpperCase()}"),
            ),
          ],
        ),
      )),
    );
  }
}
