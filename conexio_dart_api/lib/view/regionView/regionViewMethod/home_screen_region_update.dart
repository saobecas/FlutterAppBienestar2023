import 'package:conexio_dart_api/data/response/status.dart';
import 'package:conexio_dart_api/model/municipio/municipio_list_model.dart';
import 'package:conexio_dart_api/view_model/user_view_model.dart';
import 'package:conexio_dart_api/view_model/view_model_menu/home_view_model_region.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../res/components/round_button.dart';
import '../../../utils/utils.dart';
import '../../bar_gradient.dart';

class HomeScreenRegionUpdate extends StatelessWidget {
  //final Region region;
  // HomeScreenRegionUpdate(this.region, {super.key});
  HomeScreenRegionUpdate({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            // title: Text(region.id.toString()),
            ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        title: Text("Title"),
                        //     subtitle: Text(region.nameRegion.toString()),
                      ),
                      ListTile(
                        title: Text("ID"),
                        //      subtitle: Text("${region.id}"),
                      ),
                      RoundButton(
                          title: "Actualizar",
                          // loading: regionViewModel.addLoading,
                          onPress: () {})
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

/*class HomeScreenRegionUpdate extends StatefulWidget {
  // final int idRegion;
  //final String nameRegion;
  const HomeScreenRegionUpdate({super.key});

  @override
  State<HomeScreenRegionUpdate> createState() => _HomeScreenRegionUpdateState();
}

class _HomeScreenRegionUpdateState extends State<HomeScreenRegionUpdate> {
  HomeViewModelRegion homeViewModelRegion = HomeViewModelRegion();
  final TextEditingController _nameRegion = TextEditingController();

  FocusNode nameRegionFocusNode = FocusNode();
  final TextEditingController _idRegion = TextEditingController();

  FocusNode _idRegionFocusNode = FocusNode();
  //get id => ModelRegionGetId().region?.id;

  @override
  void dispose() {
    super.dispose();
    // homeViewModelRegion.fechtIdRegionListApi(id);
    _nameRegion.dispose();
    _idRegion.dispose();
    _idRegionFocusNode.dispose();
    nameRegionFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final userPreferences = Provider.of<UserViewModel>(context);
    return Scaffold(
      body: ChangeNotifierProvider<HomeViewModelRegion>(
        create: (BuildContext context) => homeViewModelRegion,
        child: Consumer<HomeViewModelRegion>(builder: (context, value, _) {
          switch (value.regionIdList.status!) {
            case Status.LOADING:
              return Center(child: CircularProgressIndicator());
            case Status.ERROR:
              return Center(child: Text(value.regionIdList.message.toString()));
            case Status.COMPLETED:
              return ListView.builder(
                //   itemCount: value.regionIdList.data!.region!.id,
                itemBuilder: (context, index) {
                  return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.all(11),
                      elevation: 8,
                      child: SafeArea(
                          child: SingleChildScrollView(
                        child: Column(
                          children: [
                            BarGradient(
                                "Actualizar Region", Icons.update_rounded),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 10.0),
                              height: 80,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 16),
                              child: TextFormField(
                                controller: _nameRegion,
                                keyboardType: TextInputType.text,
                                focusNode: nameRegionFocusNode,
                                autofocus: true,
                                decoration: const InputDecoration(
                                  hintText: 'Ingrese El Nombre De La Region',
                                  labelText: 'Nombre De La Region',
                                  prefixIcon: Icon(
                                    Icons.add_home_sharp,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * .030,
                            ),
                            RoundButton(
                                title: "Actualizar Region",
                                onPress: () {
                                  if (_nameRegion.text.isEmpty) {
                                    Utils.flushBarErrorMessage(
                                        "Por Favor Ingresa El Nombre De La Región",
                                        context);
                                  }
                                  ;
                                  final _futureRegion = homeViewModelRegion
                                      .fechtIdRegionListApi(_idRegion);
                                })
                          ],
                        ),
                      )));
                },
              );
          }
        }),
      ),
    );
  }
}
*/
/*




       ListTile(
                          contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                          title: Text(
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                            ),
                            "REGION : " +
                                value.regionIdList.data!.region!.nameRegion
                                    .toString(),
                          ),
                          subtitle: Text(
                            "Id: " +
                                value.regionIdList.data!.region!.id.toString(),
                          ),
                        ),
*/
