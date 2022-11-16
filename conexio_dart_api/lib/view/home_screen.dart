import 'package:conexio_dart_api/data/response/status.dart';
import 'package:conexio_dart_api/res/color.dart';
import 'package:conexio_dart_api/utils/routes/routes_name.dart';
import 'package:conexio_dart_api/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        title: Text("Lista de usuarios"),
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
              accountName: Text(""),
              accountEmail: Text("KevinAdmin@gmail.com"),
              decoration: BoxDecoration(color: Colors.green[900]),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 166, 212, 168),
                child: Text(
                  "K",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Inicio",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              leading: Icon(
                Icons.home,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            Divider(
              height: 10,
              color: Colors.black,
            ),
            ListTile(
              title: Text(
                "Region",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              leading: Icon(
                Icons.holiday_village_rounded,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text(
                "Municipio",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              leading: Icon(
                Icons.account_balance_sharp,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
                title: Text(
                  "Localidad",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                leading: Icon(
                  Icons.home_work_rounded,
                  color: Colors.black,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                }),
            ListTile(
              title: Text(
                "Escuela",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              leading: Icon(
                Icons.school_sharp,
                color: Colors.black,
              ),
              onTap: () {
               //Navigator.of(context).pop();
                Navigator.pushNamed(context, RoutesName.school);
              },
            ),
            Divider(
              height: 15,
              color: Colors.black,
            ),
            ListTile(
              title: Text(
                "Configuración",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              leading: Icon(
                Icons.manage_accounts,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: ChangeNotifierProvider<HomeViewModel>(
        create: (BuildContext contex) => homeViewModel,
        child: Consumer<HomeViewModel>(
          builder: (context, value, _) {
            switch (value.userList.status!) {
              case Status.LOADING:
                return Center(child: CircularProgressIndicator());
              case Status.ERROR:
                return Center(child: Text(value.userList.message.toString()));
              case Status.COMPLETED:
                return ListView.builder(
                  itemCount: value.userList.data!.users!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.all(11),
                      elevation: 8,
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                            title: Text(
                              "Id Usuario: " +
                                  value.userList.data!.users![index].employeeId
                                      .toString(),
                            ),
                            subtitle: Text("Correo Electronico: " +
                                value.userList.data!.users![index].email
                                    .toString()),
                          ),
                        ],
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
