import 'dart:io';

import 'package:flutter/material.dart';

import 'package:untitled4/config/routing.dart';
import 'package:untitled4/logins/login_page.dart';
import 'package:untitled4/logins/register.dart';
import 'package:untitled4/pages/Succ.dart';

class Home_page extends StatefulWidget {
  Home_page({Key? key}) : super(key: key);
  int _current = 0;

  @override
  _Home_pageState createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  var company;
  var typework;
  var degree;
  var image;
  //var dateTime = DateTime.parse("dateTimeString");

  final fromkey = GlobalKey<FormState>();
  List work = [
    {"company": "asal ", "work": "full time software eng", "degree": "master"},
    {"company": "exalt", "work": "full time software eng", "degree": "master"},
    {
      "company": "enfinit",
      "work": "full time software eng",
      "degree": "master"
    },
    {
      "company": "almostaqbal",
      "work": "full time software eng",
      "degree": "master"
    },
    {
      "company": "bank jordan",
      "work": "full time software eng",
      "degree": "master"
    }
  ];
  @override
  int selectedindex = 0;
  int _current = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white38,

      appBar: AppBar(
        title: Text('youre way to freelance'),
        /*    leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),*/
        actions: [
          IconButton(
              onPressed: () {
                exit(0);
              },
              icon: Icon(Icons.exit_to_app)),
        ],
        shadowColor: Colors.deepOrangeAccent,
        elevation: 10,
        backgroundColor: Colors.deepOrangeAccent,
        brightness: Brightness.dark,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //   w.elementAt(selectedindex),
            Container(
                color: Colors.black,
                height: 300,
                child: PageView(
                  onPageChanged: (index) {
                    print(index);
                  },
                  children: [
                    // Text("kjhgfghjkl"),

                    Image.asset('images/5.jpg', fit: BoxFit.fill),
                    Image.asset('images/21.jpeg', fit: BoxFit.fill),
                    Image.asset('images/24.jpeg', fit: BoxFit.fill),
                    // Image.asset('images/8.jpg', fit: BoxFit.fill),
                  ],
                )),
            // Container(
            //      child: GridView.builder(
            //   gridDelegate: gridDelegate, itemBuilder: itemBuilder)),
            SizedBox(
              height: 10,
            ),
/*
            Container(
              child: Text(
                "كافة الخدمات المتاحة ",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
            Container(
                // height: 20,
                //   margin: const EdgeInsets.all(12.0),

                //width: 10,
                /* child: GridView.builder(
                  //   scrollDirection: Axis.horizontal,
                  itemCount: work.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 30,
                  ),
                  itemBuilder: (context, i) {
                    return Container(
                      //   margin: EdgeInsets.all(10),
                      child: ListTile(
                        tileColor: Colors.deepOrangeAccent,
                        title: Text(
                          "111",
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 20,
                          ),
                        ),
                        subtitle: Text(
                          "work: ",
                          style: TextStyle(
                            //   color: Colors.blueGrey,
                            fontSize: 16,
                          ),
                        ),
                        textColor: Colors.black,
                        leading: CircleAvatar(),
                      ),
                    );
                  }),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 30,
                    ),
                    itemBuilder: (context, i) {
                      return Container(
                        //   margin: EdgeInsets.all(10),
                        child: ListTile(
                          tileColor: Colors.deepOrangeAccent,
                          title: Text(
                            "111",
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 20,
                            ),
                          ),
                          subtitle: Text(
                            "work: ",
                            style: TextStyle(
                              //   color: Colors.blueGrey,
                              fontSize: 16,
                            ),
                          ),
                          textColor: Colors.black,
                          leading: CircleAvatar(),
                        ),
                      );
                    })
                    */

                ),
            Container(
              child: Text(
                "كيف يعمل هذا التطبييق ؟",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
            Container(
              height: 200,
              width: 300,
              child: Image.asset("images/88.jpg", fit: BoxFit.fill),
            ),
         */
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text("Log in to start using the app to get business"),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                child: RaisedButton(
              color: Colors.deepOrangeAccent,
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).push(Routing().createRoute(LoginPage()));

                //  LogIn();
              },
              // padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              child: Text(
                "LOG IN ",
                style: TextStyle(fontSize: 14),
              ),
            )),
            Container(
              child: Text("_or_"),
            ),

            Container(
                child: RaisedButton(
              color: Colors.deepOrangeAccent,
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context)
                    .push(Routing().createRoute(RegisterPage()));

                //  Signup();
              },
              // padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              child: Text(
                "Sign Up ",
                style: TextStyle(fontSize: 14),
              ),
            )),
            SizedBox(
              height: 20,
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  /*
                  GestureDetector(
                    onTap: (

                        //  Navigation.of(context).

                        //   Navigator.of(context).pushNamed("Signup");

                        ) {
                      //Navigator.of(context).pushNamed(),
                    },
                    child: Container(
                        color: Colors.black,
                        height: 170,
                        width: 170,
                        child: PageView(
                          onPageChanged: (index) {
                            print(index);
                          },
                          children: [
                            // Text("kjhgfghjkl"),

                            Image.asset('images/5.jpg', fit: BoxFit.fill),
                            Image.asset('images/21.jpeg', fit: BoxFit.fill),
                            Image.asset('images/24.jpeg', fit: BoxFit.fill),
                            // Image.asset('images/8.jpg', fit: BoxFit.fill),
                          ],
                        )),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: (

                        //  Navigation.of(context).

                        //   Navigator.of(context).pushNamed("Signup");

                        ) {
                      //Navigator.of(context).pushNamed(),
                    },
                    child: Container(
                        color: Colors.black,
                        height: 170,
                        width: 170,
                        child: PageView(
                          onPageChanged: (index) {
                            print(index);
                          },
                          children: [
                            // Text("kjhgfghjkl"),

                            Image.asset('images/5.jpg', fit: BoxFit.fill),
                            Image.asset('images/21.jpeg', fit: BoxFit.fill),
                            Image.asset('images/24.jpeg', fit: BoxFit.fill),
                            // Image.asset('images/8.jpg', fit: BoxFit.fill),
                          ],
                        )),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: (

                        //  Navigation.of(context).

                        //   Navigator.of(context).pushNamed("Signup");

                        ) {
                      //Navigator.of(context).pushNamed(),
                    },
                    child: Container(
                        color: Colors.black,
                        height: 170,
                        width: 170,
                        child: PageView(
                          onPageChanged: (index) {
                            print(index);
                          },
                          children: [
                            // Text("kjhgfghjkl"),

                            Image.asset('images/5.jpg', fit: BoxFit.fill),
                            Image.asset('images/21.jpeg', fit: BoxFit.fill),
                            Image.asset('images/24.jpeg', fit: BoxFit.fill),
                            // Image.asset('images/8.jpg', fit: BoxFit.fill),
                          ],
                        )),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: (

                        //  Navigation.of(context).

                        //   Navigator.of(context).pushNamed("Signup");

                        ) {
                      //Navigator.of(context).pushNamed(),
                    },
                    child: Container(
                        color: Colors.black,
                        height: 170,
                        width: 170,
                        child: PageView(
                          onPageChanged: (index) {
                            print(index);
                          },
                          children: [
                            // Text("kjhgfghjkl"),

                            Image.asset('images/5.jpg', fit: BoxFit.fill),
                            Image.asset('images/21.jpeg', fit: BoxFit.fill),
                            Image.asset('images/24.jpeg', fit: BoxFit.fill),
                            // Image.asset('images/8.jpg', fit: BoxFit.fill),
                          ],
                        )),
                  ),
                  SizedBox(
                    width: 20,
                  ),*/
                  GestureDetector(
                    onTap: (

                        //  Navigation.of(context).

                        //   Navigator.of(context).pushNamed("Signup");

                        ) {
                      //Navigator.of(context).pushNamed(),
                    },
                    child: Container(
                        color: Colors.black,
                        height: 150,
                        width: 150,
                        child: PageView(
                          onPageChanged: (index) {
                            print(index);
                          },
                          children: [
                            // Text("kjhgfghjkl"),

                            Image.asset('images/3.jpg', fit: BoxFit.fill),
                            Image.asset('images/36.jpg', fit: BoxFit.fill),
                            // Image.asset('images/8.jpg', fit: BoxFit.fill),
                          ],
                        )),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                    onTap: (

                        //  Navigation.of(context).

                        //   Navigator.of(context).pushNamed("Signup");

                        ) {
                      //Navigator.of(context).pushNamed(),
                    },
                    child: Container(
                        color: Colors.black,
                        height: 150,
                        width: 150,
                        child: PageView(
                          onPageChanged: (index) {
                            print(index);
                          },
                          children: [
                            // Text("kjhgfghjkl"),

                            // Image.asset('images/33.jpg', fit: BoxFit.fill),
                            Image.asset('images/34.jpg', fit: BoxFit.fill),
                            Image.asset('images/35.jpg', fit: BoxFit.fill),
                            // Image.asset('images/8.jpg', fit: BoxFit.fill),
                          ],
                        )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: (

                        //  Navigation.of(context).

                        //   Navigator.of(context).pushNamed("Signup");

                        ) {
                      //Navigator.of(context).pushNamed(),
                    },
                    child: Container(
                      height: 50.0,
                      width: 150.0,
                      child: Text("business opportunities"),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  GestureDetector(
                    onTap: (

                        //  Navigation.of(context).

                        //   Navigator.of(context).pushNamed("Signup");

                        ) {
                      //Navigator.of(context).pushNamed(),
                    },
                    child: Container(
                      height: 50.0,
                      width: 150.0,
                      child: Text("job vacancies"),
                    ),
                  ),
                  Container(),
                ],
              ),
            ),
            Container(
              child: Text(""),
            ),

            SizedBox(
              height: 20,
            ),
            Container(
              child: Text("Contact us at"),
            ),

            SizedBox(
              height: 10,
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: (

                        //  Navigation.of(context).

                        //   Navigator.of(context).pushNamed("Signup");

                        ) {
                      Navigator.of(context)
                          .push(Routing().createRoute(LoginPage));
                    },
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 6.0,
                          ),
                        ],
                        image: DecorationImage(
                          image: NetworkImage('images/10.jpg'),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Text("facebook account"),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: (

                        //  Navigation.of(context).

                        //   Navigator.of(context).pushNamed("Signup");

                        ) {
                      Navigator.of(context).pushNamed("");
                    },
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 6.0,
                          ),
                        ],
                        image: DecorationImage(
                          image: NetworkImage('images/11.jpg'),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Text("google account"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      //
      //  padding: EdgeInsets.all(10),

      drawerScrimColor: Colors.white54,
      drawer: Drawer(
        backgroundColor: Colors.white38,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(0),
              child: Container(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      foregroundColor: Colors.white54,
                      backgroundColor: Colors.pink,
                      child: Text("U"),
                    ),
                    const SizedBox(
                        //height: 10,
                        ),
                    //   arrowColor: Colors.black,
                    //  Text("LogIn"),
                    Text("LOG IN")
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text("LogIn page"),
              leading: Icon(Icons.login_outlined),
              onTap: () {
                Navigator.of(context).push(Routing().createRoute(LoginPage()));
              },
            ),
            ListTile(
              title: Text("SignUp page"),
              leading: Icon(Icons.login),
              onTap: () {
                Navigator.of(context)
                    .push(Routing().createRoute(RegisterPage()));
              },
            ),
            ListTile(
              title: Text("about page"),
              leading: Icon(Icons.help_center),
              onTap: () {
                Navigator.of(context).push(Routing().createRoute(Succ()));
              },
            ),
            ListTile(
              title: Text("exit"),
              leading: Icon(Icons.exit_to_app),
              onTap: () {
                exit(0);
              },
            ),
          ],
        ),
      ),
    );
  }
}
