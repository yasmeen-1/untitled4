import 'dart:convert';
import 'dart:io';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:untitled4/config/routing.dart';
import 'package:untitled4/logins/login_page.dart';
import 'package:untitled4/models/rate.dart';
import 'package:untitled4/pages/add.dart';
import 'package:untitled4/pages/create_project.dart';
import 'package:untitled4/pages/dashboard.dart';
import 'package:untitled4/pages/my_info.dart';
import 'package:untitled4/pages/my_projects.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled4/pages/mywork.dart';
import 'package:untitled4/shared_components/colors.dart';
import 'package:untitled4/shared_components/style.dart';

import '../models/pro.dart';
import '../models/users.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key, required this.user, this.rate, this.number})
      : super(key: key);
  final User user;
  final rate, number;
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String rate = '';
  String number = '';
  String image = '';
  late final Pro pro;
  int textLength = 0;
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    getRate();
    getImage();

    super.initState();
  }

  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String username = widget.user.fullname.toString();
    final Color green = Colors_().primary;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(username.toString()),
        elevation: 0,
        backgroundColor: green,
        leading: IconButton(
          icon: Icon(Icons.logout),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (c) => LoginPage()));
          },
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
                                      storeImage();
                                      getImage();
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
                            Text(
                              'pepole rating ',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              number,
                              style: TextStyle(color: Colors.white),
                            )
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
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text(
                                            'Edit Bio ',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14),
                                          ),
                                          content: TextFormField(
                                            textInputAction:
                                                TextInputAction.done,
                                            controller: controller,
                                            onChanged: (value) {
                                              setState(() {
                                                textLength = value.length;
                                              });
                                            },
                                            keyboardType:
                                                TextInputType.emailAddress,
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
                                              hintText: 'Bio:',
                                              hintStyle: MyStyles().hintText,
                                              contentPadding:
                                                  const EdgeInsets.fromLTRB(
                                                      20.0, 15.0, 20.0, 15.0),
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0)),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                borderSide: BorderSide(
                                                    color: Colors.grey[900]!,
                                                    width: 1.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                borderSide: const BorderSide(
                                                    color: Colors.grey,
                                                    width: 1.0),
                                              ),
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Save'),
                                            )
                                          ],
                                          semanticLabel: 'asda',
                                        );
                                      },
                                    );
                                  },
                                  child: Icon(Icons.add),
                                ),
                                Text(
                                    widget.user.Bio.toString() == ''
                                        ? controller.text
                                        : widget.user.Bio.toString(),
                                    style: TextStyle(color: Colors.white)),
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
                          Navigator.of(context).push(
                              Routing().createRoute(MyInfo(user: widget.user)));
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
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (c) => add(
                                      user: widget.user,
                                    )));
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.show_chart,
                                color: Colors.grey,
                              ),
                              Text(
                                'Add a post',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(Routing()
                              .createRoute(MyProjects(user: widget.user)));
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Dashboard(
                                      user: widget.user,
                                      // fet: fet,
                                      //rate: rate,
                                      // rate = rate,
                                    )),
                          );
                        },
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            Text('search work')
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => mywork(
                                      user: widget.user,
                                      //fet: fet,
                                      //rate: rate,
                                      // rate = rate,
                                    )),
                          );
                        },
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.view_agenda,
                              color: Colors.grey,
                            ),
                            Text('My post')
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateProject(
                                      user: widget.user,
                                      //fet: fet,
                                      //rate: rate,
                                      // rate = rate,
                                    )),
                          );
                        },
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.add,
                              color: Colors.grey,
                            ),
                            Text('add work')
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

  storeImage() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (file != null) {
      prefs.setString('test_image', file.path);
    } else {
      prefs.setString('test_image', 'images/man.jpg');
    }
  }

  getImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      image = prefs.getString('test_image').toString();
    });
  }

  Future<double> getRate() async {
    http
        .get(Uri.parse(
            'http://192.168.1.78/api_dev/api_dev/users/user_rate.php?idusers=' +
                widget.user.idusers.toString()))
        .then((value) {
      print(value.body);
      RateRecord record = RateRecord.fromJson(jsonDecode(value.body));
      print(record.records!.elementAt(0).nbUsersRate.toString());
      setState(() {
        number = record.records!.elementAt(0).nbUsersRate.toString();
      });
    });
    return 1.0;
  }
}



/*


import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String url =
      'https://static.independent.co.uk/s3fs-public/thumbnails/image/2018/09/04/15/lionel-messi-0.jpg?';
  final Color green = Color.fromARGB(255, 211, 10, 80);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
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
      body: Column(
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
                            'Familiar',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            '12',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fill, image: NetworkImage(url))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Following',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            '18',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "ID: 14552566",
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 32),
                  child: Text(
                    'Herman Jimenez',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.group_add,
                            color: Colors.white,
                          ),
                          Text(
                            'Friends',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.group,
                            color: Colors.white,
                          ),
                          Text(
                            'Groups',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.videocam,
                            color: Colors.white,
                          ),
                          Text(
                            'Videos',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.favorite,
                            color: Colors.white,
                          ),
                          Text(
                            'Likes',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )
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
                    Column(
                      children: <Widget>[
                        Icon(
                          Icons.table_chart,
                          color: Colors.grey,
                        ),
                        Text(
                          'Leaders',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(
                          Icons.show_chart,
                          color: Colors.grey,
                        ),
                        Text(
                          'Level up',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(
                          Icons.card_giftcard,
                          color: Colors.grey,
                        ),
                        Text(
                          'Leaders',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Icon(
                          Icons.code,
                          color: Colors.grey,
                        ),
                        Text('QR code')
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(
                          Icons.blur_circular,
                          color: Colors.grey,
                        ),
                        Text('Daily bonus')
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(
                          Icons.visibility,
                          color: Colors.grey,
                        ),
                        Text('Visitors')
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
*/