import 'package:conexio_dart_api/view_model/services/splash_service.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashService splashServices = SplashService();

  @override
  void initState() {
    super.initState();
    splashServices.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 34, 92, 64),
      body: Center(
        child: Text(
          'Representación Estatal de Becas Benito Juárez, Oaxaca',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
          //style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
