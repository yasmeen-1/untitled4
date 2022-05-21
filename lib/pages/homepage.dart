import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled4/models/pro.dart';
import 'package:untitled4/pages/FilterNetworkListPage.dart';
import 'package:untitled4/pages/Succ.dart';
import 'package:untitled4/pages/homeScreen.dart';
import 'package:untitled4/pages/profile.dart';
import 'package:untitled4/pages/requestsPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../models/rate.dart';
import '../models/users.dart';
import '../shared_components/colors.dart';
import 'create_project.dart';
import 'dashboard.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.user,
    //required this.pro,
  }) : super(key: key);
  final User user;
  //final Pro pro;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selected = 0;
  String rate = '', number = '';
  @override
  void initState() {
    http
        .get(Uri.parse(
            'http://192.168.1.78/api_dev/api_dev/users/user_rate.php?idusers=' +
                widget.user.idusers.toString()))
        .then((value) {
      print(value.body);
      RateRecord record = RateRecord.fromJson(jsonDecode(value.body));
      setState(() {
        rate =
            record.records!.elementAt(0).totalRate.toString().substring(0, 3);
        number = record.records!.elementAt(0).nbUsersRate.toString();
      });
    });
    print(number);
    print(rate);
    getImage();
    super.initState();
  }

  String image = '';

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          if (kDebugMode) {}
          return false;
        },
        child: SafeArea(
            child: Scaffold(
                drawerScrimColor: Colors.white54,
                drawer: Drawer(
                  backgroundColor: Colors.white38,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ListTile(
                        title: Text(""),
                        //    leading: Icon(Icons.person),
                        onTap: () {},
                      ),
                      ListTile(
                        title: Text(""),
                        //    leading: Icon(Icons.person),
                        onTap: () {},
                      ),
                      ListTile(
                        title: Text("profile page"),
                        leading: Icon(Icons.person),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Profile(
                                      user: widget.user,

                                      //rate: rate,
                                      // rate = rate,
                                    )),
                          );
                        },
                      ),
                      ListTile(
                        title: Text("Home page"),
                        leading: Icon(Icons.home),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen(
                                      user: widget.user,
                                      // fet: fet,
                                      //rate: rate,
                                      // rate = rate,
                                    )),
                          );
                        },
                      ),
                      ListTile(
                        title: Text("show work applied"),
                        leading: Icon(Icons.help),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RequestsPage(
                                      user: widget.user,

                                      //rate: rate,
                                      // rate = rate,
                                    )),
                          );
                        },
                      ),
                      ListTile(
                        title: Text("about page"),
                        leading: Icon(Icons.help_center),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Succ(

                                    //rate: rate,
                                    // rate = rate,
                                    )),
                          );
                        },
                      ),
                      ListTile(
                        title: Text("Logout page"),
                        leading: Icon(Icons.exit_to_app),
                        onTap: () {
                          exit(0);
                        },
                      ),
                      ListTile(
                        title: Text("add work"),
                        leading: Icon(Icons.exit_to_app),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateProject(
                                      user: widget.user,

                                      //rate: rate,
                                      // rate = rate,
                                    )),
                          );
                        },
                      ),
                      ListTile(
                        title: Text("apply to work"),
                        leading: Icon(Icons.exit_to_app),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FilterNetworkListPage(
                                      user: widget.user,
                                      //    fet: fet,
                                      //rate: rate,
                                      // rate = rate,
                                    )),
                          );
                        },
                      ),
                      ListTile(
                        title: Text("search work"),
                        leading: Icon(Icons.exit_to_app),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Dashboard(
                                      user: widget.user,
                                      //  fet: fet,
                                      //rate: rate,
                                      // rate = rate,
                                    )),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                appBar: AppBar(
                  elevation: 0,
                  leading: Container(),
                  leadingWidth: 0,
                  title: Column(children: [
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.dashboard_rounded,
                            size: 28, color: Colors.black),
                        Text(
                          "  Hello, " + widget.user.fullname.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 20,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ]),
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.deepOrangeAccent,
                  actions: [
                    IconButton(
                        onPressed: () {
                          //     build(context)

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Profile(
                                    user: widget.user,
                                    rate: rate,
                                    number: number
                                    //    pro: widget.pro,
                                    )),
                          );
                        },
                        icon: Icon(Icons.person)),
                    IconButton(
                        onPressed: () {
                          exit(0);
                        },
                        icon: Icon(Icons.exit_to_app)),
                  ],
                ),
                backgroundColor: Colors.deepOrangeAccent,
                bottomNavigationBar: SizedBox(
                    height: 60,
                    child: Padding(
                        padding:
                            const EdgeInsets.only(left: 0, right: 0, bottom: 2),
                        child: DefaultTabController(
                            length: 4,
                            child: AppBar(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        topRight: Radius.circular(12))),
                                shadowColor: Colors.white,
                                elevation: 6,
                                backgroundColor: Colors.white,
                                bottom: TabBar(
                                  onTap: (index) {
                                    setState(() {
                                      selected = index;
                                    });
                                  },
                                  indicatorColor: Colors.deepOrangeAccent,
                                  indicator: UnderlineTabIndicator(
                                    borderSide: BorderSide(
                                        color: Colors_().primary,
                                        width: 4.0,
                                        style: BorderStyle.solid),
                                    insets: const EdgeInsets.fromLTRB(
                                        35.0, 0.0, 35.0, 53.0),
                                  ),
                                  tabs: [
                                    selected == 0
                                        ? Tab(
                                            icon: Icon(
                                            IconlyBold.home,
                                            color: Colors_().primary,
                                          ))
                                        : const Tab(
                                            icon: Icon(
                                            IconlyLight.home,
                                            color: Colors.grey,
                                          )),
                                    selected == 1
                                        ? Tab(
                                            icon: Icon(
                                            Icons.inbox,
                                            color: Colors_().primary,
                                          ))
                                        : const Tab(
                                            icon: Icon(
                                            Icons.inbox,
                                            color: Colors.grey,
                                          )),
                                    selected == 2
                                        ? Tab(
                                            icon: Icon(
                                            IconlyBold.edit,
                                            color: Colors_().primary,
                                          ))
                                        : const Tab(
                                            icon: Icon(
                                            IconlyLight.edit,
                                            color: Colors.grey,
                                          )),
                                    selected == 3
                                        ? Tab(
                                            icon: Icon(
                                            IconlyBold.search,
                                            color: Colors_().primary,
                                          ))
                                        : const Tab(
                                            icon: Icon(
                                            IconlyBroken.search,
                                            color: Colors.grey,
                                          )),
                                  ],
                                ))))),
                body: selected == 0
                    ? Center(child: Dashboard(user: widget.user))
                    : selected == 1
                        ? RequestsPage(user: widget.user)
                        : selected == 2
                            ? Center(
                                child: CreateProject(user: widget.user),
                              )
                            : selected == 3
                                ? Center(
                                    child: FilterNetworkListPage(
                                        user: widget.user),
                                  )
                                : Builder(builder: (context) {
                                    return FilterNetworkListPage(
                                        user: widget.user);
                                  }))));
  }

  storeImage() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (file != null) {
      prefs.setString('test_image', file.path);
    } else {
      prefs.setString('test_image', 'images/man.jpg');
    }
    setState(() {
      selected = 0;
    });
  }

  getImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      image = prefs.getString('test_image').toString();
    });
  }
}
