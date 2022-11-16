import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../res/color.dart';

class HomeScreenMuniGetAll extends StatefulWidget {
  const HomeScreenMuniGetAll({super.key});

  @override
  State<HomeScreenMuniGetAll> createState() => _HomeScreenMuniGetAllState();
}

class _HomeScreenMuniGetAllState extends State<HomeScreenMuniGetAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista De Municipios"),
        centerTitle: true,
        backgroundColor: AppColors.grenSnackBar,
      ),
    );
  }
}
