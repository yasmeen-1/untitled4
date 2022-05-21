import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:untitled4/constants/ussapi.dart';
import 'package:untitled4/models/apply.dart';
import 'package:untitled4/models/projects.dart';
import 'package:untitled4/pages/MyInfor.dart';
import 'package:untitled4/pages/email.dart';
import 'package:untitled4/pages/profileapplay.dart';
import 'package:untitled4/shared_components/colors.dart';
import 'package:http/http.dart' as http;
import 'package:untitled4/models/USS.dart';
import 'package:untitled4/SearchWidget.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:iconly/iconly.dart';
import 'package:untitled4/models/USS.dart';

import '../models/users.dart';
import '../shared_components/colors.dart';
import 'package:path/path.dart';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'package:iconly/iconly.dart';
import 'package:untitled4/config/routing.dart';
import 'package:untitled4/models/apply.dart';
import 'package:untitled4/models/users.dart';
import 'package:untitled4/pages/MyInfor.dart';
import 'package:untitled4/pages/my_info.dart';
import 'package:untitled4/pages/profile.dart';
import 'package:untitled4/pages/profileapplay.dart';

import '../shared_components/colors.dart';

class ViewAppliedUser extends StatefulWidget {
  const ViewAppliedUser({
    Key? key,
    required this.id,
    required this.user,
  }) : super(key: key);
  final String id;
  final User user;

  @override
  _ViewAppliedUserState createState() => _ViewAppliedUserState();
}

class _ViewAppliedUserState extends State<ViewAppliedUser> {
  List<ProjectApplies> projects = [];
  List<User> users = [];
  // late final User fet;
  @override
  void initState() {
    getApplies();
    print(projects.length);
    // TODO: implement initState
    super.initState();
  }

