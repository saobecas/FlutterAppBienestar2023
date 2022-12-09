class AppUrl {
  //static var baseUrl = "https://directoriosapi-production.up.railway.app";
  static var baseUrl = "https://becas-api.onrender.com";
//http://10.0.2.16:5000
  // static var baseUrl = "http://localhost:5000";
  static var loginEndPoint = "$baseUrl/api/users/signin";

  static var registerEndPoint = "$baseUrl/api/users/signup";

  static var userListGellAllEndPoint = "$baseUrl/api/users";
  static var userUpdatePassword = '$baseUrl/api/users/update/';
  static var userIdDataEndPoint = "$baseUrl/api/user-data/";

  //rutas para region
  static var addRegionEndPoint = "$baseUrl/api/v1/region";
  static var regionListGellAllEndPoint = "$baseUrl/api/v1/regiones";
  static var regionUpdateEndPoint = "$baseUrl/api/v1/region/";
  static var regionGetIdEndPoint = "$baseUrl/api/v1/region/";
  static var regionDeleteEndPoint = "$baseUrl/api/v1/region/";
  //rutas para municipio
  static var addMunicipioEndPoint = "$baseUrl/api/v1/municipio";
  static var municipioListGellAllEndPoint = "$baseUrl/api/v1/municipios";
  static var municipioUpdateAllEndPoint = "$baseUrl/api/v1/municipio/";

  //rutas para localidad
  static var addLocalidadEndPoint = "$baseUrl/api/v1/localidad";
  static var localidadListGellAllEndPoint = "$baseUrl/api/v1/localidades";
  static var localidadUpdateEndPoint = "$baseUrl/api/v1/localidades/";

  // rutas para Scholls
  static var schoolListGellAllEndPoint = "$baseUrl/api/v1/schools";
  static var addSchollEndPoint = "$baseUrl/api/v1/school";

  static var schoolUpdateEndPoint = "$baseUrl/api/v1/school/";

  static var directorUpdateEndPoint = "$baseUrl/api/v1/directorUpdate/";

  static var supervisorUpdateEndPoint = "$baseUrl/api/v1/supervisorUpdate/";
}
