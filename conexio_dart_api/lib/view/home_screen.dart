import 'package:conexio_dart_api/model/user_model.dart';
import 'package:conexio_dart_api/res/color.dart';
import 'package:conexio_dart_api/utils/routes/routes_name.dart';
import 'package:conexio_dart_api/utils/utils.dart';
import 'package:conexio_dart_api/view/update_user_pass.dart';
import 'package:conexio_dart_api/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel homeViewModel = HomeViewModel();

  User userData = User();
  Employee employeeData = Employee();
  Role roleData = Role();
  UserViewModel getSharedPreferences = UserViewModel();
  /* void getDatos() {
    getSharedPreferences.getUser().then((value) => {
          userData = value.user!,
          employeeData = value.user!.employee!,
          setState(() {})
        });
  }*/

  @override
  void initState() {
    getSharedPreferences;

    super.initState();
    getSharedPreferences.getUser().then((value) => {
          userData = value.user!,
          employeeData = value.user!.employee!,
          roleData = value.user!.role!,
          setState(() {})
        });
  }

  @override
  Widget build(BuildContext context) {
    final userPreferences = Provider.of<UserViewModel>(context);

    var nameDestructor = employeeData.fullName.toString();

    return WillPopScope(
      onWillPop: () => Utils.closedApp(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text(""),
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
                accountName: Text(
                    employeeData.fullName.toString().toUpperCase(),
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                accountEmail: Text(
                  userData.email.toString(),
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.6)),
                ),
                decoration: BoxDecoration(color: AppColors.grenSnackBar),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 166, 212, 168),
                  child: Text(
                    '${nameDestructor[0]}',
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
                  //  Navigator.popAndPushNamed(context, 'dialogos');
                  Navigator.pushNamed(context, RoutesName.home);
                  //Navigator.popAndPushNamed(context, RoutesName.home);
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
                  Navigator.pushNamed(context, RoutesName.region);
                  //  Navigator.popAndPushNamed(context, RoutesName.region);
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
                  Navigator.pushNamed(context, RoutesName.municipio);
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
                    Navigator.pushNamed(context, RoutesName.localidad);
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
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, RoutesName.school);
                },
              ),
              /*Divider(
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
              ),*/
            ],
          ),
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
              ),
              Text(
                "Bienvenido",
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: "SourceSansPro",
                    letterSpacing: 2.0),
              ),
              Text(
                "${employeeData.fullName.toString().toUpperCase()}",
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: "SourceSansPro",
                    letterSpacing: 2.0),
              ),
              SizedBox(
                height: 10.0,
                width: 200,
                child: new Center(
                  child: new Container(
                    margin:
                        new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                    height: 1.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                //elevation: 8,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: Padding(
                    padding: EdgeInsets.all(5),
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.teal,
                      ),
                      title: Text(
                        "${employeeData.numberPhone}",
                        style: TextStyle(
                          color: Colors.teal.shade900,
                          fontFamily: "SourceSansPro",
                          fontSize: 20,
                        ),
                      ),
                    )),
              ),

              /* Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 8,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.teal,
                      ),
                      title: Text(
                        "${roleData.nameRole}",
                        style: TextStyle(
                          color: Colors.teal.shade900,
                          fontFamily: "SourceSansPro",
                          fontSize: 20,
                        ),
                      ),
                    )),
              ),*/
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: ListTile(
                    leading: Icon(
                      Icons.email_rounded,
                      color: Colors.teal,
                    ),
                    title: Text(
                      "${employeeData.email}",
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontFamily: "SourceSansPro",
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: Padding(
                    padding: EdgeInsets.all(5),
                    child: ListTile(
                      leading: Icon(
                        Icons.home_filled,
                        color: Colors.teal,
                      ),
                      title: Text(
                        "Oficina ${employeeData.oficina}",
                        style: TextStyle(
                          color: Colors.teal.shade900,
                          fontFamily: "SourceSansPro",
                          fontSize: 17,
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.edit),
          backgroundColor: AppColors.buttonColor,
          tooltip: 'Editar',
          onPressed: () {
            final _userId = userData.id.toString();
            //final _editPassword = userData.password.toString();
            final _fullNamed = employeeData.fullName.toString();
            final _email = employeeData.email.toString();
            final _numberPhone = employeeData.numberPhone.toString();
            final _oficina = employeeData.oficina.toString();
            // final _nameRole = roleData.nameRole.toString;

            print(_email);
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HomeScreenUserPasswordUpdate(
                  userId: _userId,
                  // editPassword: _editPassword,
                  fullNamed: _fullNamed,
                  email: _email,
                  numberPhone: _numberPhone,
                  oficina: _oficina,
                  // nameRole: _nameRole,
                ),
              ),
            );
            // Navigator.pushNamed(context, RoutesName.updateUser);
            //TODO el navigator pop se utiliza en la segunda pantalla para devolvernos ala principal
            //Navigator.pop(context)
          },
        ),
      ),
    );
  }
}

/*
 body: Container(
        child: FutureBuilder<dynamic>(
          future: homeViewModel.fetchUserDataApi(textData, context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text('Resultado del Home body: ${snapshot.data}');
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
      */
//TODO: metodo para listar usuarios
      /*   
       /*ChangeNotifierProvider<HomeViewModel>(
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
                              "Rol De Usuario: " +
                                  value.userList.data!.users![index].roleId
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
          },
        ),
      ),*/
      */