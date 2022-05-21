import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:untitled4/logins/login_page.dart';
import 'package:untitled4/logins/register.dart';
import 'package:untitled4/pages/MyHomePage.dart';
import 'package:untitled4/pages/Welcomescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:untitled4/pages/email.dart';
import 'package:untitled4/pages/homeScreen.dart';
import 'package:workmanager/workmanager.dart';

import 'pages/Welcomescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Welcomescreen());
  }
}
