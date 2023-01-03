import 'dart:convert';

import 'package:conexio_dart_api/data/response/status.dart';
import 'package:conexio_dart_api/res/components/round_button.dart';
import 'package:conexio_dart_api/utils/utils.dart';
import 'package:conexio_dart_api/view/bar_gradient.dart';
import 'package:conexio_dart_api/view_model/user_view_model.dart';
import 'package:conexio_dart_api/view_model/view_model_menu/home_view_model_localidad.dart';
import 'package:conexio_dart_api/view_model/view_model_menu/home_view_model_region.dart';
import 'package:conexio_dart_api/view_model/view_model_menu/home_view_model_sare.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';

class HomeScreenSareAdd extends StatefulWidget {
  const HomeScreenSareAdd({super.key});

  @override
  State<HomeScreenSareAdd> createState() => _HomeScreenSareAddState();
}

class _HomeScreenSareAddState extends State<HomeScreenSareAdd> {
  bool _active = false;

  HomeViewModelLocalidad homeViewModelLocalidad = HomeViewModelLocalidad();
  HomeViewModelRegion homeViewModelRegion = HomeViewModelRegion();
  dynamic? selectedValue;
  final TextEditingController searchController = TextEditingController();

  final TextEditingController _nameSare = TextEditingController();
  final TextEditingController _nameRegion = TextEditingController();
  final TextEditingController _clave = TextEditingController();
  final TextEditingController _representante = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _telefono = TextEditingController();
  final TextEditingController _regiones = TextEditingController();
  final TextEditingController _longitud = TextEditingController();
  final TextEditingController _latitud = TextEditingController();
  final TextEditingController _localidadIdController = TextEditingController();
  List seleccionados = [];
  List regiones = [];
  FocusNode nameSare = FocusNode();
  FocusNode nameRegionFocusNode = FocusNode();
  FocusNode localidadIFocusNode = FocusNode();
  FocusNode representante = FocusNode();
  FocusNode email = FocusNode();
  FocusNode telefono = FocusNode();
  FocusNode regions = FocusNode();

  FocusNode latitud = FocusNode();
  FocusNode longitud = FocusNode();

