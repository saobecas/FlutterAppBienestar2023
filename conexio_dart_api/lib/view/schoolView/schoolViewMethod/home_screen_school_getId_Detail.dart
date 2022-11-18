import 'package:conexio_dart_api/model/school/school_list_model.dart';
import 'package:conexio_dart_api/model/school/school_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/response/status.dart';
import '../../../res/color.dart';
import '../../../view_model/school/home_view_model_school.dart';

class SchoolGetIdDetail extends StatefulWidget {
  SchoolGetIdDetail({
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
        title: Text("Detalle Escuela"),
        centerTitle: true,
        backgroundColor: AppColors.grenSnackBar,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ListTile(
              title: Text("Detalle Escuela"),
              subtitle: Text(schoolModel.nameSchool.toString()),
            ),
            ListTile(
              title: Text("Detalle Escuela"),
              subtitle: Text(schoolModel.asentamiento.toString()),
            ),
          ],
        ),
      )),
    );
  }
}