  int maxi = 0;
  double rate = 1.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Applied Users'),
      ),
      body: FutureBuilder(
          future: getApplies(),
          builder: (context, snapshot) {
            //   widget.x.idusers = widget.user.idusers;

            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: projects.length,
                itemBuilder: (BuildContext context, int index) {
                  if (projects.elementAt(index).idprojects.toString() ==
                      widget.id.toString()) {
                    //  if(true){
                    //  for (var i = 5; i > 1; i--) {
                    //   if (projects[index].userRate.toString() == i.toString()) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width - 30,
                        decoration: BoxDecoration(
                            color: const Color(0xff90bafe).withOpacity(00.3),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(14))),
                        child: Column(
                          children: [
                            Column(children: [
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            IconlyBroken.activity,
                                            color: Colors_().primary,
                                          ),
                                          const SizedBox(
                                            width: 12,
                                          ),
                                          Text(
                                            projects[index].projectName!,
                                            // widget.user.cvFile.toString(),
                                            style: const TextStyle(
                                                color: Colors.black),
                                          )
                                        ]),
                                  ),
                                  const SizedBox(
                                    width: 24,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            IconlyBroken.activity,
                                            color: Colors_().primary,
                                          ),
                                          const SizedBox(
                                            width: 12,
                                          ),
                                          Text(
                                            projects[index].userRate!,
                                            // widget.user.cvFile.toString(),
                                            style: const TextStyle(
                                                color: Colors.black),
                                          )
                                        ]),
                                  ),
                                  const SizedBox(
                                    width: 24,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              IconlyBroken.user_3,
                                              color: Colors_().primary,
                                            ),
                                            const SizedBox(
                                              width: 12,
                                            ),
                                            Text(
                                              projects[index].userName!,
                                              style: const TextStyle(
                                                  color: Colors.black),
                                            )
                                          ]),
                                    ),
                                  ]),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              IconlyBroken.info_circle,
                                              color: Colors_().primary,
                                            ),
                                            const SizedBox(
                                              width: 12,
                                            ),
                                            Text(
                                              projects[index]
                                                          .statusName
                                                          .toString() ==
                                                      "null"
                                                  ? 'Pending...'
                                                  : projects[index]
                                                              .statusName
                                                              .toString() ==
                                                          ''
                                                      ? 'Pending'
                                                      : projects[index]
                                                          .statusName
                                                          .toString(),
                                              style: const TextStyle(
                                                  color: Colors.black),
                                            ),
                                            InkWell(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: const Text(
                                                  'view information',
                                                  style: TextStyle(
                                                      color: Colors
                                                          .deepOrangeAccent),
                                                ),
                                              ),
                                              onTap: () {
                                                /*  String username =
                                                    projects[index]
                                                        .userName
                                                        .toString();
                                                http.get(
                                                    Uri.parse(
                                                        'http://192.168.1.78/api_dev/api_dev/Pro/login.php?email=' +
                                                            username),
                                                    headers: {
                                                      'Content-Type':
                                                          'application/json'
                                                    }).then((value) {
                                                  print(value.body);
                                                  print(value.statusCode);
                                                  if (value.body
                                                      .contains('Error')) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                            const SnackBar(
                                                                content: Text(
                                                                    'Error, please try again')));
                                                    Navigator.of(context).pop();
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                            const SnackBar(
                                                                content: Text(
                                                                    'Applied, show in next tab')));
                                                    Navigator.of(context).push(
                                                        Routing().createRoute(
                                                            LoginPage(
                                                                //   user: widget.pro,
                                                                //   rate: rate,
                                                                )));
                                                  }
                                                });*/
                                              },
                                            ),
                                          ]),
                                    ),
                                    Builder(builder: (context) {
                                      //   widget.user.idusers=x.idusers;

                                      if (projects[index].idstatus.toString() ==
                                          '1') {
                                        return Column(children: [
                                          InkWell(
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title: Text('Rate ' +
                                                          projects[index]
                                                              .projectName
                                                              .toString()),
                                                      content:
                                                          RatingBar.builder(
                                                        initialRating: 1,
                                                        minRating: 1,
                                                        direction:
                                                            Axis.horizontal,
                                                        allowHalfRating: true,
                                                        unratedColor: Colors
                                                            .amber
                                                            .withAlpha(50),
                                                        itemCount: 5,
                                                        itemSize: 25.0,
                                                        itemPadding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    4.0),
                                                        itemBuilder:
                                                            (context, _) =>
                                                                Icon(
                                                          Icons.star,
                                                          color: Colors.amber,
                                                        ),
                                                        onRatingUpdate:
                                                            (rating) {
                                                          setState(() {
                                                            rate = rating;
                                                          });
                                                        },
                                                        updateOnDrag: true,
                                                      ),
                                                      actions: [
                                                        InkWell(
                                                          onTap: () {
                                                            updateRate(projects[
                                                                index]);
                                                            print(rate);
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: const Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Text('Rate'),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child:
                                                                Text('Cancel'),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                      child: const Padding(
                                                        padding: EdgeInsets.all(
                                                            12.0),
                                                        child: Text(
                                                          "Rate",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color:
                                                              Colors.green))))
                                        ]);
                                      } else {
                                        return Container();
                                      }
                                    }),
                                    Builder(builder: (context) {
                                      if (projects[index]
                                                  .statusName
                                                  .toString() ==
                                              'null' ||
                                          projects[index]
                                              .statusName
                                              .toString()
                                              .isEmpty) {
                                        return Column(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                update(projects[index]);
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(12.0),
                                                    child: Text(
                                                      "Accept",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      color: Colors_().primary),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 12,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                reject(projects[index]);
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(12.0),
                                                    child: Text(
                                                      "Reject",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      color: Colors.redAccent),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      } else {
                                        return Container();
                                      }
                                    }),
                                  ])
                            ]),
                            const SizedBox(
                              height: 24,
                            )
                          ],
                        ),
                      ),
                    );
                    //   }
                    //  }
                  } else {
                    return Container(
                        //        child: Text('asd'),
                        );
                  }
                },
              );
            } else {
              return const CircularProgressIndicator();
            }
          }),
    ));
  }

  update(ProjectApplies apply) {
    http
        .get(Uri.parse(
            'http://192.168.1.78/api_dev/api_dev/projectsapplies/update.php?idprojects_applies=' +
                apply.idprojectsApplies.toString() +
                '&idprojects=' +
                apply.idprojects.toString() +
                '&idusers=' +
                apply.idusers.toString() +
                '&idstatus=1'))
        .then((value) {});
  }

  reject(ProjectApplies apply) {
    http
        .get(Uri.parse(
            'http://192.168.1.78/api_dev/api_dev/projectsapplies/update.php?idprojects_applies=' +
                apply.idprojectsApplies.toString() +
                '&idprojects=' +
                apply.idprojects.toString() +
                '&idusers=' +
                apply.idusers.toString() +
                '&idstatus=2'))
        .then((value) {});
  }

  updateRate(ProjectApplies apply) {
    http
        .get(Uri.parse(
            'http://192.168.1.78/api_dev/api_dev/projectsapplies/update.php?idprojects_applies=' +
                apply.idprojectsApplies.toString() +
                '&idprojects=' +
                apply.idprojects.toString() +
                '&idusers=' +
                apply.idusers.toString() +
                '&idstatus=1&user_rate=' +
                rate.toString()))
        .then((value) {});
  }

  Future<String> getApplies() async {
    http
        .get(Uri.parse(
            'http://192.168.1.78/api_dev/api_dev/projectsapplies/read.php'))
        .then((value) {
      String body = value.body;
      ApplyRecords records = ApplyRecords.fromJson(jsonDecode(body));
      setState(() {
        projects = records.records!;
        // users = records.records!.cast<User>();
      });
      print(projects.length);
    });
    return 'steve';
  }
}


