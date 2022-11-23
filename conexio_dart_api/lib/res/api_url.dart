class AppUrl {
  //static var baseUrl = "https://directoriosapi-production.up.railway.app";
  static var baseUrl = "https://api-becas.onrender.com";
//http://10.0.2.16:5000
  static var loginEndPoint = "$baseUrl/api/users/signin";

  static var registerEndPoint = "$baseUrl/api/users/signup";

  static var userListGellAllEndPoint = "$baseUrl/api/users";

  //rutas para region
  static var addRegionEndPoint = "$baseUrl/api/v1/region";
  static var regionListGellAllEndPoint = "$baseUrl/api/v1/regiones";
  static var regionUpdateEndPoint = "$baseUrl/api/v1/school/:id";

  //rutas para municipio
  static var addMunicipioEndPoint = "$baseUrl/api/v1/municipio";
  static var municipioListGellAllEndPoint = "$baseUrl/api/v1/municipios";

  //rutas para localidad
  static var addLocalidadEndPoint = "$baseUrl/api/v1/localidad";
  static var localidadListGellAllEndPoint = "$baseUrl/api/v1/localidades";

  // rutas para Scholls
  static var schoolListGellAllEndPoint = "$baseUrl/api/v1/schools";
  static var addSchollEndPoint = "$baseUrl/api/v1/school";
}
