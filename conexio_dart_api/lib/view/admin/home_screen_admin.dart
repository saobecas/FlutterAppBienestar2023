import 'package:conexio_dart_api/data/response/status.dart';
import 'package:conexio_dart_api/res/color.dart';
import 'package:conexio_dart_api/utils/routes/routes_name.dart';
import 'package:conexio_dart_api/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/home_view_model.dart';

class HomeScreenAdmin extends StatefulWidget {
  const HomeScreenAdmin({super.key});

  @override
  State<HomeScreenAdmin> createState() => _HomeScreenAdminState();
}

class _HomeScreenAdminState extends State<HomeScreenAdmin> {
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
              accountName: Text("Kevin Uziel Hernandez Morales"),
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
                  Icons.home_filled,
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
                Navigator.pushNamed(context, RoutesName.homeSchool);
                Navigator.of(context).pop();
              },
            ),
            Divider(),
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
