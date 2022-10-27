import 'dart:convert';
import 'dart:io';

import 'package:conexio_dart_api/data/app_exceptions.dart';
import 'package:conexio_dart_api/data/network/base_api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
//import 'package:http/http.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      // await get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FechtDataException("No tiene conexion a internet");
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    print("Data $url+$data");
    try {
      http.Response response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
      if (kDebugMode) {
        print(response.toString());
      }
    } on SocketException {
      throw FechtDataException("No tiene conexion a internet");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    // dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 401:
        throw BadRequestException(response.body.toString());
      case 400:
        throw InvalidInputException(response.body.toString());
      //case:500
      case 500:
        throw MessageApiResponseError(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FechtDataException(
            'ocurrió otro tipo de error al comunicarse con el servidor con código de estado${response.statusCode}');
    }
  }
}
