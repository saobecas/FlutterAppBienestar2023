import 'package:conexio_dart_api/res/components/round_button.dart';
import 'package:conexio_dart_api/utils/routes/routes_name.dart';
import 'package:conexio_dart_api/utils/utils.dart';
import 'package:conexio_dart_api/view/bar_gradient.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreenSchoolAdd extends StatefulWidget {
  const HomeScreenSchoolAdd({super.key});

  @override
  State<HomeScreenSchoolAdd> createState() => _HomeScreenSchoolAddState();
}

class _HomeScreenSchoolAddState extends State<HomeScreenSchoolAdd> {
  final TextEditingController _nameSchoolController = TextEditingController();
  final TextEditingController _claveSchoolController = TextEditingController();
  final TextEditingController _nivelEducativoController =
      TextEditingController();
  final TextEditingController _calleController = TextEditingController();
  final TextEditingController _numeroExteriorController =
      TextEditingController();
  final TextEditingController _numeroInteriorController =
      TextEditingController();
  final TextEditingController _asentamientoController = TextEditingController();
  final TextEditingController _emailSchoolController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _localidadIdController = TextEditingController();
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

    _nameSchoolController.dispose();
    _claveSchoolController.dispose();
    _nivelEducativoController.dispose();
    _calleController.dispose();
    _numeroExteriorController.dispose();
    _numeroInteriorController.dispose();
    _asentamientoController.dispose();
    _emailSchoolController.dispose();
    _telefonoController.dispose();
    _localidadIdController.dispose();
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
              controller: _nameSchoolController,
              keyboardType: TextInputType.text,
              focusNode: nameSchoolFocusNode,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'Ingrese El Nombre',
                labelText: 'Nombre De La Escuela',
                prefixIcon: Icon(Icons.person_add_alt_1_sharp),
              ),
              onEditingComplete: () =>
                  Utils.fielFocusGeneral(context, claveSchoolFocusNode),
              textInputAction: TextInputAction.next,
            ),
          ),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            height: 80,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: TextFormField(
              controller: _claveSchoolController,
              keyboardType: TextInputType.number,
              maxLines: 10,
              minLines: 10,
              focusNode: claveSchoolFocusNode,
              decoration: const InputDecoration(
                hintText: 'Ingrese La Clave',
                labelText: 'Clave De La Escuela',
                prefixIcon: Icon(Icons.email),
              ),
              onEditingComplete: () =>
                  Utils.fielFocusGeneral(context, nivelEducativoFocusNode),
              textInputAction: TextInputAction.next,
            ),
          ),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            height: 80,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: TextFormField(
              controller: _nivelEducativoController,
              focusNode: nivelEducativoFocusNode,
              decoration: const InputDecoration(
                hintText: 'Ingrese El Nivel Educativo',
                labelText: 'Nivel Educativo',
                prefixIcon: Icon(Icons.phone),
              ),
              onEditingComplete: () =>
                  Utils.fielFocusGeneral(context, calleFocus),
              textInputAction: TextInputAction.next,
            ),
          ),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            height: 80,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: TextFormField(
              controller: _calleController,
              focusNode: calleFocus,
              decoration: const InputDecoration(
                hintText: 'Ingrese La Calle',
                labelText: 'Nombre De La Calle',
                prefixIcon: Icon(Icons.phone),
              ),
              onEditingComplete: () =>
                  Utils.fielFocusGeneral(context, numeroExteriorFocusNode),
              textInputAction: TextInputAction.next,
            ),
          ),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            height: 80,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: TextFormField(
              controller: _numeroExteriorController,
              focusNode: numeroExteriorFocusNode,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Ingrese El Numero exterior',
                labelText: 'Numero Exterior',
                prefixIcon: Icon(Icons.phone),
              ),
              onEditingComplete: () =>
                  Utils.fielFocusGeneral(context, numeroInteriorFocusNode),
              textInputAction: TextInputAction.next,
            ),
          ),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            height: 80,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: TextFormField(
              controller: _numeroInteriorController,
              focusNode: numeroInteriorFocusNode,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Ingrese El Numero Interior',
                labelText: 'Numero Interior',
                prefixIcon: Icon(Icons.phone),
              ),
              onEditingComplete: () =>
                  Utils.fielFocusGeneral(context, asentamientoFocusNode),
              textInputAction: TextInputAction.next,
            ),
          ),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            height: 80,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: TextFormField(
              controller: _asentamientoController,
              focusNode: asentamientoFocusNode,
              decoration: const InputDecoration(
                hintText: 'Ingrese El Asentamiento',
                labelText: 'Asentamiento',
                prefixIcon: Icon(Icons.phone),
              ),
              onEditingComplete: () =>
                  Utils.fielFocusGeneral(context, emailSchoolFocusNode),
              textInputAction: TextInputAction.next,
            ),
          ),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            height: 80,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: TextFormField(
              controller: _emailSchoolController,
              focusNode: emailSchoolFocusNode,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Ingrese Su Correo Electronico',
                labelText: 'Correo Electronico Institucional',
                prefixIcon: Icon(Icons.phone),
              ),
              onEditingComplete: () =>
                  Utils.fielFocusGeneral(context, telefonoFocusNode),
              textInputAction: TextInputAction.next,
            ),
          ),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            height: 80,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: TextFormField(
              controller: _telefonoController,
              focusNode: telefonoFocusNode,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: const InputDecoration(
                hintText: 'Ingrese El Telefono',
                labelText: 'Numero De Telefono Institucional',
                prefixIcon: Icon(Icons.phone),
              ),
              onEditingComplete: () =>
                  Utils.fielFocusGeneral(context, localidadIFocusNode),
              textInputAction: TextInputAction.next,
            ),
          ),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            height: 80,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: TextFormField(
              controller: _localidadIdController,
              focusNode: localidadIFocusNode,
              decoration: const InputDecoration(
                hintText: 'Ingrese La Localidad',
                labelText: 'Nombre De La Localidad',
                prefixIcon: Icon(Icons.phone),
              ),
              onEditingComplete: () =>
                  Utils.fielFocusGeneral(context, nameDirectorFocusNode),
              textInputAction: TextInputAction.next,
            ),
          ),
          RoundButton(
              title: "Siguiete",
              onPress: () {
                Navigator.pushNamed(context, RoutesName.locate);
                // addSchoolViewModel.addSchoolApi(data, context);
              }),
          SizedBox(
            height: height * .085,
          ),
          /*  RoundButton(
            title: "siguiente",
            // loading: addSchoolViewModel.addLoading,
            onPress: () {
              if (_nameSchoolController.text.isEmpty
                  //_nameDirectorController.text.isEmpty ||
                  //_nameSupervisorController.text.isEmpty
                  ) {
                Utils.flushBarErrorMessage(
                    "Por Favor  Ingrese Todos Los Campos", context);
              } else {
                Map data = {
                  'name_school': _nameSchoolController.text.toString(),
                  'cct': _claveSchoolController.text.toString(),
                  'nivel': _nivelEducativoController.text.toString(),
                  'calle': _calleController.text.toString(),
                  'noExterior': _numeroExteriorController.text.toString(),
                  'numeroInterior': _numeroInteriorController.text.toString(),
                  'asentamiento': _asentamientoController.text.toString(),
                  'email_school': _emailSchoolController.text.toString(),
                  'telefono': _telefonoController.text.toString(),
                  'localidadId': _localidadIdController.text.toString(),
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
                Navigator.pushNamed(context, RoutesName.datDirectorview);
                // addSchoolViewModel.addSchoolApi(data, context);
                print("Api agregar escuela");
              }
            },
          ),*/
          SizedBox(
            height: height * .03,
          ),
        ],
      ),
    )));
  }
}
