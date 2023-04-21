import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:mvvm_with_provider/data/netword/basic_pi_services.dart';

import '../exception/app_exeption.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FitchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url,dynamic data) async {
    dynamic responseJson;
    try {
      Response response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FitchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        break;
      case 400:
        throw BadResponseException(response.body.toString());

      case 404:
        throw UnauthorizedException();
      case 500:
      default:
        throw FitchDataException(
            'Error accoured white communicated with server' +
                'with status code' +
                response.statusCode.toString());
    }
  }
}
