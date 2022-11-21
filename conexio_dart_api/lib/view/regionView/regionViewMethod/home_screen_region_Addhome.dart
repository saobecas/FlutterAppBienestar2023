import 'package:conexio_dart_api/model/region/region_model.dart';
import 'package:conexio_dart_api/res/components/round_button.dart';
import 'package:conexio_dart_api/utils/utils.dart';
import 'package:conexio_dart_api/view/bar_gradient.dart';
import 'package:conexio_dart_api/view_model/view_model_menu/home_view_model_region.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_model/auth_view_model.dart';

class HomeScreenRegionAdd extends StatefulWidget {
  const HomeScreenRegionAdd({super.key});

  @override
  State<HomeScreenRegionAdd> createState() => _HomeScreenRegionAddState();
}

class _HomeScreenRegionAddState extends State<HomeScreenRegionAdd> {
  //  Future<RegionModel>? futureRegion;

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
    final regionViewModel = Provider.of<HomeViewModelRegion>(context);

    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            BarGradient("Crear Region", Icons.add_box_rounded),
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
                title: "Crear Region",
                loading: regionViewModel.addLoading,
                onPress: () {
                  if (_nameRegion.text.isEmpty) {
                    Utils.flushBarErrorMessage(
                        "Por Favor Ingresa El Nombre De La Región", context);
                  } else {
                    Map data = {'nameRegion': _nameRegion.text.toString()};

                    regionViewModel.addRegionApi(data, context);
                    // regionViewModel.addregionApi(data, context);
                  }
                })
          ],
        ),
      )),
    );
  }
}
