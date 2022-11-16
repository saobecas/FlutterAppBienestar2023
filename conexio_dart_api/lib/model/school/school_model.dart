class SchoolModel {
  String? nameSchool;
  int? cct;
  String? nivel;
  String? calle;
  int? noExterior;
  String? numeroInterior;
  String? asentamiento;
  String? emailSchool;
  String? telefono;
  int? localidadId;
  String? nameDirector;
  String? sindicato;
  int? telephone;
  String? puesto;
  String? emailDirector;
  String? atencion;
  String? nameSupervisor;
  int? telephoneSupervisor;
  String? emailSupervisor;
  String? recuperado;
  String? directorioRecuperado;

  SchoolModel(
      {this.nameSchool,
      this.cct,
      this.nivel,
      this.calle,
      this.noExterior,
      this.numeroInterior,
      this.asentamiento,
      this.emailSchool,
      this.telefono,
      this.localidadId,
      this.nameDirector,
      this.sindicato,
      this.telephone,
      this.puesto,
      this.emailDirector,
      this.atencion,
      this.nameSupervisor,
      this.telephoneSupervisor,
      this.emailSupervisor,
      this.recuperado,
      this.directorioRecuperado});

  SchoolModel.fromJson(Map<String, dynamic> json) {
    nameSchool = json['name_school'];
    cct = json['cct'];
    nivel = json['nivel'];
    calle = json['calle'];
    noExterior = json['noExterior'];
    numeroInterior = json['numeroInterior'];
    asentamiento = json['asentamiento'];
    emailSchool = json['email_school'];
    telefono = json['telefono'];
    localidadId = json['localidadId'];
    nameDirector = json['name_director'];
    sindicato = json['sindicato'];
    telephone = json['telephone'];
    puesto = json['puesto'];
    emailDirector = json['email_director'];
    atencion = json['atencion'];
    nameSupervisor = json['name_supervisor'];
    telephoneSupervisor = json['telephone_supervisor'];
    emailSupervisor = json['email_supervisor'];
    recuperado = json['recuperado'];
    directorioRecuperado = json['directorio_recuperado'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name_school'] = this.nameSchool;
    data['cct'] = this.cct;
    data['nivel'] = this.nivel;
    data['calle'] = this.calle;
    data['noExterior'] = this.noExterior;
    data['numeroInterior'] = this.numeroInterior;
    data['asentamiento'] = this.asentamiento;
    data['email_school'] = this.emailSchool;
    data['telefono'] = this.telefono;
    data['localidadId'] = this.localidadId;
    data['name_director'] = this.nameDirector;
    data['sindicato'] = this.sindicato;
    data['telephone'] = this.telephone;
    data['puesto'] = this.puesto;
    data['email_director'] = this.emailDirector;
    data['atencion'] = this.atencion;
    data['name_supervisor'] = this.nameSupervisor;
    data['telephone_supervisor'] = this.telephoneSupervisor;
    data['email_supervisor'] = this.emailSupervisor;
    data['recuperado'] = this.recuperado;
    data['directorio_recuperado'] = this.directorioRecuperado;
    return data;
  }
}
