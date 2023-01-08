import 'package:conexio_dart_api/res/components/round_button.dart';
import 'package:conexio_dart_api/utils/utils.dart';
import 'package:conexio_dart_api/view/bar_gradient.dart';
import 'package:conexio_dart_api/view_model/home_view_model.dart';
import 'package:conexio_dart_api/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenRoleUpdateUser extends StatefulWidget {
  final idUser;
  final idRole;
  const ScreenRoleUpdateUser({super.key, this.idUser, this.idRole});

  @override
  State<ScreenRoleUpdateUser> createState() => _ScreenRoleUpdateUserState();
}

class _ScreenRoleUpdateUserState extends State<ScreenRoleUpdateUser> {
  final TextEditingController _idUserController = TextEditingController();
  final TextEditingController _idRoleController = TextEditingController();

  FocusNode idUserFocusNode = FocusNode();
  FocusNode idRoleFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _idUserController.dispose();
    _idRoleController.dispose();
  }

  void getDataUser() {
    _idUserController.text = this.widget.idUser;

    _idRoleController.text = this.widget.idRole;
    print(
        "valor id: ${this.widget.idUser}\n\nValor id Rol: ${this.widget.idRole}");
  }

  UserViewModel getSharedPreferences = UserViewModel();
  String? token;

  final _keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    getSharedPreferences;
    super.initState();
    getSharedPreferences
        .getUser()
        .then((value) => {token = value.token, setState(() {})});
    getDataUser();
  }

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _keyForm,
            child: Column(
              children: [
                BarGradient("Actualizar Privilegios", Icons.create_new_folder),
                Container(
                  height: 150,
                  width: 500,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: ListTile(
                        leading: Icon(
                          Icons.list,
                          color: Colors.teal,
                        ),
                        title: Text(
                          "Roles De Usuario Donde:\n\n1 es Administrador\n\n2 es Usuario Normal",
                          style: TextStyle(
                            color: Colors.teal.shade900,
                            fontFamily: "SourceSansPro",
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 400.0, vertical: 10.0),
                  height: 90,
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  child: TextFormField(
                    controller: _idRoleController,
                    keyboardType: TextInputType.number,
                    focusNode: idRoleFocusNode,
                    autofocus: true,
                    decoration: const InputDecoration(
                      hintText: 'Ingrese El Numero del Rol',
                      labelText: 'Numero De Rol',
                      prefixIcon: Icon(Icons.privacy_tip_rounded),
                    ),
                    validator: (valor) {
                      if (valor!.isEmpty) {
                        return "Ingresar El Numero De Rol";
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                  ),
                ),
                SizedBox(
                  height: height * .030,
                ),
                RoundButton(
                  title: "Actualizar",
                  loading: homeViewModel.putLoading,
                  onPress: () {
                    if (_keyForm.currentState!.validate()) {
                      print("validadcion correcta");

                      Map data = {
                        'roleId': _idRoleController.text,
                      };
                      homeViewModel.putUserRole(
                          widget.idUser, data, token.toString(), context);
                      print(widget.idUser.toString());
                      print("Data user: ${data.toString()}");
                      print("Data token: ${token.toString()}");
                    } else {
                      Utils.flushBarErrorMessage(
                          "Rellenar los campos en rojo", context);
                    }
                  },
                ),
                SizedBox(
                  height: height * .03,
                ),
              ],
            ),
          ),
        ),
      ),
    );
    /*final homeViewModel = Provider.of<HomeViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    List listaRol = ["administrador", "usuario"];

    return Scaffold(
      appBar: AppBar(
        title: Text("Actualizar Rol"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * .20,
              ),
              Center(
                child: DropdownButtonFormField(
                  items: listaRol.map(
                    (rol) {
                      return DropdownMenuItem(
                        child: Text(rol),
                        value: rol,
                      );
                    },
                  ).toList(),
                  onChanged: (value) {
                    print(value);

                    setState(
                      () {
                        if (value == "administrador") {
                          admin = _idRoleController.text = 1.toString();
                          print(admin);
                        } else if (value == "usuario") {
                          user = _idRoleController.text = 2.toString();
                          print(user);
                        }
                      },
                    );
                  },
                ),
              ),
              SizedBox(
                height: height * .30,
              ),
              RoundButton(
                title: "guardar",
                loading: homeViewModel.putLoading,
                onPress: () {
                  Map data = {
                    'idRole': _idRoleController.text.toString(),
                  };

                  homeViewModel.putUserRole(
                      this.widget.idUser, data, token.toString(), context);
                  print(data);
                },
              ),
              SizedBox(
                height: height * .03,
              ),
            ],
          ),
        ),
      ),
    );*/
  }
}
