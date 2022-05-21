import 'dart:convert';
import 'dart:io';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:untitled4/config/routing.dart';
import 'package:untitled4/logins/login_page.dart';
import 'package:untitled4/models/pro.dart';
import 'package:untitled4/models/rate.dart';
import 'package:untitled4/pages/FilterNetworkListPage.dart';
import 'package:untitled4/pages/MyInfor.dart';
import 'package:untitled4/pages/create_project.dart';
import 'package:untitled4/pages/my_info.dart';
import 'package:untitled4/pages/my_projects.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/users.dart';

class profileapplays extends StatefulWidget {
  const profileapplays({Key? key, required this.user}) : super(key: key);
  final Pro user;

  @override
  _profileapplaysState createState() => _profileapplaysState();
}

class _profileapplaysState extends State<profileapplays> {
  String image = "";
  @override
  void initState() {
    // getImage1();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String username = widget.user.fullname.toString();
    final Color green = Colors.deepOrangeAccent;

    return SafeArea(
        child: Scaffold(
      //   backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(username.toString()),
        elevation: 0,
        backgroundColor: green,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 16),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                color: green,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(32),
                    bottomLeft: Radius.circular(32)),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'work added',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              '12',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      /*   Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fill, image: NetworkImage(url))),
                    ),
*/

                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            color: green,
                            borderRadius: BorderRadius.circular(22)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 14),
                                child: Hero(
                                  tag: 'tag',
                                  child: InkWell(
                                    onTap: () {
                                      //    storeImage();
                                      //    getImage();
                                      /* widget.user.profile_image.toString() == ''
                                          ? image.text
                                          : widget.user.profile_image.toString(),*/
                                    },
                                    child: Builder(builder: (context) {
                                      return CircleAvatar(
                                          radius: 40,
                                          foregroundImage:
                                              FileImage(File(image)));
                                    }),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      /////////////
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Column(
                          children: <Widget>[
                            /*
                            Text(
                              'pepole rating ',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              number,
                              style: TextStyle(color: Colors.white),
                            )*/
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      widget.user.fullname.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    // width: 20,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: green, borderRadius: BorderRadius.circular(22)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 32),
                      child: Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Container(
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Center(
                                      //  child: Icon(Icons.star),
                                      ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.amber,
                                ),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 22, top: 16, bottom: 16),
                              child: Builder(builder: (context) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FutureBuilder(
                                        // future: getImage(),
                                        builder: (cont, ext) {
                                      return Row(
                                          /*  children: [
                                          RatingBar.builder(
                                            initialRating: widget.rate == 'nul'
                                                ? 1
                                                : double.parse(widget.rate),
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            unratedColor:
                                                Colors.amber.withAlpha(50),
                                            itemCount: 5,
                                            itemSize: 15.0,
                                            itemPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 4.0),
                                            itemBuilder: (context, _) =>
                                                const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {},
                                            ignoreGestures: true,
                                            updateOnDrag: false,
                                          ),
                                          Text('(' + number + ')')
                                        ],*/
                                          );
                                    })
                                  ],
                                );
                              }))
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    //////////////
                    padding: const EdgeInsets.only(left: 2, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Icon(
                              Icons.biotech,
                              color: Colors.white,
                            ),
                            Text(
                              'Bio:  ',
                              style: TextStyle(color: Colors.white),
                            ),
                            Row(
                              children: [
                                Text(widget.user.Bio.toString(),
                                    style: TextStyle(color: Colors.black)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 3,
              padding: EdgeInsets.all(42),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(Routing()
                              .createRoute(MyInfor(user: widget.user)));
                        },
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.table_chart,
                              color: Colors.grey,
                            ),
                            Text(
                              'my information',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            _sendingSMS();
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.show_chart,
                                color: Colors.grey,
                              ),
                              Text(
                                'send massage',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                      InkWell(
                        onTap: () {
                          /*   Navigator.of(context).push(Routing()
                              .createRoute(MyProjects(user: widget.user)));*/
                        },
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.card_giftcard,
                              color: Colors.grey,
                            ),
                            Text(
                              'my work',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          String email = widget.user.email.toString();
                          _sendingMails();
                        },
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.email,
                              color: Colors.grey,
                            ),
                            Text('sending email')
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.blur_circular,
                              color: Colors.grey,
                            ),
                            Text('all op')
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _sendingcall();
                        },
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.call,
                              color: Colors.grey,
                            ),
                            Text('Call')
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],

