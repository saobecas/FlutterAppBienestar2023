import 'package:conexio_dart_api/res/components/round_button.dart';
import 'package:conexio_dart_api/view_model/school/home_view_model_school.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../../data/response/status.dart';
import '../../../res/color.dart';
import '../../../utils/routes/routes_name.dart';
import '../../../view_model/user_view_model.dart';

class HomeScreenSchoolGetAll extends StatefulWidget {
  const HomeScreenSchoolGetAll({super.key});

  @override
  State<HomeScreenSchoolGetAll> createState() => _HomeScreenSchoolGetAllState();
}

class _HomeScreenSchoolGetAllState extends State<HomeScreenSchoolGetAll> {
  HomeViewModelScholl homeViewModelScholl = HomeViewModelScholl();

  @override
  void initState() {
    homeViewModelScholl.fechtSchoolListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userPreferences = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: Text("Lista De Escuelas"),
        centerTitle: true,
        backgroundColor: AppColors.grenSnackBar,
        /* actions: [
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
        ],*/
      ),
      body: ChangeNotifierProvider<HomeViewModelScholl>(
        create: (BuildContext context) => homeViewModelScholl,
        child: Consumer<HomeViewModelScholl>(builder: (context, value, _) {
          switch (value.schoolList.status!) {
            case Status.LOADING:
              return Center(child: CircularProgressIndicator());
            case Status.ERROR:
              return Center(child: Text(value.schoolList.message.toString()));
            case Status.COMPLETED:
              return ListView.builder(
                itemCount: value.schoolList.data!.schols!.length,
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
                            "Escuela: " +
                                value.schoolList.data!.schols![index].nameSchool
                                    .toString(),
                          ),
                          subtitle: Text(
                            "Director: " +
                                value.schoolList.data!.schols![index].director!
                                    .name
                                    .toString(),
                          ),
                          leading: Icon(Icons.home),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "localidad: " +
                                value.schoolList.data!.schols![index].localidad!
                                    .nameLoc
                                    .toString(),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            TextButton(
                              child: const Text('Detalles'),
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.pushNamed(
                                    context, RoutesName.schoolDetail);
                              },
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
          }
        }),
      ),
    );
  }
}
