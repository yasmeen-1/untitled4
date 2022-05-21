import 'dart:convert';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled4/config/routing.dart';
import 'package:untitled4/logins/login_page.dart';
import 'package:untitled4/logins/register.dart';
import 'package:untitled4/models/users.dart';
import 'package:untitled4/pages/email.dart';
import 'package:untitled4/pages/homepage.dart';
import 'package:untitled4/shared_components/colors.dart';
import 'package:untitled4/shared_components/style.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/assets_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'package:iconly/iconly.dart';
import 'package:untitled4/config/routing.dart';
import 'package:untitled4/models/apply.dart';
import 'package:untitled4/models/pro.dart';
import 'package:untitled4/models/users.dart';
import 'package:untitled4/pages/MyInfor.dart';
import 'package:untitled4/pages/my_info.dart';
import 'package:untitled4/pages/profile.dart';
import 'package:untitled4/pages/profileapplay.dart';

import '../shared_components/colors.dart';
import 'homepage.dart';

class ViewAppliedUsers extends StatefulWidget {
  const ViewAppliedUsers({Key? key, required this.id, required this.user})
      : super(key: key);
  final String id;
  final User user;

  @override
  _ViewAppliedUsersState createState() => _ViewAppliedUsersState();
}

class _ViewAppliedUsersState extends State<ViewAppliedUsers> {
  List<ProjectApplies> projects = [];
  List<User> users = [];
  late final Pro pro;
  @override
  void initState() {
    getApplies();
    print(projects.length);
    // TODO: implement initState
    super.initState();
  }

  double rate = 1.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.deepOrangeAccent,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Applied Users'),
      ),
      body: FutureBuilder(
          future: getApplies(),
          builder: (context, snapshot) {
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
                            color: const Color(0xFFF5CEB8).withOpacity(00.3),
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
                                            /*   InkWell(
                                              onTap: () {
                                                /*     pro.idusers = projects[index]
                                                    .userName
                                                    .toString();
*/
                                                /*  Navigator.of(context).push(
                                                    Routing().createRoute(
                                                        profileapplay(
                                                  user: widget.pro,
                                                  rate: rate,
                                                )));*/

                                                //     build(context)
/*
                                                showDialog(
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
                                                              .idusers
                                                              .toString()),
                                                          Text(projects[index]
                                                              .idprojects
                                                              .toString()),
                                                          Text(projects[index]
                                                              .idprojectsApplies
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

                                                /*    String username =
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
                                                  setState(() {});
                                                  if (value.body
                                                          .contains('error') ||
                                                      value.body
                                                          .contains('Error')) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                            const SnackBar(
                                                                content: Text(
                                                                    'wrong email')));
                                                  } else {
                                                    Record records =
                                                        Record.fromJson(
                                                            jsonDecode(
                                                                value.body));
                                                    print(value.body);
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (c) =>
                                                                LoginPage()));
                                                  }
                                                });*/
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (c) =>
                                                            LoginPage()));
                                              
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
                        },  ),*/
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
                                                String username =
                                                    projects[index]
                                                        .userName
                                                        .toString();

                                                http.get(
                                                    Uri.parse(
                                                        'http://192.168.1.78/api_dev/api_dev/pro/login.php?email=' +
                                                            username),
                                                    headers: {
                                                      'Content-Type':
                                                          'application/json'
                                                    }).then((value) {
                                                  setState(() {
                                                    //   loading = false;
                                                  });
                                                  if (value.body
                                                          .contains('error') ||
                                                      value.body
                                                          .contains('Error')) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                            const SnackBar(
                                                                content: Text(
                                                                    'wrong email or password')));
                                                  } else {
                                                    Record records =
                                                        Record.fromJson(
                                                            jsonDecode(
                                                                value.body));

                                                    print(value.body);
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (c) => profileapplay(
                                                                rate: projects[
                                                                        index]
                                                                    .userRate,
                                                                user: records
                                                                    .records!
                                                                    .elementAt(
                                                                        0))));
                                                  }
                                                }).onError((error, stackTrace) {
                                                  setState(() {
                                                    //  loading = false;
                                                    print(error);
                                                  });
                                                });
                                              },
                                            ),
                                          ]),
                                    ),
                                    Builder(builder: (context) {
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
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (c) => EmailSender(
                                                            text: widget
                                                                .user.email
                                                                .toString(),
                                                            id: projects[index]
                                                                .projectName)));
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
        users = records.records!.cast<User>();
      });
      print(projects.length);
    });
    return 'steve';
  }
}
