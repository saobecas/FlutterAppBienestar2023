import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../res/components/round_button.dart';
import '../../../utils/utils.dart';
import '../../../view_model/school/home_view_model_school.dart';
import '../../bar_gradient.dart';

class HomeScreenSchoolSupervisor extends StatefulWidget {
  const HomeScreenSchoolSupervisor({super.key});

  @override
  State<HomeScreenSchoolSupervisor> createState() =>
      _HomeScreenSchoolSupervisorState();
}

class _HomeScreenSchoolSupervisorState
    extends State<HomeScreenSchoolSupervisor> {
  final TextEditingController _nameSupervisorController =
      TextEditingController();
  final TextEditingController _telephoneSupervisorController =
      TextEditingController();
  final TextEditingController _emailSupervisorController =
      TextEditingController();
  final TextEditingController _recuperadoController = TextEditingController();
  final TextEditingController _peridoDirectorioRecuperadoController =
      TextEditingController();

  FocusNode nameSupervisoFocusNode = FocusNode();
  FocusNode telephoneSupervisoFocusNode = FocusNode();
  FocusNode emailSupervisorFocusNode = FocusNode();
  FocusNode recuperadoFocusNode = FocusNode();
  FocusNode peridoDirectorioRecuperadoFocusNode = FocusNode();
  @override
  void dispose() {
    super.dispose();

    _nameSupervisorController.dispose();
    _telephoneSupervisorController.dispose();
    _emailSupervisorController.dispose();
    _recuperadoController.dispose();
    _peridoDirectorioRecuperadoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final addSchoolViewModel = Provider.of<HomeViewModelScholl>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(
        children: [
          BarGradient("Crear Escuela", Icons.create_new_folder),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            height: 80,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: TextFormField(
              controller: _nameSupervisorController,
              focusNode: nameSupervisoFocusNode,
              decoration: const InputDecoration(
                hintText: 'Ingrese El Nombre Completo',
                labelText: 'Nombre Del Supervisor',
                prefixIcon: Icon(Icons.phone),
              ),
              onEditingComplete: () =>
                  Utils.fielFocusGeneral(context, telephoneSupervisoFocusNode),
              textInputAction: TextInputAction.next,
            ),
          ),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            height: 80,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: TextFormField(
              controller: _telephoneSupervisorController,
              focusNode: telephoneSupervisoFocusNode,
              keyboardType: TextInputType.phone,
              maxLines: 10,
              decoration: const InputDecoration(
                hintText: 'Ingrese El Telefono',
                labelText: 'Numero De Telefono Del Supervisor',
                prefixIcon: Icon(Icons.phone),
              ),
              onEditingComplete: () =>
                  Utils.fielFocusGeneral(context, emailSupervisorFocusNode),
              textInputAction: TextInputAction.next,
            ),
          ),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            height: 80,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: TextFormField(
              controller: _emailSupervisorController,
              focusNode: emailSupervisorFocusNode,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Ingrese Su Correo Electronico',
                labelText: 'Correo Electronico Del Supervisor',
                prefixIcon: Icon(Icons.phone),
              ),
              onEditingComplete: () =>
                  Utils.fielFocusGeneral(context, recuperadoFocusNode),
              textInputAction: TextInputAction.next,
            ),
          ),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            height: 80,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: TextFormField(
              controller: _recuperadoController,
              focusNode: recuperadoFocusNode,
              decoration: const InputDecoration(
                hintText: 'Ingrese El Modo de Recuperacion ',
                labelText: 'Modo De Recuperación',
                prefixIcon: Icon(Icons.phone),
              ),
              onEditingComplete: () => Utils.fielFocusGeneral(
                  context, peridoDirectorioRecuperadoFocusNode),
              textInputAction: TextInputAction.next,
            ),
          ),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            height: 80,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: TextFormField(
              controller: _peridoDirectorioRecuperadoController,
              focusNode: peridoDirectorioRecuperadoFocusNode,
              decoration: const InputDecoration(
                hintText: 'Ingrese La Fecha Del Periodo',
                labelText: 'Perido De Recuperacion',
                prefixIcon: Icon(Icons.add_business),
              ),
            ),
          ),
          SizedBox(
            height: height * .085,
          ),
          RoundButton(
            title: "Crear Escuela",
            // loading: addSchoolViewModel.addLoading,
            onPress: () {
              if (
                  /*_nameSchoolController.text.isEmpty ||
                  _nameDirectorController.text.isEmpty ||*/
                  _nameSupervisorController.text.isEmpty) {
                Utils.flushBarErrorMessage(
                    "Por Favor  Ingrese Todos Los Campos", context);
              } else {
                Map data = {
                  'name_supervisor': _nameSupervisorController.text.toString(),
                  'telephone_supervisor':
                      _telephoneSupervisorController.text.toString(),
                  'email_supervisor':
                      _emailSupervisorController.text.toString(),
                  'recuperado': _recuperadoController.text.toString(),
                  'directorio_recuperado':
                      _peridoDirectorioRecuperadoController.text.toString(),
                };
                //addSchoolViewModel.addSchoolApi(data, context);
                print("Api agregar escuela");
              }
            },
          ),
          SizedBox(
            height: height * .03,
          ),
        ],
      ),
    )));
  }
}
