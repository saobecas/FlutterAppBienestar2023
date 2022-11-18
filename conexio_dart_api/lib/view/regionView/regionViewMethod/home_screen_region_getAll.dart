import 'package:conexio_dart_api/res/color.dart';
import 'package:conexio_dart_api/view_model/region/home_view_model_region.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/response/status.dart';
import '../../../view_model/user_view_model.dart';
import 'package:intl/intl.dart';

class HomeScreenRegionGetAll extends StatefulWidget {
  const HomeScreenRegionGetAll({super.key});

  @override
  State<HomeScreenRegionGetAll> createState() => _HomeScreenRegionGetAllState();
}

class _HomeScreenRegionGetAllState extends State<HomeScreenRegionGetAll> {
  HomeViewModelRegion homeViewModelRegion = HomeViewModelRegion();

  @override
  void initState() {
    homeViewModelRegion.fechtRegionListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userPreferences = Provider.of<UserViewModel>(context);
    // final dateTime = DateFormat("dd MMM yyyy");

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista De Regiones"),
        centerTitle: true,
        backgroundColor: AppColors.grenSnackBar,
      ),
      body: ChangeNotifierProvider<HomeViewModelRegion>(
        create: (BuildContext context) => homeViewModelRegion,
        child: Consumer<HomeViewModelRegion>(builder: (context, value, _) {
          switch (value.regionList.status!) {
            case Status.LOADING:
              return Center(child: CircularProgressIndicator());
            case Status.ERROR:
              return Center(child: Text(value.regionList.message.toString()));
            case Status.COMPLETED:
              return ListView.builder(
                itemCount: value.regionList.data!.regiones!.length,
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
                            "REGION : " +
                                value.regionList.data!.regiones![index]
                                    .nameRegion
                                    .toString(),
                          ),
                          subtitle: Text(
                            "Creación: " +
                                value.regionList.data!.regiones![index]
                                    .createdAt!
                                    .toString(),
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
