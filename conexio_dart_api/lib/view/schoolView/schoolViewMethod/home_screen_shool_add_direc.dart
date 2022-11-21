import 'package:conexio_dart_api/res/components/round_button.dart';
import 'package:conexio_dart_api/utils/routes/routes_name.dart';
import 'package:conexio_dart_api/utils/utils.dart';
import 'package:conexio_dart_api/view/bar_gradient.dart';
import 'package:flutter/material.dart';

class HomeScreenDataDirector extends StatefulWidget {
  const HomeScreenDataDirector({super.key});

  @override
  State<HomeScreenDataDirector> createState() => _HomeScreenDataDirectorState();
}

class _HomeScreenDataDirectorState extends State<HomeScreenDataDirector> {
  final TextEditingController _nameDirectorController = TextEditingController();
  final TextEditingController _sindicatoController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();
  final TextEditingController _puestoController = TextEditingController();
  final TextEditingController _emailDirectorController =
      TextEditingController();
  final TextEditingController _atencionController = TextEditingController();
  final TextEditingController _nameSupervisorController =
      TextEditingController();
  final TextEditingController _telephoneSupervisorController =
      TextEditingController();
  final TextEditingController _emailSupervisorController =
      TextEditingController();
  final TextEditingController _recuperadoController = TextEditingController();
  final TextEditingController _peridoDirectorioRecuperadoController =
      TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode nameSchoolFocusNode = FocusNode();
  FocusNode claveSchoolFocusNode = FocusNode();
  FocusNode nivelEducativoFocusNode = FocusNode();
  FocusNode calleFocus = FocusNode();
  FocusNode numeroExteriorFocusNode = FocusNode();
  FocusNode numeroInteriorFocusNode = FocusNode();
  FocusNode asentamientoFocusNode = FocusNode();
  FocusNode emailSchoolFocusNode = FocusNode();
  FocusNode telefonoFocusNode = FocusNode();
  FocusNode localidadIFocusNode = FocusNode();
  FocusNode nameDirectorFocusNode = FocusNode();
  FocusNode sindicatoFocusNode = FocusNode();
  FocusNode telephoneFocusNode = FocusNode();
  FocusNode puestoFocusNode = FocusNode();
  FocusNode emailDirectorFocusNode = FocusNode();
  FocusNode atencionFocusNode = FocusNode();
  FocusNode nameSupervisoFocusNode = FocusNode();
  FocusNode telephoneSupervisoFocusNode = FocusNode();
  FocusNode emailSupervisorFocusNode = FocusNode();
  FocusNode recuperadoFocusNode = FocusNode();
  FocusNode peridoDirectorioRecuperadoFocusNode = FocusNode();
  @override
  void dispose() {
    super.dispose();
    _nameDirectorController.dispose();
    _sindicatoController.dispose();
    _telephoneController.dispose();
    _puestoController.dispose();
    _emailDirectorController.dispose();
    _atencionController.dispose();
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
              controller: _nameDirectorController,
              focusNode: nameDirectorFocusNode,
              decoration: const InputDecoration(
                hintText: 'Ingrese El Nombre Completo',
                labelText: 'Nombre Del Director',
                prefixIcon: Icon(Icons.phone),
              ),
              onEditingComplete: () =>
                  Utils.fielFocusGeneral(context, sindicatoFocusNode),
              textInputAction: TextInputAction.next,
            ),
          ),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            height: 80,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: TextFormField(
              controller: _sindicatoController,
              focusNode: sindicatoFocusNode,
              decoration: const InputDecoration(
                hintText: 'Ingrese El Sindicato',
                labelText: 'Nombre Del Sindicato',
                prefixIcon: Icon(Icons.phone),
              ),
              onEditingComplete: () =>
                  Utils.fielFocusGeneral(context, telephoneFocusNode),
              textInputAction: TextInputAction.next,
            ),
          ),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            height: 80,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: TextFormField(
              controller: _telephoneController,
              focusNode: telephoneFocusNode,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: const InputDecoration(
                hintText: 'Ingrese El Telefono',
                labelText: 'Numero De Telefono Del Director',
                prefixIcon: Icon(Icons.phone),
              ),
              onEditingComplete: () =>
                  Utils.fielFocusGeneral(context, puestoFocusNode),
              textInputAction: TextInputAction.next,
            ),
          ),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            height: 80,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: TextFormField(
              controller: _puestoController,
              focusNode: puestoFocusNode,
              decoration: const InputDecoration(
                hintText: 'Ingrese El Puesto',
                labelText: 'Nombre Del Puesto',
                prefixIcon: Icon(Icons.phone),
              ),
              onEditingComplete: () =>
                  Utils.fielFocusGeneral(context, emailDirectorFocusNode),
              textInputAction: TextInputAction.next,
            ),
          ),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            height: 80,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: TextFormField(
              controller: _emailDirectorController,
              focusNode: emailDirectorFocusNode,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Ingrese Su Correo Electronico',
                labelText: 'Correo Electronico Del Director',
                prefixIcon: Icon(Icons.phone),
              ),
              onEditingComplete: () =>
                  Utils.fielFocusGeneral(context, atencionFocusNode),
              textInputAction: TextInputAction.next,
            ),
          ),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            height: 80,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: TextFormField(
              controller: _atencionController,
              focusNode: atencionFocusNode,
              decoration: const InputDecoration(
                hintText: 'Ingrese Si o No',
                labelText: 'Recibe Atencion',
                prefixIcon: Icon(Icons.phone),
              ),
              onEditingComplete: () =>
                  Utils.fielFocusGeneral(context, nameSupervisoFocusNode),
              textInputAction: TextInputAction.next,
            ),
          ),
          SizedBox(
            height: height * .085,
          ),
          RoundButton(
            title: "siguiente",
            // loading: addSchoolViewModel.addLoading,
            onPress: () {
              if (
                  //_nameSchoolController.text.isEmpty

                  _nameDirectorController.text.isEmpty

                  // _nameSupervisorController.text.isEmpty

                  ) {
                Utils.flushBarErrorMessage(
                    "Por Favor  Ingrese Todos Los Campos", context);
              } else {
                Map data = {
                  'name_director': _nameDirectorController.text.toString(),
                  'sindicato': _sindicatoController.text.toString(),
                  'telephone': _telephoneController.text.toString(),
                  'puesto': _puestoController.text.toString(),
                  'email_director': _emailDirectorController.text.toString(),
                  'atencion': _atencionController.text.toString(),
                  'name_supervisor': _nameSupervisorController.text.toString(),
                  'telephone_supervisor':
                      _telephoneSupervisorController.text.toString(),
                  'email_supervisor':
                      _emailSupervisorController.text.toString(),
                  'recuperado': _recuperadoController.text.toString(),
                  'directorio_recuperado':
                      _peridoDirectorioRecuperadoController.text.toString(),
                };
                // addSchoolViewModel.addSchoolApi(data, context);
                Navigator.pushNamed(context, RoutesName.datSupervisorview);

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
