import 'package:flutter/material.dart';
import 'package:untitled4/config/routing.dart';
import 'package:untitled4/pages/Home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:workmanager/workmanager.dart';

class Welcomescreen extends StatefulWidget {
  const Welcomescreen({Key? key}) : super(key: key);

  @override
  _WelcomescreenState createState() => _WelcomescreenState();
}

class _WelcomescreenState extends State<Welcomescreen> {
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    Workmanager().initialize(

        // The top level function, aka callbackDispatcher
        callbackDispatcher,

        // If enabled it will post a notification whenever
        // the task is running. Handy for debugging tasks
        isInDebugMode: true);
// Periodic task registration
    Workmanager().registerPeriodicTask(
      "2",

      //This is the value that will be
      // returned in the callbackDispatcher
      "simplePeriodicTask",

      // When no frequency is provided
      // the default 15 minutes is set.
      // Minimum frequency is 15 min.
      // Android will automatically change
      // your frequency to 15 min
      // if you have configured a lower frequency.
      frequency: Duration(minutes: 15),
    );
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'images/4.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.2),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 190,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius:
                          BorderRadius.circular(5), //للانحناء يلي ع جنب البوكس
                    ),
                    child: Center(
                        child: Text(
                      "welcome",
                      style: TextStyle(
                        fontSize: 35,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: 400,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          " your way to freelance ",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontStyle: FontStyle.normal),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 90),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.deepOrangeAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 12,
                        )),
                    onPressed: () {
                      //   var routing = Routing;
                      Navigator.of(context)
                          .push(Routing().createRoute(Home_page()));
                    },
                    child: Text(
                      "get start",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 150,
                    width: 80,
                  ),

/*
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUtils(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          text: "dont have an account",
                          color: Colors.white)
                    ],
                  ),


                  
                  TextButton(
                    onPressed: () {





                    },
                    child:
                    
                    
                    
                    
                     TextUtils(
                      text: 'sign up',
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      underLine: TextDecoration.underline,
                    ),
                  ),*/
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void callbackDispatcher() {
    Workmanager().executeTask((task, inputData) {
      // initialise the plugin of flutterlocalnotifications.
      FlutterLocalNotificationsPlugin flip =
          new FlutterLocalNotificationsPlugin();

      // app_icon needs to be a added as a drawable
      // resource to the Android head project.
      var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
      var IOS = new IOSInitializationSettings();

      // initialise settings for both Android and iOS device.
      var settings = new InitializationSettings(android: android, iOS: IOS);
      flip.initialize(settings);
      _showNotificationWithDefaultSound(flip);
      return Future.value(true);
    });
  }

  Future _showNotificationWithDefaultSound(flip) async {
// Show a notification after every 15 minute with the first
// appearance happening a minute after invoking the method
    // ignore: prefer_const_constructors
    // ignore: unnecessary_new
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'your channel id', 'your channel name',
        importance: Importance.max, priority: Priority.high);
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();

// initialise channel platform for both Android and iOS device.
    // ignore: unnecessary_new
    var platformChannelSpecifics = new NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flip.show(
        0,
        'GeeksforGeeks',
        'Your are one step away to connect with GeeksforGeeks',
        platformChannelSpecifics,
        payload: 'Default_Sound');
  }
}
