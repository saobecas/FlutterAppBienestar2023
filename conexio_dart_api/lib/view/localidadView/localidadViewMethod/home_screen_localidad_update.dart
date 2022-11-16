import 'package:flutter/material.dart';

import '../../../res/components/round_button.dart';
import '../../../utils/utils.dart';
import '../../bar_gradient.dart';

class HomeScreenLocalidadUpdate extends StatefulWidget {
  const HomeScreenLocalidadUpdate({super.key});

  @override
  State<HomeScreenLocalidadUpdate> createState() =>
      _HomeScreenLocalidadUpdateState();
}

class _HomeScreenLocalidadUpdateState extends State<HomeScreenLocalidadUpdate> {
  final TextEditingController _nameLocalidad = TextEditingController();
  final TextEditingController _claveLocalidadOficial = TextEditingController();
  final TextEditingController _municipioId = TextEditingController();

  FocusNode nameLocalidadFocus = FocusNode();
  FocusNode claveLocalidadFocus = FocusNode();
  FocusNode municipioIdFocus = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _nameLocalidad.dispose();
    _claveLocalidadOficial.dispose();
    _municipioId.dispose();

    nameLocalidadFocus.dispose();
    claveLocalidadFocus.dispose();
    municipioIdFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            BarGradient("Actualizar Localidad", Icons.update_rounded),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              height: 80,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              child: TextFormField(
                controller: _nameLocalidad,
                keyboardType: TextInputType.text,
                focusNode: nameLocalidadFocus,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Ingrese El Nombre De La Localidad',
                  labelText: 'Nombre De La Localidad',
                  prefixIcon: Icon(
                    Icons.addchart_sharp,
                  ),
                ),
                onEditingComplete: () =>
                    Utils.fielFocusGeneral(context, claveLocalidadFocus),
                textInputAction: TextInputAction.next,
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              height: 80,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              child: TextFormField(
                controller: _claveLocalidadOficial,
                keyboardType: TextInputType.text,
                focusNode: claveLocalidadFocus,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Ingrese La Clave De La Localidad',
                  labelText: 'Clave Oficial De Localidad',
                  prefixIcon: Icon(
                    Icons.add_location_rounded,
                  ),
                ),
                onEditingComplete: () =>
                    Utils.fielFocusGeneral(context, municipioIdFocus),
                textInputAction: TextInputAction.next,
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              height: 80,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              child: TextFormField(
                controller: _municipioId,
                keyboardType: TextInputType.text,
                focusNode: municipioIdFocus,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Ingrese El Nombre Del Municipio',
                  labelText: 'Nombre Del Municipio',
                  prefixIcon: Icon(
                    Icons.add_home_sharp,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * .030,
            ),
            RoundButton(title: "Actualizar Localidad", onPress: () {})
          ],
        ),
      )),
    );
  }
}
