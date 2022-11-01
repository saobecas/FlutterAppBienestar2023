import '../data/network/base_api_service.dart';
import '../data/network/network_api_service.dart';
import '../model/user_list_model.dart';
import '../res/api_url.dart';

class HomeRepository {
  BaseApiService _apiServices = NetworkApiService();

  Future<UserListModel> fetchUserList() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.userListGellAllEndPoint);
      return response = UserListModel.fromJson(response);
    } catch (e) {
      //rethrow;
      throw e;
    }
  }
}
