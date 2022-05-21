import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:iconly/iconly.dart';
import 'package:untitled4/constants/ACCapi.dart';
import 'package:untitled4/constants/Bookapi.dart';
import 'package:untitled4/models/ACC.dart';
import 'package:untitled4/models/Book.dart';
import 'package:untitled4/models/pro.dart';
import 'package:untitled4/models/projects.dart';
import 'package:untitled4/pages/p.dart';
import 'package:untitled4/pages/profileapplay.dart';

import '../SearchWidget.dart';
import '../models/users.dart';
import '../shared_components/colors.dart';

class mywork1 extends StatefulWidget {
  @override
  mywork1PageState createState() => mywork1PageState();
  const mywork1({
    Key? key,
    required this.user,
  }) : super(key: key);
  final Pro user;
}

class mywork1PageState extends State<mywork1> {
  List<ACC> books = [];
  bool isPressed = false;
  String query = '';
  late String a, b, c, d, e, f;
  Timer? debouncer;
  bool tr = false;
  int x1 = 1;
  bool visible = true;
  @override
  void initState() {
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
    final books = await AccApi.getAcc(query);

    setState(() => this.books = books);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar:
          //Container(),

          AppBar(
        title: Text("My Post"),
        //  leading: buildSearch(),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        // leading: Container(),
        leadingWidth: 0,
        shadowColor: Colors.deepOrangeAccent,
        elevation: 10,
        backgroundColor: Colors.deepOrangeAccent,
        brightness: Brightness.dark,
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            //   future: getProjects(),
            initialData: searchBook(query),

            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              return ListView.builder(
                itemCount: books.length,
                itemBuilder: (BuildContext context, int index) {
                  if (books.elementAt(index).idusers.toString() ==
                      widget.user.idusers) {
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
                                        children: []),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      /*  InkWell(
                                        onTap: () {
                                          http.get(
                                              Uri.parse(
                                                  'http://192.168.1.78/api_dev/api_dev/pro/login1.php?idusers=' +
                                                      books[index].idusers.toString()),
                                              headers: {
                                                'Content-Type':
                                                    'application/json'
                                              }).then((value) {
                                            setState(() {
                                              //   loading = false;
                                            });
                                            if (value.body.contains('error') ||
                                                value.body.contains('Error')) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                      content: Text(
                                                          'wrong email or password')));
                                            } else {
                                              Record records = Record.fromJson(
                                                  jsonDecode(value.body));

                                              print(value.body);
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (c) =>
                                                          profileapplays(
                                                              //   rate:books[index].
                                                              //  rate: "1",
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

                                          /*  showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text('Apply for ' +
                                                    books[index]
                                                        .projectName
                                                        .toString() +
                                                    "?"),
                                                content: const Text(
                                                    'Are you sure you want to add this work to your work list?'),
                                                actions: [
                                                  InkWell(
                                                    child: const Text('Cancel'),
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                  const SizedBox(
                                                    width: 22,
                                                  ),
                                                  Visibility(
                                                    visible: visible,
                                                    child: InkWell(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(12.0),
                                                        child: const Text(
                                                          'Apply',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .deepOrangeAccent),
                                                        ),
                                                      ),
                                                      onTap: () {
                                                        String url =
                                                            'http://192.168.1.78/api_dev/api_dev/projectsapplies/create.php?idprojects=' +
                                                                books[index]
                                                                    .idprojects
                                                                    .toString() +
                                                                '&idusers=' +
                                                                widget.user
                                                                    .idusers
                                                                    .toString() +
                                                                '&user_rate=1';

                                                        http
                                                            .get(Uri.parse(url))
                                                            .then((value) {
                                                          print(value.body);
                                                          print(
                                                              value.statusCode);
                                                          if (value.body
                                                              .contains(
                                                                  'Error')) {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    const SnackBar(
                                                                        content:
                                                                            Text('Error, please try again')));
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          } else {
                                                            visible = false;
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    const SnackBar(
                                                                        content:
                                                                            Text('Applied, show in next tab')));
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          }
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ],
                                                actionsPadding:
                                                    const EdgeInsets.all(22),
                                              );
                                            },
                                          );*/
                                        },
                                        child: Container(
                                          child: Row(
                                            children: const [
                                              SizedBox(
                                                width: 22,
                                              ),
                                              Icon(Icons.person),
                                              SizedBox(
                                                width: 22,
                                              )
                                            ],
                                          ),
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color: Colors.deepOrangeAccent,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                      ),*/
                                      SizedBox(
                                        height: 10,
                                      ),
                                      /* InkWell(
                                        onTap: () {
                                          http.get(
                                              Uri.parse(
                                                  'http://192.168.1.78/api_dev/api_dev/pro/login1.php?idusers=' +
                                                      books[index].idusers),
                                              headers: {
                                                'Content-Type':
                                                    'application/json'
                                              }).then((value) {
                                            setState(() {
                                              //   loading = false;
                                            });
                                            if (value.body.contains('error') ||
                                                value.body.contains('Error')) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                      content: Text(
                                                          'wrong email or password')));
                                            } else {
                                              Record records = Record.fromJson(
                                                  jsonDecode(value.body));

                                              print(value.body);
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (c) =>
                                                          profileapplays(
                                                              //   rate:books[index].
                                                              //  rate: "1",
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
                                        child: Container(
                                          child: Row(
                                            children: const [
                                              SizedBox(
                                                width: 22,
                                              ),
                                              Icon(Icons.person),
                                              SizedBox(
                                                width: 22,
                                              )
                                            ],
                                          ),
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color: Colors.deepOrangeAccent,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                      ),*/
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 24,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const SizedBox(
                                height: 10,
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
                                            Text(
                                              "work description  :  ",
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color:
                                                      Colors.deepOrangeAccent),
                                            ),
                                            const SizedBox(
                                              width: 12,
                                            ),
                                            Text(
                                              books[index].projectDescription,
                                              style: const TextStyle(
                                                  color: Colors.black),
                                            )
                                          ]),
                                    )
                                  ]),
                              const SizedBox(
                                height: 10,
                              ),
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
            },
          ))

      /*  body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            // future: getbooks(),
            initialData: buildSearch(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: books.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (books.elementAt(index).idusers.toString() !=
                          widget.user.idusers) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 30,
                            decoration: BoxDecoration(
                                color:
                                    const Color(0xFFF5CEB8).withOpacity(00.3),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(14))),
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
                                                books[index].projectName!,
                                                style: const TextStyle(
                                                    color: Colors.black),
                                              )
                                            ]),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text('Apply for ' +
                                                        books[index]
                                                            .projectName
                                                            .toString() +
                                                        "?"),
                                                    content: const Text(
                                                        'Are you sure you want to add this project to your work list?'),
                                                    actions: [
                                                      InkWell(
                                                        child: const Text(
                                                            'Cancel'),
                                                        onTap: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                      const SizedBox(
                                                        width: 22,
                                                      ),
                                                      InkWell(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(12.0),
                                                          child: const Text(
                                                            'Apply',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .blue),
                                                          ),
                                                        ),
                                                        onTap: () {
                                                          String url =
                                                              'http://192.168.1.78/api_dev/api_dev/projectsapplies/create.php?idbooks=' +
                                                                  books[index]
                                                                      .idprojects
                                                                      .toString();

                                                          http
                                                              .get(Uri.parse(
                                                                  url))
                                                              .then((value) {
                                                            print(value.body);
                                                            print(value
                                                                .statusCode);
                                                            if (value.body
                                                                .contains(
                                                                    'Error')) {
                                                              ScaffoldMessenger
                                                                      .of(
                                                                          context)
                                                                  .showSnackBar(
                                                                      const SnackBar(
                                                                          content:
                                                                              Text('Error, please try again')));
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            } else {
                                                              ScaffoldMessenger
                                                                      .of(
                                                                          context)
                                                                  .showSnackBar(
                                                                      const SnackBar(
                                                                          content:
                                                                              Text('Applied, show in next tab')));
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            }
                                                          });
                                                        },
                                                      ),
                                                    ],
                                                    actionsPadding:
                                                        const EdgeInsets.all(
                                                            22),
                                                  );
                                                },
                                              );
                                            },
                                            child: Container(
                                              child: Row(
                                                children: const [
                                                  SizedBox(
                                                    width: 22,
                                                  ),
                                                  Text(
                                                    'Apply',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  SizedBox(
                                                    width: 22,
                                                  )
                                                ],
                                              ),
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  color: Colors_().primary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                            ),
                                          ),
                                        ],
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
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
                                                  IconlyBroken.category,
                                                  color: Colors_().primary,
                                                ),
                                                const SizedBox(
                                                  width: 12,
                                                ),
                                                Text(
                                                  books[index].price!,
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                )
                                              ]),
                                        )
                                      ]),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
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
                                                  IconlyBroken.time_circle,
                                                  color: Colors_().primary,
                                                ),
                                                const SizedBox(
                                                  width: 12,
                                                ),
                                                Text(
                                                  books[index]
                                                                  .projectDate
                                                                  .toString() ==
                                                              "null" ||
                                                          books[index]
                                                                  .projectDate
                                                                  .toString() ==
                                                              ""
                                                      ? "not set"
                                                      : books[index]
                                                          .projectDate
                                                          .toString(),
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                )
                                              ]),
                                        )
                                      ])
                                ]),
                                const SizedBox(
                                  height: 24,
                                )
                              ],
                            ),
                          ),
                        );
                      }
                      ;
                    });
              } else {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              }
            },
          ))*/

      ////////////////////

      );

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'username',
        onChanged: searchBook,
      );

  Future searchBook(String query) async => debounce(() async {
        // query = widget.user.sp.toString();
        final books = await AccApi.getAcc(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.books = books.cast<ACC>();
        });
      });