  FocusNode clave = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _nameRegion.dispose();
    _nameSare.dispose();
    _clave.dispose();
    _representante.dispose();
    _email.dispose();
    _telefono.dispose();
    _regiones.dispose();
    _latitud.dispose();
    _longitud.dispose();
    _localidadIdController.dispose();
  }

  final _multiSelectKey = GlobalKey<FormFieldState>();

  void setIdLocalidad() {
    setState(() {
      _localidadIdController.text = selectedValue.id.toString();
      print("Select vaules desde metodo set: " +
          _localidadIdController.text.toString());
    });
  }

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
            homeViewModelRegion.fechtRegionListApi(token.toString());
          })
        });
  }

  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final addSare = Provider.of<HomeViewModelSare>(context);

    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Form(
            key: _keyForm,
            child: Column(
              children: [
                BarGradient("Crear Sare", Icons.create_new_folder),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10.0),
                  height: 80,
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  child: TextFormField(
                    controller: _nameSare,
                    keyboardType: TextInputType.text,
                    //focusNode: nameSare,
                    autofocus: true,
                    decoration: const InputDecoration(
                      hintText: 'Ingrese El Nombre de la sare',
                      labelText: 'Nombre De La Sarea',
                      prefixIcon: Icon(Icons.person_add_alt_1_sharp),
                    ),
                    validator: (valor) {
                      if (valor!.isEmpty) {
                        return "Ingresar El Nombre De La Sare";
                      }
                      return null;
                    },
                    onEditingComplete: () =>
                        Utils.fielFocusGeneral(context, clave),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10.0),
                  height: 90,
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  child: TextFormField(
                    controller: _clave,
                    keyboardType: TextInputType.text,
                    focusNode: clave,
                    maxLength: 10,
                    decoration: const InputDecoration(
                      hintText: 'Ingrese La Clave',
                      labelText: 'Clave De La Sare',
                      prefixIcon: Icon(Icons.key),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Ingrese los 6 caracteres";
                      }
                      return null;
                    },
                    onEditingComplete: () =>
                        Utils.fielFocusGeneral(context, representante),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Container(
                  height: 100.0,
                  width: 350.0,
                  child: ChangeNotifierProvider<HomeViewModelLocalidad>(
                    create: (BuildContext context) => homeViewModelLocalidad,
                    child: Consumer<HomeViewModelLocalidad>(
                        builder: (context, lista, _) {
                      switch (lista.localidadList.status!) {
                        case Status.LOADING:
                          return Center(child: CircularProgressIndicator());
                        case Status.ERROR:
                          return Center(
                              child:
                                  Text(lista.localidadList.message.toString()));
                        case Status.COMPLETED:
                          //var index;
                          return Center(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButtonFormField2(
                                buttonDecoration: BoxDecoration(
                                  color: Color.fromARGB(255, 235, 235, 235),
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      style: BorderStyle.solid,
                                      width: 1.00),
                                ),
                                isExpanded: true,
                                hint: Row(
                                  children: [
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(18, 0, 18, 0)),
                                    Icon(
                                      Icons.list,
                                      size: 15,
                                      color: Color.fromARGB(255, 0, 0, 0),
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
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                items: lista.localidadList.data!.localidades!
                                    .map((nombre_localidad) =>
                                        DropdownMenuItem<dynamic>(
                                          value: nombre_localidad,
                                          child: Text(
                                            nombre_localidad.nameLoc
                                                .toString()
                                                .toUpperCase(),
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0)),
                                            textAlign: TextAlign.justify,
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedValue = value as dynamic;

                                    print(selectedValue.id);
                                  });
                                },
                                value: selectedValue,
                                validator: (value) {
                                  if (value == null) {
                                    print("valor nulo");
                                    return 'Relationship is required';
                                  }
                                  return null;
                                },
                                buttonHeight: 50,
                                buttonWidth: 350,
                                itemHeight: 50,
                                dropdownMaxHeight: 400,
                                buttonPadding:
                                    const EdgeInsets.only(left: 25, right: 25),
                                dropdownDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: Color.fromARGB(255, 235, 235, 235),
                                ),
                                searchController: searchController,
                                searchInnerWidget: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 8,
                                    bottom: 5,
                                    right: 8,
                                    left: 8,
                                  ),
                                  child: TextFormField(
                                    controller: searchController,
                                    decoration: InputDecoration(
                                      isDense: false,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 8,
                                      ),
                                      hintText: 'Buscar...',
                                      icon: Icon(Icons.search),
                                      hintStyle: const TextStyle(
                                        fontSize: 12,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                    ),
                                    //validator: (selectedValue),
                                  ),
                                ),
                                searchMatchFn: (nombre_localidad, searchValue) {
                                  var name = nombre_localidad.value!.nameLoc!
                                      .toString()
                                      .contains(searchValue);
                                  return name;
                                },
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
                  margin: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10.0),
                  height: 80,
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  child: TextFormField(
                    controller: _representante,
                    focusNode: representante,
                    decoration: const InputDecoration(
                      hintText: 'Ingrese el nombre del representante',
                      labelText: 'Nombre Del representate de la Sare',
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Ingresa el nombre del representante';
                      }
                      return null;
                    },
                    onEditingComplete: () =>
                        Utils.fielFocusGeneral(context, email),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10.0),
                  height: 85,
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  child: TextFormField(
                    controller: _email,
                    focusNode: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Ingrese Su Correo Electronico',
                      labelText: 'Correo Electronico',
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Formato incorrecto Ejemplo: correo@dominio.com';
                      }
                      return null;
                    },
                    onEditingComplete: () =>
                        Utils.fielFocusGeneral(context, telefono),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10.0),
                  height: 90,
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  child: TextFormField(
                    controller: _telefono,
                    focusNode: telefono,
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    decoration: const InputDecoration(
                      hintText: 'Ingrese El Telefono',
                      labelText: 'Numero De Telefono',
                      prefixIcon: Icon(Icons.phone),
                    ),
                    validator: (value) {
                      if (value!.length < 10 || value.length > 10) {
                        return "Ingrese los 10 caracteres";
                      }
                      return null;
                    },
                    onEditingComplete: () =>
                        Utils.fielFocusGeneral(context, latitud),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10.0),
                  height: 80,
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  child: TextFormField(
                    controller: _latitud,
                    focusNode: latitud,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Latitud',
                      labelText: 'Latitud',
                      prefixIcon: Icon(Icons.location_searching),
                    ),
                    onEditingComplete: () =>
                        Utils.fielFocusGeneral(context, longitud),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10.0),
                  height: 80,
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  child: TextFormField(
                    controller: _longitud,
                    focusNode: longitud,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Longitud',
                      labelText: 'Longitud',
                      prefixIcon: Icon(Icons.location_searching),
                    ),
                  ),
                ),
                getListaRegiones(),
                SizedBox(
                  height: height * .085,
                ),
                RoundButton(
                  title: "Siguiente",
                  loading: addSare.addLoading,
                  onPress: () {
                    if (_keyForm.currentState!.validate()) {
                      setIdLocalidad();
                      print("validadcion correcta");
                      Map data = {
                        "nameSare": _nameSare.text.toString(),
                        "idSare": _clave.text.toString(),
                        "nameJefeSare": _representante.text.toString(),
                        "telefono": _telefono.text.toString(),
                        "email": _email.text.toString(),
                        "longitud": _longitud.text.toString(),
                        "latitud": _latitud.text.toString(),
                        "regions": seleccionados.toList().toString(),
                        "localidadId": _localidadIdController.text.toString(),
                      };
                      addSare.addSareApi(data, token.toString(), context);
                    } else {
                      Utils.toastMessage("Rellenar los campos en rojo");
                      print("validacion incorrecta");
                    }
                  },
                ),
                SizedBox(
                  height: height * .03,
                ),
              ],
            ),
          ),
        )));
  }

  ChangeNotifierProvider<HomeViewModelRegion> getListaRegiones() {
    return ChangeNotifierProvider<HomeViewModelRegion>(
      create: (BuildContext context) => homeViewModelRegion,
      child: Consumer<HomeViewModelRegion>(builder: (context, lista, _) {
        switch (lista.regionList.status!) {
          case Status.LOADING:
            return Center(child: CircularProgressIndicator());
          case Status.ERROR:
            return Center(child: Text(lista.regionList.message.toString()));
          case Status.COMPLETED:
            final _itemList = lista.regionList.data!.regiones!
                .map((reg) =>
                    MultiSelectItem<dynamic>(reg, reg.nameRegion.toString()))
                .toList();
            return Container(
              padding: EdgeInsets.all(20),
              child: Column(children: <Widget>[
                SizedBox(height: 40),
                MultiSelectDialogField(
                  dialogHeight: 600,
                  dialogWidth: 500,
                  cancelText: Text('Cancelar',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                      )),
                  items: _itemList,
                  //initialValue: [],
                  title: Text("Regiones"),
                  selectedColor: Colors.green,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 210, 210, 211),
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    border: Border.all(
                      color: Color.fromARGB(255, 210, 210, 211),
                      width: 2,
                    ),
                  ),
                  buttonIcon: Icon(
                    Icons.arrow_drop_down_circle,
                    color: Color.fromARGB(255, 28, 74, 12),
                  ),
                  buttonText: Text(
                    "Selecciona la(s) region(es) a atender",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  onConfirm: (results) {
                    try {
                      List l = [];
                      dynamic a = jsonEncode(results);
                      for (var i in results) {
                        seleccionados.add(i.id);
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
              ]),
            );
        }
      }),
    );
  }
}