///////////////////////////////////////////////
          ///
          ///

          /*   children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 25, 40, 40),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      setState(() {
                        image = prefs.getString('test_image').toString();
                      });
                      print(image);
                    },
                    child: Row(
                      children: const [
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Information',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 14),
                            child: Hero(
                              tag: 'tag',
                              child: InkWell(
                                onTap: () {
                                  storeImage();
                                  getImage();
                                  /* widget.user.profile_image.toString() == ''
                                          ? image.text
                                          : widget.user.profile_image.toString(),*/
                                },
                                child: Builder(builder: (context) {
                                  return CircleAvatar(
                                      radius: 32,
                                      foregroundImage: FileImage(File(image)));
                                }),
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 22, top: 16, bottom: 16),
                              child: Builder(builder: (context) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Builder(builder: (context) {
                                      return Text(
                                        username,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w900),
                                      );
                                    }),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      username,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                );
                              }))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(left: 14),
                              child: Container(
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Icon(Icons.star),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.amber,
                                ),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 22, top: 16, bottom: 16),
                              child: Builder(builder: (context) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FutureBuilder(
                                        future: getImage(),
                                        builder: (cont, ext) {
                                          return Row(
                                            children: [
                                              RatingBar.builder(
                                                initialRating: widget.rate ==
                                                        'nul'
                                                    ? 1
                                                    : double.parse(widget.rate),
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                unratedColor:
                                                    Colors.amber.withAlpha(50),
                                                itemCount: 5,
                                                itemSize: 15.0,
                                                itemPadding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 4.0),
                                                itemBuilder: (context, _) =>
                                                    const Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                onRatingUpdate: (rating) {},
                                                ignoreGestures: true,
                                                updateOnDrag: false,
                                              ),
                                              Text('(' + number + ')')
                                            ],
                                          );
                                        })
                                  ],
                                );
                              }))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                          Routing().createRoute(MyInfo(user: widget.user)));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(left: 14),
                                child: Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Icon(Icons.info),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.indigo.withOpacity(0.2),
                                  ),
                                )),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(Routing()
                                    .createRoute(MyInfo(user: widget.user)));
                              },
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 22, top: 16, bottom: 16),
                                  child: FutureBuilder(
                                      builder: (context, snapshot) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'My Info',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    );
                                  })),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(Routing().createRoute(MyProjects(
                        user: widget.user,
                      )));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(left: 14),
                                child: Container(
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Icon(Icons.category),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.indigo.withOpacity(0.2),
                                  ),
                                )),
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 22, top: 16, bottom: 16),
                                child: Builder(builder: (context) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'My works',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  );
                                }))
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (c) => LoginPage()));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22)),
                      elevation: 1,
                      color: Colors.white,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: const [
                            Expanded(child: Text('Sign out')),
                            SizedBox(
                              width: 12,
                            ),
                            Icon(
                              Icons.logout,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                ],
              ),
            )
          ],*/
        ),
      ),
    ));
  }

/*
  storeImage1() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (file != null) {
      prefs.setString('test_image', file.path);
    } else {
      prefs.setString('test_image', 'images/man.jpg');
    }
  }

  getImage1() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      image = prefs.getString('test_image').toString();
    });
  }*/
  //String email=user.email.toString();
  _sendingMails() async {
    const url = 'mailto:kgkanassar17@gmail.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _sendingcall() async {
    const url = 'tell:0592983942';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _sendingSMS() async {
    const url = 'sms:0592983942';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
