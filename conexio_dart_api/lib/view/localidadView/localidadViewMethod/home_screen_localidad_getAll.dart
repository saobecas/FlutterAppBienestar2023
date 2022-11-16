import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../res/color.dart';

class HomeScreenLocalidadGetAll extends StatefulWidget {
  const HomeScreenLocalidadGetAll({super.key});

  @override
  State<HomeScreenLocalidadGetAll> createState() =>
      _HomeScreenLocalidadGetAllState();
}

class _HomeScreenLocalidadGetAllState extends State<HomeScreenLocalidadGetAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista De Localidades"),
        centerTitle: true,
        backgroundColor: AppColors.grenSnackBar,
      ),
    );
  }
}
