import 'dart:convert';

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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['email'] = email;
    data['password'] = password;
    data['roleId'] = roleId;
    data['employeeId'] = employeeId;
    return data;
  }
}
