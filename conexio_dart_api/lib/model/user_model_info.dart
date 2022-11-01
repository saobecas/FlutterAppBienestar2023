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
/*
  static Map<String, dynamic> toMap(User user) => {
        'id': user.id,
        'email': user.email,
        'password': user.password,
        'roleId': user.roleId,
        'employeeId': user.employeeId,
      };

  static String encode(List<User> users) => json.encode(
        users.map<Map<String, dynamic>>((user) => User.toMap(user)).toList(),
      );

  static List<User> decode(String users) =>
      (json.decode(users) as List<dynamic>)
          .map<User>((item) => User.fromJson(item))
          .toList();*/
}
