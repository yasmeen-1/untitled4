import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:iconly/iconly.dart';
import 'package:untitled4/models/apply.dart';
import 'package:untitled4/pages/profile.dart';

import '../models/users.dart';
import '../shared_components/colors.dart';

class RequestsPage extends StatefulWidget {
  const RequestsPage({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  _RequestsPageState createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  List<ProjectApplies> projects = [];

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
      //Container(),

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
                "  The works that you have applied",
                style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 10,
                    color: Colors.black),
              )
            ],
          ),
        ]),
        backgroundColor: Colors.deepOrangeAccent,
        foregroundColor: Color(0xFFF5CEB8),
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
/*
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Profile(user: widget.user, rate: rate, number: number
                              //    pro: widget.pro,
                              )),
                );*/
              },
              icon: Icon(Icons.person)),
          IconButton(
              onPressed: () {
                exit(0);
              },
              icon: Icon(Icons.exit_to_app)),
        ],
      ),
      body: FutureBuilder(
          future: getApplies(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: projects.length,
                itemBuilder: (BuildContext context, int index) {
                  if (projects.elementAt(index).idusers.toString() ==
                      widget.user.idusers.toString()) {
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
                                            )
                                          ]),
                                    ),
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
                    return Container();
                  }
                },
              );
            } else {
              return const CircularProgressIndicator();
            }
          }),
    ));
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
      });
      print(projects.length);
    });
    return 'steve';
  }
}
