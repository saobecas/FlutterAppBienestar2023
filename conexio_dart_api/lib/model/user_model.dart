import 'package:conexio_dart_api/model/user_model_info.dart';

class UserModel {
  //List<User> user;
  User? user;
  String? token;

  //UserModel({this.user, this.token});
  UserModel({this.user, this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

/* 
class UserModel {
  List<User>? user;
  String? token;

  UserModel({this.user, this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    if (json['user'] != null) {
      user = <User>[];
      json['user'].forEach((v) {
        user!.add(new User.fromJson(v));
      });
    }
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.map((v) => v.toJson()).toList();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  int? id;
  String? email;
  String? password;
  int? roleId;
  int? employeeId;

  User({this.id, this.email, this.password, this.roleId, this.employeeId});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    roleId = json['roleId'];
    employeeId = json['employeeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['password'] = this.password;
    data['roleId'] = this.roleId;
    data['employeeId'] = this.employeeId;
    return data;
  }
}
*/