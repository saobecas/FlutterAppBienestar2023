import 'package:conexio_dart_api/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model_info.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> saveUser(UserModel userSharedPre) async {
    final SharedPreferences sharedPre = await SharedPreferences.getInstance();

    /*sharedPre.setStringList(
        "user", <String>["id", "email", "password", "roleId", "employeeId"]);
    //sharedPre.setString('user', userSharedPre.user.toString());
    notifyListeners();*/
    sharedPre.setString("token", userSharedPre.token.toString());
    notifyListeners();
    return true;
  }

  Future<UserModel> getUser() async {
    final SharedPreferences sharedPre = await SharedPreferences.getInstance();
/*
    final String? usersString = sharedPre.getString('usersString');
    final List<User> users = User.decode(usersString!);*/

    //final List<String>? userList = sharedPre.getStringList("user");
    final String? token = sharedPre.getString('token');
    return UserModel(token: token.toString());

    /*return UserModel(
        user: User.fromJson(userList.toString()), token: token.toString());*/
  }

  Future<bool> remove() async {
    final SharedPreferences sharedPre = await SharedPreferences.getInstance();
    sharedPre.remove('token');
    return true;
  }
}
