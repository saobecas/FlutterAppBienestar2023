class SchoolModelGet {
  List<Schols>? schols;

  SchoolModelGet({this.schols});

  SchoolModelGet.fromJson(Map<String, dynamic> json) {
    if (json['schols'] != null) {
      schols = <Schols>[];
      json['schols'].forEach((v) {
        schols!.add(new Schols.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.schols != null) {
      data['schols'] = this.schols!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Schols {
  int? id;
  String? nameSchool;
  int? cct;
  String? nivel;
  String? calle;
  int? noExterior;
  String? numeroInterior;
  String? asentamiento;
  String? email;
  String? telefono;
  int? userId;
  int? localidadId;
  Null? ubicacionId;
  int? directorId;
  String? createdAt;
  String? updatedAt;
  Usuario? usuario;
  Localidad? localidad;
  Null? ubicacion;
  Director? director;

  Schols(
      {this.id,
      this.nameSchool,
      this.cct,
      this.nivel,
      this.calle,
      this.noExterior,
      this.numeroInterior,
      this.asentamiento,
      this.email,
      this.telefono,
      this.userId,
      this.localidadId,
      this.ubicacionId,
      this.directorId,
      this.createdAt,
      this.updatedAt,
      this.usuario,
      this.localidad,
      this.ubicacion,
      this.director});

  Schols.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameSchool = json['name_school'];
    cct = json['cct'];
    nivel = json['nivel'];
    calle = json['calle'];
    noExterior = json['noExterior'];
    numeroInterior = json['numeroInterior'];
    asentamiento = json['asentamiento'];
    email = json['email'];
    telefono = json['telefono'];
    userId = json['userId'];
    localidadId = json['localidadId'];
    ubicacionId = json['ubicacionId'];
    directorId = json['directorId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    usuario =
        json['usuario'] != null ? new Usuario.fromJson(json['usuario']) : null;
    localidad = json['localidad'] != null
        ? new Localidad.fromJson(json['localidad'])
        : null;
    ubicacion = json['ubicacion'];
    director = json['director'] != null
        ? new Director.fromJson(json['director'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_school'] = this.nameSchool;
    data['cct'] = this.cct;
    data['nivel'] = this.nivel;
    data['calle'] = this.calle;
    data['noExterior'] = this.noExterior;
    data['numeroInterior'] = this.numeroInterior;
    data['asentamiento'] = this.asentamiento;
    data['email'] = this.email;
    data['telefono'] = this.telefono;
    data['userId'] = this.userId;
    data['localidadId'] = this.localidadId;
    data['ubicacionId'] = this.ubicacionId;
    data['directorId'] = this.directorId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.usuario != null) {
      data['usuario'] = this.usuario!.toJson();
    }
    if (this.localidad != null) {
      data['localidad'] = this.localidad!.toJson();
    }
    data['ubicacion'] = this.ubicacion;
    if (this.director != null) {
      data['director'] = this.director!.toJson();
    }
    return data;
  }
}

class Usuario {
  int? id;
  String? email;
  String? password;
  int? roleId;
  int? employeeId;

  Usuario({this.id, this.email, this.password, this.roleId, this.employeeId});

  Usuario.fromJson(Map<String, dynamic> json) {
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

class Localidad {
  int? id;
  String? nameLoc;
  int? claveLocOfi;
  int? municipioId;
  String? createdAt;
  String? updatedAt;

  Localidad(
      {this.id,
      this.nameLoc,
      this.claveLocOfi,
      this.municipioId,
      this.createdAt,
      this.updatedAt});

  Localidad.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameLoc = json['nameLoc'];
    claveLocOfi = json['claveLocOfi'];
    municipioId = json['municipioId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nameLoc'] = this.nameLoc;
    data['claveLocOfi'] = this.claveLocOfi;
    data['municipioId'] = this.municipioId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Director {
  int? id;
  String? name;
  String? sindicato;
  int? telephone;
  String? puesto;
  String? email;
  bool? status;
  String? atencion;
  int? supervisorId;
  String? createdAt;
  String? updatedAt;

  Director(
      {this.id,
      this.name,
      this.sindicato,
      this.telephone,
      this.puesto,
      this.email,
      this.status,
      this.atencion,
      this.supervisorId,
      this.createdAt,
      this.updatedAt});

  Director.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sindicato = json['sindicato'];
    telephone = json['telephone'];
    puesto = json['puesto'];
    email = json['email'];
    status = json['status'];
    atencion = json['atencion'];
    supervisorId = json['supervisorId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['sindicato'] = this.sindicato;
    data['telephone'] = this.telephone;
    data['puesto'] = this.puesto;
    data['email'] = this.email;
    data['status'] = this.status;
    data['atencion'] = this.atencion;
    data['supervisorId'] = this.supervisorId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
