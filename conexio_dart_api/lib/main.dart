import 'package:conexio_dart_api/utils/routes/routes_name.dart';
import 'package:conexio_dart_api/view_model/auth_view_model.dart';
import 'package:conexio_dart_api/view_model/home_view_model.dart';
import 'package:conexio_dart_api/view_model/school/home_view_model_school.dart';
import 'package:conexio_dart_api/view_model/view_model_menu/home_view_model_localidad.dart';
import 'package:conexio_dart_api/view_model/view_model_menu/home_view_model_municipio.dart';
import 'package:conexio_dart_api/view_model/view_model_menu/home_view_model_region.dart';
import 'package:conexio_dart_api/view_model/user_view_model.dart';
import 'package:conexio_dart_api/view_model/view_model_menu/home_view_model_sare.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
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
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModelRegion()),
        ChangeNotifierProvider(create: (_) => HomeViewModelMunicipio()),
        ChangeNotifierProvider(create: (_) => HomeViewModelLocalidad()),
        ChangeNotifierProvider(create: (_) => HomeViewModelScholl()),
        ChangeNotifierProvider(create: (_) => HomeViewModelSare())
      ],
      child: MaterialApp(
        /*  builder: (context, child) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, child!),
          maxWidth: 1024,
          // maxWidth: 600,
          minWidth: 400,
          defaultScale: true,
          breakpoints: [
            //ResponsiveBreakpoint.autoScale(600)
            const ResponsiveBreakpoint.resize(400, name: MOBILE),
            const ResponsiveBreakpoint.resize(1024, name: DESKTOP),
          ],
        ),*/
        debugShowCheckedModeBanner: false,
        title: 'Directorios Escolares',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
/*
 breakpoints: [
            //ResponsiveBreakpoint.autoScale(600)
            const ResponsiveBreakpoint.resize(400, name: MOBILE),
            //const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            //const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            //const ResponsiveBreakpoint.resize(600, name: DESKTOP),
            const ResponsiveBreakpoint.resize(1024, name: DESKTOP),
            // const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
*/