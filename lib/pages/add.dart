import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/users.dart';
import '../shared_components/colors.dart';

class add extends StatefulWidget {
  const add({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  _addState createState() => _addState();
}

class _addState extends State<add> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1800, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  final _gender = [
    "Full Time",
    "part Time",
  ];

  final TextEditingController description = TextEditingController();

  @override
  void initState() {
    print(widget.user.idusers);
    super.initState();
  }

  @override
  void dispose() {
    description.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  bool loading = false;
  GlobalKey<FormState> key = GlobalKey();

  final GlobalKey<FormState> _key = GlobalKey();
  int textLength = 0;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: key,
          child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    Text(
                      'Add any job you are looking for ',
                      style: TextStyle(
                          fontSize: 22,
                          wordSpacing: 2,
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextFormField(
                    minLines: 20,
                    maxLines: 22,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Field Required';
                      } else {
                        return null;
                      }
                    },
                    controller: description,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFF5CEB8).withOpacity(0.2),
                      // prefixIcon: const Icon(Icons.info),
                      enabledBorder: const OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0.0),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      hintText:
                          "Write about your skills and experience and the nature of the job you would like to get!",
                    )),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(
                    top: 25, bottom: 25, right: 25, left: 25),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors_().primary1,
                      Colors_().primary,
                    ]),
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: InkWell(
                      onTap: () async {
                        if (key.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });

                          String projectDescription = description.text;

                          http
                              .get(Uri.parse(
                                  'http://192.168.1.78/api_dev/api_dev/project/create.php?project_description=' +
                                      projectDescription +
                                      '&idusers=' +
                                      widget.user.idusers.toString()))
                              .then((value) {
                            print(value.statusCode.toString());
                            if (value.body.contains('Error')) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Error, please try again')));
                            } else {
                              setState(() {
                                loading = false;
                                description.clear();
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Success')));
                            }
                          });
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: !loading
                            ? const Text(
                                "Complete your Creation",
                                style: TextStyle(
                                    fontFamily: 'Mulish', color: Colors.white),
                              )
                            : const CircularProgressIndicator(),
                      )),
                ),
              ),
            ]),
          ),
        ),
      ),
      backgroundColor: const Color(0xfff8fcff),
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
              onTap: () {},
            ),
            ListTile(
              title: Text("Home page"),
              leading: Icon(Icons.home),
              onTap: () {},
            ),
            ListTile(
              title: Text("help page"),
              leading: Icon(Icons.help),
              onTap: () {},
            ),
            ListTile(
              title: Text("about page"),
              leading: Icon(Icons.help_center),
              onTap: () {
                Navigator.of(context).pushNamed("Succ");
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
                Navigator.of(context).pushNamed("conn");
              },
            ),
            ListTile(
              title: Text("applay to work"),
              leading: Icon(Icons.exit_to_app),
              onTap: () {
                Navigator.of(context).pushNamed("profile");
              },
            ),
            ListTile(
              title: Text("search work"),
              leading: Icon(Icons.exit_to_app),
              onTap: () {
                Navigator.of(context).pushNamed("FilterNetworkListPage");
              },
            ),
          ],
        ),
      ),
    ));
  }
}
