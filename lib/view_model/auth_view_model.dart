import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/repository/auth_repository.dart';
import 'package:mvvm_with_provider/utils/utils.dart';

import '../utils/routes/routes_name.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  bool _loingLoading = false;
  bool get loginLoading => _loingLoading;
  bool _signupLoading = false;
  bool get signupLoading => _signupLoading;

  void setLoginLoading(bool value) {
    _loingLoading = value;
    notifyListeners();
  }

  void setSignupLoading(bool value) {
    _signupLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoginLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoginLoading(false);

      Utils.flushBarErrorMessage("Login Successfully", context);
      Navigator.pushNamed(context, RoutesName.home);
    }).onError((error, stackTrace) {
      setLoginLoading(false);

      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  Future<void> signupApi(dynamic data, BuildContext context) async {
    setSignupLoading(true);
    _myRepo.loginApi(data).then((value) {
    setSignupLoading(false);

      Utils.flushBarErrorMessage("Login Successfully", context);
      Navigator.pushNamed(context, RoutesName.home);
    }).onError((error, stackTrace) {
    setSignupLoading(false);

      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }
}
