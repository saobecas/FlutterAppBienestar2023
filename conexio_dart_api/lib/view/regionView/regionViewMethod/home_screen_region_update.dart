import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../res/components/round_button.dart';
import '../../../utils/utils.dart';
import '../../bar_gradient.dart';

class HomeScreenRegionUpdate extends StatefulWidget {
  const HomeScreenRegionUpdate({super.key});

  @override
  State<HomeScreenRegionUpdate> createState() => _HomeScreenRegionUpdateState();
}

class _HomeScreenRegionUpdateState extends State<HomeScreenRegionUpdate> {
  final TextEditingController _nameRegion = TextEditingController();

  FocusNode nameRegionFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();

    _nameRegion.dispose();

    nameRegionFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            BarGradient("Actualizar Region", Icons.update_rounded),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              height: 80,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              child: TextFormField(
                controller: _nameRegion,
                keyboardType: TextInputType.text,
                focusNode: nameRegionFocusNode,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Ingrese El Nombre De La Region',
                  labelText: 'Nombre De La Region',
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
                title: "Actualizar Region",
                onPress: () {
                  if (_nameRegion.text.isEmpty) {
                    Utils.flushBarErrorMessage(
                        "Por Favor Ingresa El Nombre De La Región", context);
                  }
                })
          ],
        ),
      )),
    );
  }
}
