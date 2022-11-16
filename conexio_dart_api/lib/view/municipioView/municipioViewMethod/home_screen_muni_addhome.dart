import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../res/components/round_button.dart';
import '../../../utils/utils.dart';
import '../../bar_gradient.dart';

class HomeScreenMuniAdd extends StatefulWidget {
  const HomeScreenMuniAdd({super.key});

  @override
  State<HomeScreenMuniAdd> createState() => _HomeScreenMuniAddState();
}

class _HomeScreenMuniAddState extends State<HomeScreenMuniAdd> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _regionId = TextEditingController();

  FocusNode regionIdFocusNode = FocusNode();
  FocusNode nameFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();

    _name.dispose();
    _regionId.dispose();

    regionIdFocusNode.dispose();
    nameFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            BarGradient("Crear Municipio", Icons.add_box_rounded),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              height: 80,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              child: TextFormField(
                controller: _name,
                keyboardType: TextInputType.text,
                focusNode: nameFocusNode,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Ingrese El Nombre Del Municipio',
                  labelText: 'Nombre Del Municipio',
                  prefixIcon: Icon(
                    Icons.addchart_sharp,
                  ),
                ),
                onEditingComplete: () =>
                    Utils.fielFocusGeneral(context, regionIdFocusNode),
                textInputAction: TextInputAction.next,
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              height: 80,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              child: TextFormField(
                controller: _regionId,
                keyboardType: TextInputType.text,
                focusNode: regionIdFocusNode,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Ingrese El Nombre De la Región',
                  labelText: 'Nombre De La Región',
                  prefixIcon: Icon(
                    Icons.add_home_sharp,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * .030,
            ),
            RoundButton(
                title: "Crear Municipio",
                onPress: () {
                  if (_name.text.isEmpty || _regionId.text.isEmpty) {
                    Utils.flushBarErrorMessage(
                        "Por Favor Ingresa Todos Los Campos", context);
                  }
                })
          ],
        ),
      )),
    );
  }
}