/*
class ViewAppliedUser extends StatefulWidget {




  @override
  ViewAppliedUserState createState() => ViewAppliedUserState();
  const ViewAppliedUser({
    Key? key,
    required this.user,
    required this.id,
  }) : super(key: key);
  final User user;
  final String id;
}

class ViewAppliedUserState extends State<ViewAppliedUser> {
  //List<USS> USSs = [];
  bool isPressed = false;
  String query = '';
  late String a, b, c, d, e, f;
  Timer? debouncer;
  bool tr = false;
  int x1 = 1;
  List<ProjectApplies> projects = [];
  late final User fet;

  @override
  void initState() {
    getApplies();
    super.initState();
    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    // ignore: non_constant_identifier_names
    final USSs = await Ussapi.getapplyrate(query);

    setState(() => this.projects = USSs);
  }

  double rate = 1.0;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar:
            //Container(),

            AppBar(
          title: buildSearch(),
          //     leading: buildSearch(),
          /*    leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),*/
          leading: Container(),
          leadingWidth: 0,
          shadowColor: Colors.deepOrangeAccent,
          elevation: 10,
          backgroundColor: Colors.deepOrangeAccent,
          brightness: Brightness.dark,
        ),
        body: FutureBuilder(
            future: getApplies(),
            builder: (context, snapshot) {
              fet.idusers = widget.user.idusers;

              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: projects.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (projects.elementAt(index).idprojects.toString() ==
                        widget.id.toString()) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width - 30,
                          decoration: BoxDecoration(
                              color: const Color(0xff90bafe).withOpacity(00.3),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(14))),
                          child: Column(
                            children: [
                              Column(children: [
                                const SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              IconlyBroken.activity,
                                              color: Colors_().primary,
                                            ),
                                            const SizedBox(
                                              width: 12,
                                            ),
                                            Text(
                                              projects[index].projectName!,
                                              // widget.user.cvFile.toString(),
                                              style: const TextStyle(
                                                  color: Colors.black),
                                            )
                                          ]),
                                    ),
                                    const SizedBox(
                                      width: 24,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              IconlyBroken.activity,
                                              color: Colors_().primary,
                                            ),
                                            const SizedBox(
                                              width: 12,
                                            ),
                                            Text(
                                              projects[index].userRate!,
                                              // widget.user.cvFile.toString(),
                                              style: const TextStyle(
                                                  color: Colors.black),
                                            )
                                          ]),
                                    ),
                                    const SizedBox(
                                      width: 24,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                IconlyBroken.user_3,
                                                color: Colors_().primary,
                                              ),
                                              const SizedBox(
                                                width: 12,
                                              ),
                                              Text(
                                                projects[index].userName!,
                                                style: const TextStyle(
                                                    color: Colors.black),
                                              )
                                            ]),
                                      ),
                                    ]),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                IconlyBroken.info_circle,
                                                color: Colors_().primary,
                                              ),
                                              const SizedBox(
                                                width: 12,
                                              ),
                                              Text(
                                                projects[index]
                                                            .statusName
                                                            .toString() ==
                                                        "null"
                                                    ? 'Pending...'
                                                    : projects[index]
                                                                .statusName
                                                                .toString() ==
                                                            ''
                                                        ? 'Pending'
                                                        : projects[index]
                                                            .statusName
                                                            .toString(),
                                                style: const TextStyle(
                                                    color: Colors.black),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  //     build(context)

                                                  widget.user.idusers =
                                                      projects[index].idusers;

                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            MyInfor(
                                                              user: widget.user,
                                                              fet: fet,
                                                              //rate: rate,
                                                              // rate = rate,
                                                            )),
                                                  );

                                                  /*    showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title: Text('cv file : '),
                                                      content: Column(
                                                        children: [
                                                          //  Text(book.companyName),
                                                          // Text(book.),
                                                          Text(projects[index]
                                                              .userName
                                                              .toString()),
                                                          Text(projects[index]
                                                              .userRate
                                                              .toString()),
                                                        ],
                                                        //   x1=x1+1;
                                                      ),
                                                      actions: [
                                                        InkWell(
                                                          child: const Text(
                                                              'Cancel'),
                                                          onTap: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                        ),
                                                        const SizedBox(
                                                          width: 22,
                                                        ),
                                                      ],
                                                      actionsPadding:
                                                          const EdgeInsets.all(
                                                              22),
                                                    );
                                                  },
                                                );*/
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(12.0),
                                                      child: Text(
                                                        "view information",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        color:
                                                            Colors_().primary),
                                                  ),
                                                ),
                                              ),
                                            ]),
                                      ),
                                      Builder(builder: (context) {
                                        if (projects[index]
                                                .idstatus
                                                .toString() ==
                                            '1') {
                                          return Column(children: [
                                            InkWell(
                                                onTap: () {
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        title: Text('Rate ' +
                                                            projects[index]
                                                                .projectName
                                                                .toString()),
                                                        content:
                                                            RatingBar.builder(
                                                          initialRating: 1,
                                                          minRating: 1,
                                                          direction:
                                                              Axis.horizontal,
                                                          allowHalfRating: true,
                                                          unratedColor: Colors
                                                              .amber
                                                              .withAlpha(50),
                                                          itemCount: 5,
                                                          itemSize: 25.0,
                                                          itemPadding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      4.0),
                                                          itemBuilder:
                                                              (context, _) =>
                                                                  Icon(
                                                            Icons.star,
                                                            color: Colors.amber,
                                                          ),
                                                          onRatingUpdate:
                                                              (rating) {
                                                            setState(() {
                                                              rate = rating;
                                                            });
                                                          },
                                                          updateOnDrag: true,
                                                        ),
                                                        actions: [
                                                          InkWell(
                                                            onTap: () {
                                                              updateRate(
                                                                  projects[
                                                                      index]);
                                                              print(rate);
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child:
                                                                const Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(8.0),
                                                              child:
                                                                  Text('Rate'),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Text(
                                                                  'Cancel'),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                                child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  12.0),
                                                          child: Text(
                                                            "Rate",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                            color:
                                                                Colors.green))))
                                          ]);
                                        } else {
                                          return Container();
                                        }
                                      }),
                                      Builder(builder: (context) {
                                        if (projects[index]
                                                    .statusName
                                                    .toString() ==
                                                'null' ||
                                            projects[index]
                                                .statusName
                                                .toString()
                                                .isEmpty) {
                                          return Column(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  update(projects[index]);
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(12.0),
                                                      child: Text(
                                                        "Accept",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        color:
                                                            Colors_().primary),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 12,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  reject(projects[index]);
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.all(12.0),
                                                      child: Text(
                                                        "Reject",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        color:
                                                            Colors.redAccent),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        } else {
                                          return Container();
                                        }
                                      }),
                                    ])
                              ]),
                              const SizedBox(
                                height: 24,
                              )
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Container(
                          //        child: Text('asd'),
                          );
                    }
                  },
                );
              } else {
                return const CircularProgressIndicator();
              }
            }),
      );

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'filter bu rate',
        onChanged: searchUSS,
      );

  Future searchUSS(String query) async => debounce(() async {
        final USSs = await Ussapi.getapplyrate(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.projects = USSs.cast<ProjectApplies>();
        });
      });

  update(ProjectApplies apply) {
    http
        .get(Uri.parse(
            'http://192.168.1.78/api_dev/api_dev/projectsapplies/update.php?idprojects_applies=' +
                apply.idprojectsApplies.toString() +
                '&idprojects=' +
                apply.idprojects.toString() +
                '&idusers=' +
                apply.idusers.toString() +
                '&idstatus=1'))
        .then((value) {});
  }

  reject(ProjectApplies apply) {
    http
        .get(Uri.parse(
            'http://192.168.1.78/api_dev/api_dev/projectsapplies/update.php?idprojects_applies=' +
                apply.idprojectsApplies.toString() +
                '&idprojects=' +
                apply.idprojects.toString() +
                '&idusers=' +
                apply.idusers.toString() +
                '&idstatus=2'))
        .then((value) {});
  }

  updateRate(ProjectApplies apply) {
    http
        .get(Uri.parse(
            'http://192.168.1.78/api_dev/api_dev/projectsapplies/update.php?idprojects_applies=' +
                apply.idprojectsApplies.toString() +
                '&idprojects=' +
                apply.idprojects.toString() +
                '&idusers=' +
                apply.idusers.toString() +
                '&idstatus=1&user_rate=' +
                rate.toString()))
        .then((value) {});
  }

  Future<String> getApplies() async {
    http
        .get(Uri.parse(
            'http://192.168.1.78/api_dev/api_dev/projectsapplies/read.php'))
        .then((value) {
      String body = value.body;
      ApplyRecords records = ApplyRecords.fromJson(jsonDecode(body));
      setState(() {
        projects = records.records!;
        // users = records.records!.cast<User>();
      });
      print(projects.length);
    });

    return 'steve';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('f', f));
  }
}
*/