import 'package:conexio_dart_api/data/network/base_api_service.dart';
import 'package:conexio_dart_api/data/network/network_api_service.dart';
import 'package:conexio_dart_api/model/school/school_list_model.dart';
import 'package:conexio_dart_api/res/api_url.dart';

class HomeRepositorySchool {
  BaseApiService _apiServices = NetworkApiService();

  Future<SchoolModelGet> fechtSchoolList() async {
    try {
      dynamic response = await _apiServices
          .getGetApiResponse(AppUrl.schoolListGellAllEndPoint);

      return response = SchoolModelGet.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> addSchoolApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.addSchollEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
