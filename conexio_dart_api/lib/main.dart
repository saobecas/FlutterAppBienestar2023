import 'package:conexio_dart_api/utils/routes/routes_name.dart';
import 'package:conexio_dart_api/view_model/auth_view_model.dart';
import 'package:conexio_dart_api/view_model/region/home_view_model_region.dart';
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
        ChangeNotifierProvider(create: (_) => HomeViewModelRegion()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Directorios Escolares',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        //home: HomeScreenAdmin(),
        //home: HomeScreenLocalidad(),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
