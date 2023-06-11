// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'RegisterScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _username = "";
  String _email = "";
  String _password = "";

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_usernameListen);
    _emailController.addListener(_emailListen);
    _passwordController.addListener(_passwordListen);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _emailListen() {
    if (_emailController.text.isEmpty) {
      _email = "";
    } else {
      _email = _emailController.text;
    }
  }

  void _usernameListen() {
    if (_nameController.text.isEmpty) {
      _username = '';
    } else {
      _username = _nameController.text;
    }
  }

  void _passwordListen() {
    if (_passwordController.text.isEmpty) {
      _password = "";
    } else {
      _password = _passwordController.text;
    }
  }

  void clearText() {
    if (_nameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      _nameController.clear();
      _emailController.clear();
      _passwordController.clear();
    }
  }

  void _loginPressed() {
    print('The user wants to login with $_email and $_password');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User LoginScreen'),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraints.maxHeight,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        validator: (value) =>
                            value == '' ? 'Please input username' : null,
                        decoration: InputDecoration(
                          hintText: 'Username',
                          labelText: 'Username',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: _emailController,
                        validator: (value) =>
                            value == '' ? 'Please input email' : null,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: _passwordController,
                        // obscureText: true,
                        validator: (value) =>
                            value == '' ? 'Please input password' : null,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextButton(
                        onPressed: () async {
// var loginResponse = await authService.userAuth(
                          //     _nameController.text,
                          //     _emailController.text,
                          //     _passwordController.text);

                          // if (loginResponse.runtimeType == String) {
                          //   showDialog(
                          //     context: context,
                          //     builder: (context) {
                          //       return Dialog(
                          //         alignment: Alignment.center,
                          //         child: Container(
                          //           height: 100,
                          //           width: 200,
                          //           decoration: const BoxDecoration(),
                          //           child: Text(
                          //             loginResponse.toString(),
                          //           ),
                          //         ),
                          //       );
                          //     },
                          //   );
                          // } else if (loginResponse.runtimeType == User) {
                          //   User user = loginResponse;
                          //   context.read<UserCubit>().emit(user);
                          //   clearText();
                          //   Get.to(const HomeScreen());
                          // }
// clearText();
//                             Get.to(HomeScreen());
                          print('login');
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.to(const RegisterScreen());
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
