import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/utils/routes/routes_name.dart';
import 'package:mvvm_with_provider/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';
import 'package:mvvm_with_provider/res/components/button_comp.dart';
import 'package:mvvm_with_provider/res/components/text_field_comp.dart';
import 'package:mvvm_with_provider/utils/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _emailFocusNode = FocusNode();

  final _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _emailFocusNode.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(title:const Text('Login'),centerTitle: true,),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // InkWell(
          //     onTap: () {
          //       Navigator.pushNamed(context, RoutesName.home);
          //     },
          //     child:const Text('Go'))

          TextFieldComponent(
            hintText: 'Email',
            controller: _emailController,
            focusNode: _emailFocusNode,
            keyBordType: TextInputType.emailAddress,
            onFieldSubmited: (value) {
              Utils.fieldFocusChange(
                  context, _emailFocusNode, _passwordFocusNode);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          TextFieldComponent(
            hintText: 'password',
            controller: _passwordController,
            focusNode: _passwordFocusNode,
            onFieldSubmited: (value) {},
          ),
          const SizedBox(
            height: 20,
          ),
          ButtonComponent(
            title: 'Login',
            isLoading: authViewModel.loginLoading,
            ontap: () {
              if (_emailController.text.isEmpty) {
                Utils.flushBarErrorMessage('Email is Required', context);
              } else if (_passwordController.text.isEmpty) {
                Utils.flushBarErrorMessage('password is Required', context);
              } else if (_passwordController.text.length < 6) {
                Utils.flushBarErrorMessage(
                    'password should be greater then 6', context);
              } else {
                Map data = {
                  'email': _emailController.text.toString(),
                  'password': _passwordController.text.toString(),
                };
                authViewModel.loginApi(data, context);
              }
            },
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.signup);
              },
              child:const Text("Don't have an account? Sing Up")),
        ],
      )),
    );
  }
}
