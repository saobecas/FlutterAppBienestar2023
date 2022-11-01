import 'package:conexio_dart_api/utils/routes/routes_name.dart';
import 'package:conexio_dart_api/view/admin/home_screen_admin.dart';
import 'package:conexio_dart_api/view/escuela/home_screen_school.dart';
import 'package:conexio_dart_api/view/escuela/school_view.dart';
import 'package:conexio_dart_api/view/home_screen.dart';
import 'package:conexio_dart_api/view/localidad/home_screen_localidad.dart';
import 'package:conexio_dart_api/view/municipio/home_screen_municipio.dart';
import 'package:conexio_dart_api/view/region/home_screen_region.dart';
import 'package:conexio_dart_api/view_model/auth_view_model.dart';
import 'package:conexio_dart_api/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'utils/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Directorios Escolares',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        //home: HomeScreenAdmin(),
        // home: SchoolView(),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
