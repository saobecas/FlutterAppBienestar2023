import 'dart:convert';

import 'package:conexio_dart_api/data/response/status.dart';
import 'package:conexio_dart_api/res/components/round_button.dart';
import 'package:conexio_dart_api/utils/routes/routes_name.dart';
import 'package:conexio_dart_api/utils/utils.dart';
import 'package:conexio_dart_api/view/bar_gradient.dart';
import 'package:conexio_dart_api/view/localitation/get_localitation_view.dart';
import 'package:conexio_dart_api/view_model/school/home_view_model_school.dart';
import 'package:conexio_dart_api/view_model/user_view_model.dart';
import 'package:conexio_dart_api/view_model/view_model_menu/home_view_model_localidad.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';

class HomeScreenSchoolAdd extends StatefulWidget {
  const HomeScreenSchoolAdd({super.key});

  @override
  State<HomeScreenSchoolAdd> createState() => _HomeScreenSchoolAddState();
}

class _HomeScreenSchoolAddState extends State<HomeScreenSchoolAdd> {
  bool _active = false;

  HomeViewModelLocalidad homeViewModelLocalidad = HomeViewModelLocalidad();
  dynamic? selectedValue;
  final TextEditingController searchController = TextEditingController();

  //Datos de la escuela
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
  final TextEditingController _telefonoSchoolController =
      TextEditingController();
  final TextEditingController _localidadIdController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode nameSchoolFocusNode = FocusNode();
  FocusNode claveSchoolFocusNode = FocusNode();
  FocusNode nivelEducativoFocusNode = FocusNode();
  FocusNode calleFocus = FocusNode();
  FocusNode numeroExteriorFocusNode = FocusNode();
  FocusNode numeroInteriorFocusNode = FocusNode();
  FocusNode asentamientoFocusNode = FocusNode();
  FocusNode emailSchoolFocusNode = FocusNode();
  FocusNode telefonoSchoolFocusNode = FocusNode();
  FocusNode localidadIFocusNode = FocusNode();
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
    _telefonoSchoolController.dispose();
    _localidadIdController.dispose();
  }

  void setIdLocalidad() {
    setState(() {
      _localidadIdController.text = selectedValue.id.toString();
      print("Select vaules desde metodo set: " +
          _localidadIdController.text.toString());
    });
  }

  /*void validateEmail(String val) {
    if (val.isEmpty) {
      setState(() {
        print("Email can not be empty");
      });
    } else if (!EmailValidator.validate(val, true)) {
      setState(() {
        print("Invalid Email Address");
      });
    } else {
      setState(() {
        print("");
      });
    }
  }*/

  UserViewModel getSharedPreferences = UserViewModel();
  String? token;

  @override
  void initState() {
    getSharedPreferences;
    super.initState();
    getSharedPreferences.getUser().then((value) => {
          token = value.token,
          setState(() {
            homeViewModelLocalidad.fechtLocalidadListApi(token.toString());
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    final addSchoolViewModel = Provider.of<HomeViewModelScholl>(context);
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
            height: 90,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: TextFormField(
              controller: _claveSchoolController,
              keyboardType: TextInputType.number,
              maxLines: 9,
              minLines: 9,
              maxLength: 9,
              focusNode: claveSchoolFocusNode,
              decoration: const InputDecoration(
                hintText: 'Ingrese La Clave',
                labelText: 'Clave De La Escuela',
                prefixIcon: Icon(Icons.key),
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
                prefixIcon: Icon(Icons.perm_data_setting_outlined),
              ),
              onEditingComplete: () =>
                  Utils.fielFocusGeneral(context, calleFocus),
              textInputAction: TextInputAction.next,
            ),
          ),
          Container(
            child: ChangeNotifierProvider<HomeViewModelLocalidad>(
              create: (BuildContext context) => homeViewModelLocalidad,
              child: Consumer<HomeViewModelLocalidad>(
                  builder: (context, lista, _) {
                switch (lista.localidadList.status!) {
                  case Status.LOADING:
                    return Center(child: CircularProgressIndicator());
                  case Status.ERROR:
                    return Center(
                        child: Text(lista.localidadList.message.toString()));
                  case Status.COMPLETED:
                    //var index;
                    return Center(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          //barrierColor: Colors.blue,
                          buttonDecoration: BoxDecoration(
                            color: Color.fromARGB(255, 235, 235, 235),
                            borderRadius: BorderRadius.circular(30.0),
                            border: Border.all(
                                color: Color.fromARGB(255, 0, 0, 0),
                                style: BorderStyle.solid,
                                width: 0.80),
                          ),
                          isExpanded: true,
                          hint: Row(
                            children: [
                              Icon(
                                Icons.list,
                                size: 15,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    'Selecciona la localidad',

                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Theme.of(context).hintColor,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    //selectionColor: Colors.amberAccent,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          items: lista.localidadList.data!.localidades!
                              //lista.regionList.data!.regiones!
                              .map((nombre_localidad) =>
                                  DropdownMenuItem<dynamic>(
                                    //value: nombre_region.id.toString(),
                                    value: nombre_localidad,

                                    child: Text(
                                      nombre_localidad.nameLoc.toString(),
                                      //nombre_region.toString(),

                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList(),

                          value: selectedValue,

                          onChanged: (value) {
                            setState(() {
                              selectedValue = value as dynamic;

                              print(selectedValue.id);
                            });
                          },

                          buttonHeight: 50,
                          buttonWidth: 250,
                          itemHeight: 50,
                          dropdownMaxHeight: 400,
                          dropdownPadding: null,
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Color.fromARGB(255, 235, 235, 235),
                          ),
                          searchController: searchController,
                          searchInnerWidget: Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                              bottom: 4,
                              right: 8,
                              left: 8,
                            ),
                            child: TextFormField(
                              controller: searchController,
                              decoration: InputDecoration(
                                isDense: false,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 8,
                                ),
                                hintText: 'Buscar...',
                                icon: Icon(Icons.search),
                                hintStyle: const TextStyle(
                                  fontSize: 12,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              //validator: (selectedValue),
                            ),
                          ),
                          searchMatchFn: (nombre_localidad, searchValue) {
                            //print("Holamundo");
                            var name = nombre_localidad.value!.nameLoc!
                                .toString()
                                .toUpperCase()
                                //.toLowerCase()
                                .contains(searchValue);
                            if (kDebugMode) {
                              print(
                                  "===============================${jsonEncode(nombre_localidad.value)}");
                            }
                            return name;
                          },
                          //This to clear the search value when you close the menu
                          onMenuStateChange: (isOpen) {
                            if (!isOpen) {
                              searchController.clear();
                            }
                          },
                        ),
                      ),
                    );
                }
              }),
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
                prefixIcon: Icon(Icons.stairs_rounded),
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
                prefixIcon: Icon(Icons.numbers),
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
                prefixIcon: Icon(Icons.numbers),
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
                prefixIcon: Icon(Icons.holiday_village_sharp),
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
                prefixIcon: Icon(Icons.email),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter your Email address';
                }
                if (!RegExp(
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                    .hasMatch(value)) {
                  return 'Enter a Valid Email address';
                }
                return null;
              },
              /* onChanged: (val) {
                validateEmail(val);
              },*/
              onEditingComplete: () =>
                  Utils.fielFocusGeneral(context, telefonoSchoolFocusNode),
              textInputAction: TextInputAction.next,
            ),
          ),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            height: 90,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: TextFormField(
              controller: _telefonoSchoolController,
              focusNode: telefonoSchoolFocusNode,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: const InputDecoration(
                hintText: 'Ingrese El Telefono',
                labelText: 'Numero De Telefono Institucional',
                prefixIcon: Icon(Icons.phone),
              ),
              onEditingComplete: () =>
                  Utils.fielFocusGeneral(context, telefonoSchoolFocusNode),
              textInputAction: TextInputAction.next,
            ),
          ),
          SizedBox(
            height: height * .085,
          ),
          RoundButton(
            title: "Siguiente",
            // loading: addSchoolViewModel.addLoading,
            onPress: () {
              setIdLocalidad();

              //_atencionController.text = _active.toString();
              print("valod del active: " + _active.toString());

              print("Valor de localidad: " +
                  _localidadIdController.text.toString());
              if (_nameSchoolController.text.isEmpty ||
                  _claveSchoolController.text.isEmpty) {
                Utils.flushBarErrorMessage("Rellene todos los campos", context);
              } else {
                /* Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => GetLocations(
                          name_school: _nameSchoolController.text.toString(),
                          cct: _claveSchoolController.text.toString(),
                          nivel: _nivelEducativoController.text.toString(),
                          calle: _calleController.text.toString(),
                          noExterior: _numeroExteriorController.text.toString(),
                          numeroInteriofinal:
                              _numeroInteriorController.text.toString(),
                          asentamiento: _asentamientoController.text.toString(),
                          email_school: _emailSchoolController.text.toString(),
                          telefono: _telefonoSchoolController.text.toString(),
                          localidadId: _localidadIdController.text.toString(),
                        )));*/
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
