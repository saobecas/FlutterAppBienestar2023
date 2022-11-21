import 'package:conexio_dart_api/view_model/view_model_menu/home_view_model_municipio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../../data/response/status.dart';
import '../../../res/color.dart';

class HomeScreenMuniGetAll extends StatefulWidget {
  const HomeScreenMuniGetAll({super.key});

  @override
  State<HomeScreenMuniGetAll> createState() => _HomeScreenMuniGetAllState();
}

class _HomeScreenMuniGetAllState extends State<HomeScreenMuniGetAll> {
  HomeViewModelMunicipio homeViewModelMuni = HomeViewModelMunicipio();

  @override
  void initState() {
    homeViewModelMuni.fechtMunicipioListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista De Municipios"),
        centerTitle: true,
        backgroundColor: AppColors.grenSnackBar,
      ),
      body: ChangeNotifierProvider<HomeViewModelMunicipio>(
        create: (BuildContext context) => homeViewModelMuni,
        child: Consumer<HomeViewModelMunicipio>(builder: (context, value, _) {
          switch (value.municipioList.status!) {
            case Status.LOADING:
              return Center(child: CircularProgressIndicator());
            case Status.ERROR:
              return Center(
                  child: Text(value.municipioList.message.toString()));
            case Status.COMPLETED:
              return ListView.builder(
                itemCount: value.municipioList.data!.municipios!.length,
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
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                            ),
                            "MUNICIPIO: ${value.municipioList.data!.municipios![index].name.toString()} \n\n REGION: ${value.municipioList.data!.municipios![index].region!.nameRegion.toString()} \n",
                          ),
                          subtitle: Text("Creacion: " +
                              value.municipioList.data!.municipios![index]
                                  .createdAt
                                  .toString()),
                          trailing: Container(
                            width: 70,
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: IconButton(
                                  color: AppColors.buttonColor,
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => SimpleDialog(
                                        children: [
                                          TextField(
                                            onChanged: (value) {
                                              setState(() {
                                                value;
                                              });
                                            },
                                          ),
                                          ElevatedButton(
                                              onPressed: () {},
                                              child: Text('Actualizar'))
                                        ],
                                      ),
                                    );
                                  },
                                  icon: Icon(Icons.edit),
                                )),
                                Expanded(
                                    child: IconButton(
                                  color: AppColors.buttonColor,
                                  onPressed: () {},
                                  icon: Icon(Icons.delete),
                                ))
                              ],
                            ),
                          ),
                          leading: Icon(Icons.home),
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