/*
  Widget buildBook(Book book, BuildContext context) => ListTile(
        /*   leading: Image.network(
          book.urlImage,
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        ),*/
        title: Text((x1).toString()),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Apply for ' +
                          books[x1].projectName.toString() +
                          "?"),
                      content: const Text(
                          'Are you sure you want to add this work to your work list?'),
                      actions: [
                        InkWell(
                          child: const Text('Cancel'),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        const SizedBox(
                          width: 22,
                        ),
                        InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: const Text(
                              'Apply',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                          onTap: () {
                            String url =
                                'http://192.168.1.78/api_dev/api_dev/booksapplies/create.php?';

                            http.get(Uri.parse(url)).then((value) {
                              print(value.body);
                              print(value.statusCode);
                              if (value.body.contains('Error')) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('Error, please try again')));
                                Navigator.of(context).pop();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('Applied, show in next tab')));
                                Navigator.of(context).pop();
                              }
                            });
                          },
                        ),
                      ],
                      actionsPadding: const EdgeInsets.all(22),
                    );
                  },
                );
              },
              child: Container(
                child: Row(
                  children: const [
                    SizedBox(
                      width: 22,
                    ),
                    Text(
                      'Apply',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 22,
                    )
                  ],
                ),
                height: 40,
                decoration: BoxDecoration(
                    color: Colors_().primary,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
        subtitle: Column(
          children: [
            //  Text(book.companyName),
            // Text(book.),
            Text(book.idspecialization),
            Text(book.price),
            Text(book.projectTypeWork),
            //  Text(book.maxNbUsers),
            Text(book.projectDate),
            Text(book.projectName),
          ],
          //   x1=x1+1;
        ),
      );*/
}
