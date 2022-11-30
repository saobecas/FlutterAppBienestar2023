abstract class BaseApiService {
  Future<dynamic> getGetApiResponse(String url);
  Future<dynamic> getPostApiResponse(String url, dynamic data);
  Future<dynamic> getPutApiResponse(String url, int id, dynamic data);
  Future<dynamic> getGetIdApiResponse(String url, int id);
}
//Future<dynamic> getGetIdApiResponse(String url,int id);
//Future<dynamic> getPutApiResponse(String url, int id, dynamic data);
  //Future<dynamic> getPutApiResponse(String url, RegionModelGet reion);