class UserListModel {
  List<Users>? users;

  UserListModel({this.users});

  UserListModel.fromJson(Map<String, dynamic> json) {
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(new Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.users != null) {
      data['users'] = this.users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Users {
  int? id;
  String? email;
  String? password;
  int? roleId;
  int? employeeId;

  Users({this.id, this.email, this.password, this.roleId, this.employeeId});

  Users.fromJson(Map<String, dynamic> json) {
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
