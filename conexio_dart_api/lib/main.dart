import 'package:conexio_dart_api/utils/routes/routes_name.dart';
import 'package:conexio_dart_api/view_model/auth_view_model.dart';
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
      providers: [ChangeNotifierProvider(create: (_) => AuthViewModel())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Directorios Escolares',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        initialRoute: RoutesName.login,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
