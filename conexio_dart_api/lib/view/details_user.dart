import 'package:conexio_dart_api/model/user_list_model.dart';
import 'package:conexio_dart_api/res/color.dart';
import 'package:conexio_dart_api/view/home_screen_update_role.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DetailsUserView extends StatefulWidget {
  final Users? users;

  const DetailsUserView(this.users, {super.key});

  @override
  State<DetailsUserView> createState() => _DetailsUserViewState();
}

class _DetailsUserViewState extends State<DetailsUserView> {
  UserListModel userModel = UserListModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalles Del Usuario"),
        centerTitle: true,
        backgroundColor: AppColors.grenSnackBar,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.symmetric(horizontal: 350.0),
                  elevation: 20,
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {
                          if (kDebugMode) {
                            print(widget.users!.id.toString());
                          }

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ScreenRoleUpdateUser(
                                    idUser: this.widget.users!.id.toString(),
                                    idRole:
                                        this.widget.users!.roleId.toString(),
                                  )));
                        },
                        title: Text(
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                            ),

                            //textAlign: TextAlign.justify,
                            textAlign: TextAlign.left,
                            "Nombre: ${widget.users!.employee!.fullName.toString().toUpperCase()}\n\nCorreo Electronico: ${widget.users!.employee!.email.toString().toUpperCase()} \n\nTelefono: ${widget.users!.employee!.numberPhone.toString().toUpperCase()} \n\nOficina: ${widget.users!.employee!.oficina.toString().toUpperCase()} \n\nRol: ${widget.users!.role!.nameRole.toString().toUpperCase()} \n "),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      /* floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 50),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FloatingActionButton(
              heroTag: "btn1",
              child: Icon(Icons.person_rounded),
              backgroundColor: AppColors.buttonColor,
              tooltip: 'Actualizar Rol',
              onPressed: () {
                final userIdUpdate = widget.users!.id.toString();
                final roleIdUdate = widget.users!.roleId.toString();

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ScreenRoleUpdateUser(
                      idUser: userIdUpdate,
                      idRole: roleIdUdate,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),*/
    );
  }
}
