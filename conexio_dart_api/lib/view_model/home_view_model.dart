import 'package:flutter/material.dart';

import '../data/response/api_response.dart';
import '../model/user_list_model.dart';
import '../repository/home_repository.dart';

class HomeViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();

  ApiResponse<UserListModel> userList = ApiResponse.loading();

  setUserList(ApiResponse<UserListModel> response) {
    userList = response;
    notifyListeners();
  }

  Future<void> fetchUserListApi() async {
    setUserList(ApiResponse.loading());

    _myRepo.fetchUserList().then((value) {
      setUserList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setUserList(ApiResponse.error(error.toString()));
    });
  }
}
