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
  String? cct;
  String? nivel;
  String? calle;
  String? noExterior;
  String? numeroInterior;
  String? asentamiento;
  String? email;
  String? telefono;
  Null? userId;
  int? localidadId;
  int? ubicacionId;
  int? directorId;
  String? createdAt;
  String? updatedAt;
  Localidad? localidad;
  Ubicacion? ubicacion;
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
    localidad = json['localidad'] != null
        ? new Localidad.fromJson(json['localidad'])
        : null;
    ubicacion = json['ubicacion'] != null
        ? new Ubicacion.fromJson(json['ubicacion'])
        : null;
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
    if (this.localidad != null) {
      data['localidad'] = this.localidad!.toJson();
    }
    if (this.ubicacion != null) {
      data['ubicacion'] = this.ubicacion!.toJson();
    }
    if (this.director != null) {
      data['director'] = this.director!.toJson();
    }
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

class Ubicacion {
  int? id;
  double? longitud;
  double? latidud;
  String? createdAt;
  String? updatedAt;

  Ubicacion(
      {this.id, this.longitud, this.latidud, this.createdAt, this.updatedAt});

  Ubicacion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    longitud = json['longitud'];
    latidud = json['latidud'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['longitud'] = this.longitud;
    data['latidud'] = this.latidud;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Director {
  int? id;
  String? name;
  String? sindicato;
  String? telephone;
  String? puesto;
  String? email;
  bool? status;
  String? atencion;
  int? supervisorId;
  String? createdAt;
  String? updatedAt;
  Supervisor? supervisor;

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
      this.updatedAt,
      this.supervisor});

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
    supervisor = json['supervisor'] != null
        ? new Supervisor.fromJson(json['supervisor'])
        : null;
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
    if (this.supervisor != null) {
      data['supervisor'] = this.supervisor!.toJson();
    }
    return data;
  }
}

class Supervisor {
  int? id;
  String? name;
  String? telephone;
  String? email;
  String? recuperado;
  String? directorioRecuperado;
  String? createdAt;
  String? updatedAt;

  Supervisor(
      {this.id,
      this.name,
      this.telephone,
      this.email,
      this.recuperado,
      this.directorioRecuperado,
      this.createdAt,
      this.updatedAt});

  Supervisor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    telephone = json['telephone'];
    email = json['email'];
    recuperado = json['recuperado'];
    directorioRecuperado = json['directorio_recuperado'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['telephone'] = this.telephone;
    data['email'] = this.email;
    data['recuperado'] = this.recuperado;
    data['directorio_recuperado'] = this.directorioRecuperado;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
