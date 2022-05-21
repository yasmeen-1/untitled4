import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled4/shared_components/colors.dart';
import 'package:untitled4/shared_components/style.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../config/routing.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  static String tag = 'login-page';

  @override
  State<StatefulWidget> createState() {
    return _RegisterPageState();
  }
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _key = GlobalKey();
  bool _obscureText = true;
  int textLength = 0;
  TextEditingController usernameController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController spController = TextEditingController();
  TextEditingController skillsController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  Widget button = Text('Login', style: MyStyles().buttonText);
  bool loading = false;

  @override
  void dispose() {
    usernameController.dispose();
    fullnameController.dispose();
    confirmPasswordController.dispose();
    passwordController.dispose();
    spController.dispose();
    phoneController.dispose();
    skillsController.dispose();
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
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff73ef5),
              ],
              stops: [0.1],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 120,
                width: MediaQuery.of(context).size.width,
                child: Image.asset("images/3.png"),
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
                          Center(
                              child: Row(children: [
                            Container(
                              //  alignment: Alignment.topRight,
                              padding: EdgeInsets.symmetric(vertical: 5.0),
                              child: Text(
                                "   SIGN",
                                // textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 18,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.deepOrangeAccent,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                "UP",
                                // textAlign: TextAlign.end,
                                style: TextStyle(
                                  letterSpacing: 1,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ]))
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
                              textInputAction: TextInputAction.next,
                              controller: usernameController,
                              onChanged: (value) {
                                setState(() {
                                  textLength = value.length;
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Email';
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
                                      color: Colors.grey, width: 1.0),
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
                              textInputAction: TextInputAction.next,
                              controller: fullnameController,
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
                                hintText: 'Full Name',
                                hintStyle: MyStyles().hintText,
                                contentPadding: const EdgeInsets.fromLTRB(
                                    20.0, 15.0, 20.0, 15.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1.0),
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
                              textInputAction: TextInputAction.next,
                              controller: phoneController,
                              onChanged: (value) {
                                setState(() {
                                  textLength = value.length;
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter phone number';
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
                                hintText: 'Phone number',
                                hintStyle: MyStyles().hintText,
                                contentPadding: const EdgeInsets.fromLTRB(
                                    20.0, 15.0, 20.0, 15.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1.0),
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
                              textInputAction: TextInputAction.next,
                              controller: spController,
                              onChanged: (value) {
                                setState(() {
                                  textLength = value.length;
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Specialization';
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
                                hintText: 'Specialization',
                                hintStyle: MyStyles().hintText,
                                contentPadding: const EdgeInsets.fromLTRB(
                                    20.0, 15.0, 20.0, 15.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1.0),
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
                              textInputAction: TextInputAction.next,
                              controller: skillsController,
                              onChanged: (value) {
                                setState(() {
                                  textLength = value.length;
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter skills';
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
                                hintText: 'skills:',
                                hintStyle: MyStyles().hintText,
                                contentPadding: const EdgeInsets.fromLTRB(
                                    20.0, 15.0, 20.0, 15.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1.0),
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
                                        color: Colors.grey, width: 1.0),
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
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 40,
                            child: TextFormField(
                                textInputAction: TextInputAction.send,
                                controller: confirmPasswordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Confirm Password';
                                  } else if (passwordController.text !=
                                      confirmPasswordController.text) {
                                    return 'Please Confirm Password Correctly';
                                  }
                                  return null;
                                },
                                autofocus: false,
                                obscureText: _obscureText,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintStyle: MyStyles().hintText,
                                  hintText: 'Confirm Password',
                                  contentPadding: const EdgeInsets.fromLTRB(
                                      20.0, 10.0, 20.0, 10.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide: const BorderSide(
                                        color: Colors.grey, width: 1.0),
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
                                    http
                                        .get(Uri.parse(
                                            'http://192.168.1.78/api_dev/api_dev/users/create.php'
                                                    '?'
                                                    'fullname=' +
                                                fullnameController.text +
                                                '&username=' +
                                                usernameController.text +
                                                '&'
                                                    'email=' +
                                                usernameController.text +
                                                '&password=' +
                                                passwordController.text +
                                                '&phone_number=' +
                                                phoneController.text +
                                                '&sp=' +
                                                spController.text +
                                                '&skills=' +
                                                skillsController.text +
                                                '&idcompany=1'))
                                        .then((value) {
                                      if (value.body.contains('error')) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(
                                                    'Somethig went wrong, try again')));
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(
                                                    'Account created, please log in')));
                                      }
                                    });
                                    http
                                        .get(Uri.parse(
                                            'http://192.168.1.78/api_dev/api_dev/Pro/create.php'
                                                    '?'
                                                    'fullname=' +
                                                fullnameController.text +
                                                '&username=' +
                                                usernameController.text +
                                                '&'
                                                    'email=' +
                                                usernameController.text +
                                                '&password=' +
                                                passwordController.text +
                                                '&phone_number=' +
                                                phoneController.text +
                                                '&sp=' +
                                                spController.text +
                                                '&skills=' +
                                                skillsController.text +
                                                '&idcompany=1'))
                                        .then((value) {
                                      if (value.body.contains('error')) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(
                                                    'Somethig went wrong, try again')));
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(
                                                    'Account created, please log in')));

                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (c) => LoginPage()));
                                      }
                                    });
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
                                    : Text('Register',
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
                            child: Row(
                              children: [
                                Text("     if you have account  "),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        Routing().createRoute(LoginPage()));
                                  },
                                  child: Text(
                                    "click here",
                                    style: TextStyle(
                                        color: Colors.deepOrangeAccent),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
