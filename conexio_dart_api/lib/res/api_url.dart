class AppUrl {
  static var baseUrl = "https://directoriosapi-production.up.railway.app";
  //static var baseUrl = "http://localhost:5000";

  static var loginEndPoint = "$baseUrl/api/users/signin";

  static var registerEndPoint = "$baseUrl/api/users/signup";

  static var userListGellAllEndPoint = "$baseUrl/api/users";

  // rutas para Scholls
  static var schoolListGellAllEndPoint = "$baseUrl/api/v1/schools";
  static var addSchollEndPoint = "$baseUrl/api/v1/school";
}
