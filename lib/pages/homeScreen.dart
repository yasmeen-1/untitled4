import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled4/config/routing.dart';
import 'package:untitled4/models/users.dart';
import 'package:untitled4/pages/FilterNetwork.dart';
import 'package:untitled4/pages/Succ.dart';
import 'package:untitled4/pages/add.dart';
import 'package:untitled4/pages/category_card.dart';
import 'package:untitled4/pages/details_screen.dart';
import 'package:untitled4/pages/homepage.dart';
import 'package:untitled4/pages/searg.dart';
import 'package:untitled4/shared_components/style.dart';

import '../logins/login_page.dart';
import '../logins/register.dart';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled4/models/pro.dart';
import 'package:untitled4/pages/FilterNetworkListPage.dart';
import 'package:untitled4/pages/profile.dart';
import 'package:untitled4/pages/requestsPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../models/rate.dart';
import '../models/users.dart';
import '../shared_components/colors.dart';
import 'create_project.dart';
import 'dashboard.dart';

class HomeScreen extends StatefulWidget {
  @override
  const HomeScreen({
    Key? key,
    required this.user,
    //required this.pro,
  }) : super(key: key);
  final User user;
  //final Pro pro;

  @override
  // ignore: override_on_non_overriding_member
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
  Widget button = Text('show all work', style: MyStyles().buttonText);

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    //this gonna give us total height and with of our device
    return WillPopScope(
      onWillPop: () async {
        if (kDebugMode) {}
        return false;
      },
      child: Scaffold(
        //  bottomNavigationBar: BottomNavBar(),
        // drawerScrimColor: Colors.white54,
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
                        builder: (context) => RequestsPage(
                              user: widget.user,
                              //    pro: widget.pro,
                            )),
                  );
                },
                icon: Icon(Icons.notifications_active)),
            IconButton(
                onPressed: () {
                  //     build(context)

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Profile(
                            user: widget.user, rate: rate, number: number
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
        backgroundColor: const Color(0xfff8fcff),
        /* bottomNavigationBar: SizedBox(
            height: 60,
            child: Padding(
                padding: const EdgeInsets.only(left: 0, right: 0, bottom: 2),
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
                          indicatorColor: Colors.blue,
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
                        ))))),*/

        drawer: Drawer(
          backgroundColor: const Color(0xfff8fcff),
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
                              rate: rate,
                              number: number,
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
                title: Text("switch to another account"),
                leading: Icon(Icons.exit_to_app),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (c) => LoginPage()));
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
        body: Stack(
          children: <Widget>[
            //    getselect(),
            Container(
              // Here the height of the container is 45% of our total height
              height: size.height * .45,
              decoration: BoxDecoration(
                color: Color(0xFFF5CEB8),
                //  image: DecorationImage(
                // alignment: Alignment.centerLeft,
                //image: AssetImage("images/3.png"),
                //  ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        alignment: Alignment.center,
                        height: 52,
                        width: 52,
                        //   decoration: BoxDecoration(
                        //   color: Color(0xFFF2BEA1),
                        //  shape: BoxShape.circle,
                        //  ),
                        //   child: SvgPicture.asset("assets/icons/menu.svg"),
                      ),
                    ),
                    Text(
                        "Welcome. You can add works easily. Applying for other job opportunities at the same time  ",
                        style: Theme.of(context).textTheme.bodyLarge
                        //    .copyWith(fontWeight: FontWeight.w900),
                        ),
                    SizedBox(
                      height: 30,
                    ),
                    // ElevatedButton(onPressed: onPressed, child: build(RaisedButton(onPressed: onPressed)))
                    Container(
                      child: ButtonTheme(
                          height: 50,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HomePage(user: widget.user

                                            //    pro: widget.pro,
                                            )),
                              );
                            },
                            child: button,
                          )),
                    ),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: .85,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(13),
                            child: Container(
                              // padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.deepOrangeAccent,
                                borderRadius: BorderRadius.circular(13),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 17),
                                    blurRadius: 17,
                                    spreadRadius: -23,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Dashboard(user: widget.user
                                                  //    pro: widget.pro,
                                                  )),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      children: <Widget>[
                                        Spacer(),
                                        // SvgPicture.asset(svgSrc),
                                        Spacer(),
                                        Text("search a work",
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          ClipRRect(
                            borderRadius: BorderRadius.circular(13),
                            child: Container(
                              // padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.deepOrangeAccent,
                                borderRadius: BorderRadius.circular(13),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 17),
                                    blurRadius: 17,
                                    spreadRadius: -23,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              FilterNetworkListPage(
                                                  user: widget.user
                                                  //    pro: widget.pro,
                                                  )),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      children: <Widget>[
                                        Spacer(),
                                        // SvgPicture.asset(svgSrc),
                                        Spacer(),
                                        Text(
                                            "Businesses that fit your specialty",
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          ClipRRect(
                            borderRadius: BorderRadius.circular(13),
                            child: Container(
                              // padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.deepOrangeAccent,
                                borderRadius: BorderRadius.circular(13),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 17),
                                    blurRadius: 17,
                                    spreadRadius: -23,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RequestsPage(user: widget.user)),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      children: <Widget>[
                                        Spacer(),
                                        // SvgPicture.asset(svgSrc),
                                        Spacer(),
                                        Text(
                                            "Follow up on the work you have submitted",
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(13),
                            child: Container(
                              // padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.deepOrangeAccent,
                                borderRadius: BorderRadius.circular(13),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 17),
                                    blurRadius: 17,
                                    spreadRadius: -23,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              FilterNetworkPage(
                                                  user: widget.user
                                                  //    pro: widget.pro,
                                                  )),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      children: <Widget>[
                                        Spacer(),
                                        // SvgPicture.asset(svgSrc),
                                        Spacer(),
                                        Text("Businesses that fit your skills",
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          ClipRRect(
                            borderRadius: BorderRadius.circular(13),
                            child: Container(
                              // padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.deepOrangeAccent,
                                borderRadius: BorderRadius.circular(13),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 17),
                                    blurRadius: 17,
                                    spreadRadius: -23,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              add(user: widget.user)),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      children: <Widget>[
                                        Spacer(),
                                        // SvgPicture.asset(svgSrc),
                                        Spacer(),
                                        Text("Add any job you are looking for ",
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(13),
                            child: Container(
                              // padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.deepOrangeAccent,
                                borderRadius: BorderRadius.circular(13),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 17),
                                    blurRadius: 17,
                                    spreadRadius: -23,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CreateProject(user: widget.user
                                                  //    pro: widget.pro,
                                                  )),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      children: <Widget>[
                                        Spacer(),
                                        // SvgPicture.asset(svgSrc),
                                        Spacer(),
                                        Text("add a new work",
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(13),
                            child: Container(
                              // padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.deepOrangeAccent,
                                borderRadius: BorderRadius.circular(13),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 17),
                                    blurRadius: 17,
                                    spreadRadius: -23,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              searg(user: widget.user)),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      children: <Widget>[
                                        Spacer(),
                                        // SvgPicture.asset(svgSrc),
                                        Spacer(),
                                        Text("people looking for work ",
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          //   CategoryCard(
                          //    title: "Creat Project",
                          //    svgSrc: "assets/icons/yoga.svg",
                          /*  press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Dashboard(user: widget.user
                                          //    pro: widget.pro,
                                          )),
                            );
                          },*/
                          //   ),
                          /*   selected == 0
                            ? 
                  
                            
                            
                       
                            : selected == 1
                                ?   Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Dashboard(user: widget.user
                              //    pro: widget.pro,
                              )),
                );
                            
                                : selected == 2
                                    ?  Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Dashboard(user: widget.user
                              //    pro: widget.pro,
                              )),
                );
                            
                                    : selected == 3
                                        ?   Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Dashboard(user: widget.user
                              //    pro: widget.pro,
                              )),
                );
                            
                                        : Builder(builder: (context) {
                                            return FilterNetworkListPage(
                                                user: widget.user);
                                          }),*/
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

  getselect() {
    selected == 0
        ? Center(child: Dashboard(user: widget.user))
        : selected == 1
            ? RequestsPage(user: widget.user)
            : selected == 2
                ? Center(
                    child: CreateProject(user: widget.user),
                  )
                : selected == 3
                    ? Center(
                        child: FilterNetworkListPage(user: widget.user),
                      )
                    : Builder(builder: (context) {
                        return FilterNetworkListPage(user: widget.user);
                      });
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
