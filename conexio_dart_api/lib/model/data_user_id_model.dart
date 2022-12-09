class DataUserIdModel {
  User? user;

  DataUserIdModel({this.user});

  DataUserIdModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? email;
  String? password;
  int? roleId;
  int? employeeId;
  Role? role;
  Employee? employee;

  User(
      {this.id,
      this.email,
      this.password,
      this.roleId,
      this.employeeId,
      this.role,
      this.employee});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    roleId = json['roleId'];
    employeeId = json['employeeId'];
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
    employee = json['employee'] != null
        ? new Employee.fromJson(json['employee'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['password'] = this.password;
    data['roleId'] = this.roleId;
    data['employeeId'] = this.employeeId;
    if (this.role != null) {
      data['role'] = this.role!.toJson();
    }
    if (this.employee != null) {
      data['employee'] = this.employee!.toJson();
    }
    return data;
  }
}

class Role {
  int? id;
  String? nameRole;

  Role({this.id, this.nameRole});

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameRole = json['name_role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_role'] = this.nameRole;
    return data;
  }
}

class Employee {
  int? id;
  String? fullName;
  String? email;
  String? numberPhone;
  String? oficina;

  Employee(
      {this.id, this.fullName, this.email, this.numberPhone, this.oficina});

  Employee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    numberPhone = json['number_phone'];
    oficina = json['oficina'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['number_phone'] = this.numberPhone;
    data['oficina'] = this.oficina;
    return data;
  }
}
