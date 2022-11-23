import 'package:conexio_dart_api/data/network/base_api_service.dart';
import 'package:conexio_dart_api/data/network/network_api_service.dart';
import 'package:conexio_dart_api/model/region/region_list_model.dart';
import 'package:conexio_dart_api/model/region/region_model.dart';
import 'package:conexio_dart_api/res/api_url.dart';

class HomeRepositoryRegion {
  BaseApiService _apiServices = NetworkApiService();

  Future<RegionModelGet> fechtRegionList() async {
    try {
      dynamic response = await _apiServices
          .getGetApiResponse(AppUrl.regionListGellAllEndPoint);

      return response = RegionModelGet.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> addRegionApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.addRegionEndPoint, data);

      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> putRegionApi(int id, dynamic data) async {
    try {
      dynamic response = await _apiServices.getPutApiResponse(
          AppUrl.addRegionEndPoint, id, data);

      return response;
    } catch (e) {
      throw e;
    }
  }
}
