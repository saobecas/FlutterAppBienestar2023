import 'package:conexio_dart_api/model/region/region_list_model.dart';

abstract class BaseApiService {
  Future<dynamic> getGetApiResponse(String url);
  Future<dynamic> getPostApiResponse(String url, dynamic data);
  Future<dynamic> getPutApiResponse(String url, int id, dynamic data);
  //Future<dynamic> getPutApiResponse(String url, int id, dynamic data);
  //Future<dynamic> getPutApiResponse(String url, RegionModelGet reion);
}
//Future<dynamic> getGetIdApiResponse(String url,int id);