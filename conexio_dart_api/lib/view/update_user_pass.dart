import 'package:conexio_dart_api/res/components/round_button.dart';
import 'package:conexio_dart_api/utils/utils.dart';
import 'package:conexio_dart_api/view/bar_gradient.dart';
import 'package:conexio_dart_api/view_model/home_view_model.dart';
import 'package:conexio_dart_api/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreenUserPasswordUpdate extends StatefulWidget {
  final userId;
  final editPassword;
  final fullNamed;
  final email;
  final numberPhone;
  final oficina;
  //final nameRole;
  const HomeScreenUserPasswordUpdate({
    super.key,
    this.userId,
    this.editPassword,
    this.fullNamed,
    this.email,
    this.numberPhone,
    this.oficina,
    //this.nameRole,
  });

  @override
  State<HomeScreenUserPasswordUpdate> createState() =>
      _HomeScreenUserPasswordUpdateState();
}

class _HomeScreenUserPasswordUpdateState
    extends State<HomeScreenUserPasswordUpdate> {
  TextEditingController _userId = TextEditingController();
  TextEditingController _editPassword = TextEditingController();
  TextEditingController _fullNamed = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _numberPhone = TextEditingController();
  TextEditingController _oficina = TextEditingController();
  //TextEditingController _nameRole = TextEditingController();

  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);

  @override
  void getUser() {
    // _editPassword.text = widget. nameRegion.toString();
    _userId.text = widget.userId.toString();
    _editPassword.text = widget.editPassword.toString();
    _fullNamed.text = widget.fullNamed.toString();
    _email.text = widget.email.toString();
    _numberPhone.text = widget.numberPhone.toString();
    _oficina.text = widget.oficina.toString();
    // _nameRole.text = widget.nameRole.toString();
  }

  UserViewModel getSharedPreferences = UserViewModel();
  String? token;

  @override
  void initState() {
    getSharedPreferences;
    super.initState();
    getSharedPreferences
        .getUser()
        .then((value) => {token = value.token, setState(() {})});
    getUser();
  }

  FocusNode idUserFocusNode = FocusNode();
  FocusNode passworsFocusNode = FocusNode();
  FocusNode fullNameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode numberFocusNode = FocusNode();
  FocusNode oficinaFocusNode = FocusNode();
  //FocusNode nameRoleFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    idUserFocusNode.dispose();
    passworsFocusNode.dispose();
    fullNameFocusNode.dispose();
    emailFocusNode.dispose();
    numberFocusNode.dispose();
    oficinaFocusNode.dispose();
    //nameRoleFocusNode.dispose();
    _obscurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    //print("valor de la segunda pantalla $_idRegion $_editNameRegion ");
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BarGradient("Actualizar Usuario", Icons.update),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                /* tamaño del colum */ height: 80,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: TextFormField(
                  controller: _fullNamed,
                  //initialValue: nameRegion,
                  keyboardType: TextInputType.text,
                  focusNode: fullNameFocusNode,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Ingrese Su Nombre Completo ',
                    labelText: 'Nombre',
                    prefixIcon: Icon(
                      Icons.add_reaction_sharp,
                    ),
                  ),
                  onEditingComplete: () =>
                      Utils.fielFocusSignUp(context, emailFocusNode),
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
                  controller: _email,
                  keyboardType: TextInputType.text,
                  focusNode: emailFocusNode,
                  decoration: const InputDecoration(
                    hintText: 'Ingrese Su Correo Electronico',
                    labelText: 'Correo Electronico',
                    prefixIcon: Icon(
                      Icons.email,
                    ),
                  ),
                  onEditingComplete: () =>
                      Utils.fielFocusSignUp(context, passworsFocusNode),
                  textInputAction: TextInputAction.next,
                ),
              ),
              ValueListenableBuilder(
                  valueListenable: _obscurePassword,
                  builder: (context, value, child) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10.0),
                      height: 80,
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 16),
                      child: TextFormField(
                        controller: _editPassword,
                        obscureText: _obscurePassword.value,
                        focusNode: passworsFocusNode,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                          hintText: 'Ingrese Su Contraseña',
                          labelText: 'Contraseña',
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: InkWell(
                              onTap: () {
                                _obscurePassword.value =
                                    !_obscurePassword.value;
                              },
                              child: Icon(_obscurePassword.value
                                  ? Icons.visibility_off
                                  : Icons.visibility)),
                        ),
                        onEditingComplete: () =>
                            Utils.fielFocusSignUp(context, numberFocusNode),
                        textInputAction: TextInputAction.next,
                      ),
                    );
                  }),
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 10.0),
                height: 80,
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                child: TextFormField(
                  controller: _numberPhone,
                  focusNode: numberFocusNode,
                  maxLength: 10,
                  decoration: const InputDecoration(
                    hintText: 'Ingrese Su Numero De Telefono',
                    labelText: 'Telefono',
                    prefixIcon: Icon(Icons.phone),
                  ),
                  onEditingComplete: () =>
                      Utils.fielFocusSignUp(context, oficinaFocusNode),
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
                  controller: _oficina,
                  focusNode: oficinaFocusNode,
                  decoration: const InputDecoration(
                    hintText: 'Ingrese El Nombre De La Oficina',
                    labelText: 'Nombre De La Oficna',
                    prefixIcon: Icon(Icons.add_business),
                  ),
                ),
              ),
              SizedBox(
                height: height * .030,
              ),
              RoundButton(
                title: "Actualizar",
                loading: homeViewModel.putLoading,
                onPress: () {
                  // print(_editNameRegion);
                  // print(_idRegion);
                  if (_fullNamed.text.isEmpty) {
                    Utils.flushBarErrorMessage(
                        "Por Favor Ingresa Su Nombre", context);
                  } else {
                    Map data = {
                      'full_name': _fullNamed.text.toString(),
                      'email': _email.text.toString(),
                      'password': _editPassword.text.toString(),
                      'number_phone': _numberPhone.text.toString(),
                      'oficina': _oficina.text.toString(),
                    };

                    homeViewModel.putUserPassword(
                        widget.userId, data, token.toString(), context);

                    //Future.delayed(Duration(seconds: 2));
                    //Navigator.pushNamed(context, RoutesName.region);
                    //Navigator.pop(context);
                  }
                },
              ),
              SizedBox(
                height: height * .05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


/*
 Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          // Within the SecondScreen widget
          onPressed: () {
            // todo se utiliza para retornar a la primera pagina
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
    */