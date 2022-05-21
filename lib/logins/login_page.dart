import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled4/config/routing.dart';
import 'package:untitled4/logins/register.dart';
import 'package:untitled4/models/users.dart';
import 'package:untitled4/pages/homeScreen.dart';
import 'package:untitled4/pages/homepage.dart';
import 'package:untitled4/shared_components/colors.dart';
import 'package:untitled4/shared_components/style.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/assets_paths.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  int textLength = 0;
  final GlobalKey<FormState> _key = GlobalKey();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Widget button = Text('Login', style: MyStyles().buttonText);
  bool loading = false;
  bool remember = false;
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff73ef5),
              Color(0xf61a4f1),
              Color(0XFF478DE0),
              Color(0XFF398AE5),
            ],
            stops: [0.1, 0.4, 0.7, 0.9],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 131,
              width: MediaQuery.of(context).size.width,
              child: Image.asset("images/3.png"),
            ),
            const SizedBox(
              height: 30,
            ),
            Form(
              key: _key,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        const SizedBox(width: 18),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "LogIn",
                              style: TextStyle(
                                fontSize: 18,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500,
                                color: Colors.pinkAccent,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 40,

////

                          ///
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            controller: usernameController,
                            onChanged: (value) {
                              setState(() {
                                textLength = value.length;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Username';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            autofocus: false,
                            decoration: InputDecoration(
                              suffixIcon: textLength > 0
                                  ? Icon(
                                      Icons.check_circle,
                                      color: Colors_().primary,
                                    )
                                  : const Icon(
                                      Icons.info_outline,
                                      color: Colors.grey,
                                    ),
                              hintText: 'Email',
                              hintStyle: MyStyles().hintText,
                              contentPadding: const EdgeInsets.fromLTRB(
                                  20.0, 15.0, 20.0, 15.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(
                                    color: Colors.black38, width: 1.0),
                              ),
                            ),
                            onSaved: (String? value) {},
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 40,
                          child: TextFormField(
                              textInputAction: TextInputAction.send,
                              controller: passwordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Password';
                                }
                                return null;
                              },
                              autofocus: false,
                              obscureText: _obscureText,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintStyle: MyStyles().hintText,
                                hintText: 'Password',
                                contentPadding: const EdgeInsets.fromLTRB(
                                    20.0, 10.0, 20.0, 10.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: const BorderSide(
                                      color: Colors.black38, width: 1.0),
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                  child: Icon(
                                    _obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    semanticLabel: _obscureText
                                        ? 'show password'
                                        : 'hide password',
                                  ),
                                ),
                              ),
                              onSaved: (String? value) {}),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 30),
                          child: ButtonTheme(
                            height: 50,
                            child: TextButton(
                              onPressed: () async {
                                if (_key.currentState!.validate()) {
                                  _key.currentState!.save();
                                  setState(() {
                                    loading = true;
                                  });
                                  final prefs =
                                      await SharedPreferences.getInstance();
                                  String username = usernameController.text;
                                  String password = passwordController.text;
                                  Map<String, String> queryParams = {
                                    "username": username,
                                    "password": password
                                  };
                                  String queryString =
                                      Uri(queryParameters: queryParams).query;
                                  try {
                                    http.get(
                                        Uri.parse(
                                            'http://192.168.1.78/api_dev/api_dev/users/login.php?email=' +
                                                username +
                                                '&password=' +
                                                password),
                                        headers: {
                                          'Content-Type': 'application/json'
                                        }).then((value) {
                                      setState(() {
                                        loading = false;
                                      });
                                      if (value.body.contains('error') ||
                                          value.body.contains('Error')) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(
                                                    'wrong email or password')));
                                      } else {
                                        Records records = Records.fromJson(
                                            jsonDecode(value.body));

                                        print(value.body);
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (c) => HomeScreen(
                                                    user: records.records!
                                                        .elementAt(0))));
                                      }
                                    }).onError((error, stackTrace) {
                                      setState(() {
                                        loading = false;
                                        print(error);
                                      });
                                    });
                                  } catch (e) {
                                    log(e.toString());
                                  }
                                }
                              },
                              child: loading
                                  ? GlowingProgressIndicator(
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text("Loading",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall),
                                            JumpingDotsProgressIndicator(
                                              fontSize: 14,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  : Text('Login',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors_().primary,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          width: MediaQuery.of(context).size.width - 80,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          //  padding: ,
                          padding: EdgeInsets.symmetric(vertical: 10.0),

                          child: Row(
                            children: [
                              Text("     if you have't account  "),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                      Routing().createRoute(RegisterPage()));
                                },
                                child: Text(
                                  "click here",
                                  style:
                                      TextStyle(color: Colors.deepOrangeAccent),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed("ForgotPasswordScreen");
                        },
                        padding: EdgeInsets.only(right: 0.0),
                        child: Text(
                          'forget password?',
                        ),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Theme(
                            data:
                                ThemeData(unselectedWidgetColor: Colors.black),
                            child: Checkbox(
                              value: remember,
                              checkColor: Colors.deepOrangeAccent,
                              activeColor: Colors.white,
                              onChanged: (value) {
                                setState(() {
                                  remember = value!;
                                });
                              },
                            ),
                          ),
                          Text('remember me'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
