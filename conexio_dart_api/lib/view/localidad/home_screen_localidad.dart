import 'package:conexio_dart_api/data/response/status.dart';
import 'package:conexio_dart_api/res/color.dart';
import 'package:conexio_dart_api/utils/routes/routes_name.dart';
import 'package:conexio_dart_api/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/home_view_model.dart';

class HomeScreenLocalidad extends StatefulWidget {
  const HomeScreenLocalidad({super.key});

  @override
  State<HomeScreenLocalidad> createState() => _HomeScreenLocalidadState();
}

class _HomeScreenLocalidadState extends State<HomeScreenLocalidad> {
  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    homeViewModel.fetchUserListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userPreferences = Provider.of<UserViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: Text("Directorios Escolares"),
        centerTitle: true,
        backgroundColor: AppColors.grenSnackBar,
        actions: [
          InkWell(
            onTap: () {
              userPreferences.remove().then(
                (value) {
                  Navigator.pushNamed(context, RoutesName.login);
                },
              );
            },
            child: const Center(
              child: Icon(
                Icons.exit_to_app,
              ),
            ),
            //child: Center(child: Text("Cerrar Sesión")),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Yobany"),
              accountEmail: Text("yobany@gmail.com"),
              decoration: BoxDecoration(color: Colors.green[900]),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 166, 212, 168),
                child: Text(
                  "Y",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Obtener Lista De Todas Las Localidades",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              leading: Icon(
                Icons.list,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text(
                "Agregar Una Localidad",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              leading: Icon(
                Icons.add,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
                title: Text(
                  "Obtener Una Localidad",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                leading: Icon(
                  Icons.list,
                  color: Colors.black,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                }),
            ListTile(
              title: Text(
                "Actualizar Una Localidad",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              leading: Icon(
                Icons.update,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text(
                "Eliminar Una Localidad",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              leading: Icon(
                Icons.delete,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      //drawer:

      body: ChangeNotifierProvider<HomeViewModel>(
        create: (BuildContext contex) => homeViewModel,
        child: Consumer<HomeViewModel>(
          builder: (context, value, _) {
            switch (value.userList.status!) {
              case Status.LOADING:
                return CircularProgressIndicator();
              case Status.ERROR:
                return Text(value.userList.message.toString());
              case Status.COMPLETED:
                return ListView.builder(
                  itemCount: value.userList.data!.users!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      /* child: ListTile(
                        title: Text(value.userList.data.toString()),
                      ),*/
                      child: ListTile(
                        title: Text(
                          value.userList.data!.users![index].id.toString(),
                        ),
                        subtitle: Text(value.userList.data!.users![index].email
                            .toString()),
                      ),
                    );
                  },
                );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
