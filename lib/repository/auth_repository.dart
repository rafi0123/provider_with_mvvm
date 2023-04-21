import 'package:mvvm_with_provider/data/netword/basic_pi_services.dart';
import 'package:mvvm_with_provider/data/netword/netword_api_services.dart';
import 'package:mvvm_with_provider/res/app_urls/app_urls.dart';

class AuthRepository {
 final BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
   
    try {
       dynamic response =
        await _apiServices.getPostApiResponse(AppUrl.loginUrl, data);
    return response;
    } catch (e) {
      throw e;
    }
  }

    Future<dynamic> signupApi(dynamic data) async {
   
    try {
       dynamic response =
        await _apiServices.getPostApiResponse(AppUrl.registerUrl, data);
    return response;
    } catch (e) {
      throw e;
    }
  }
}
