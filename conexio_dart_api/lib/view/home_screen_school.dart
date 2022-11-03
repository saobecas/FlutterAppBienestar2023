import 'package:another_flushbar/flushbar.dart';
import 'package:conexio_dart_api/view/bottom_navigator_bar.dart';
import 'package:conexio_dart_api/view/schoolView/school_view_add.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'home_screen_school_home.dart';

class HomeScreenSchool extends StatefulWidget {
  const HomeScreenSchool({super.key});

  @override
  State<HomeScreenSchool> createState() => _HomeScreenSchoolState();
}

class _HomeScreenSchoolState extends State<HomeScreenSchool> {
  List fragments = [
    //agregar las vistas q mostraremos}
    //SchoolViewAdd(),
    HomeScreenHomeAdd(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigatorBar(onTap, currentIndex),
      body: fragments[currentIndex],
    );
  }

  onTap(int index) {
    setState(() {
      this.currentIndex = index;
    });
  }
}
