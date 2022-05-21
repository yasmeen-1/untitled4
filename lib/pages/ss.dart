import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:untitled4/models/apply.dart';

class email extends StatefulWidget {
  const email({Key? key, required this.text, this.id}) : super(key: key);
  final String text;
  final id;
  @override
  _emailState createState() => _emailState();
}

class _emailState extends State<email> {
  List<String> attachments = [];
  bool isHTML = false;
  late String x = widget.text;
  late final _recipientController = TextEditingController(
    text: x,
  );

  late final _subjectController =
      TextEditingController(text: 'I saw your announcement');

  final _bodyController = TextEditingController(
    text: ' ',
  );
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

  Future<void> send() async {
    final Email email = Email(
      body: _bodyController.text,
      subject: _subjectController.text,
      recipients: [_recipientController.text],
      attachmentPaths: attachments,
      isHTML: isHTML,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      print(error);
      platformResponse = error.toString();
    }

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(platformResponse),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sending email '),
        actions: <Widget>[
          IconButton(
            onPressed: send,
            icon: Icon(Icons.send),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: _recipientController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Recipient',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: _subjectController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Subject',
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: _bodyController,
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                      labelText: 'Body', border: OutlineInputBorder()),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  for (var i = 0; i < attachments.length; i++)
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            attachments[i],
                            softWrap: false,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.remove_circle),
                          onPressed: () => {_removeAttachment(i)},
                        )
                      ],
                    ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(Icons.attach_file),
                      onPressed: _openImagePicker,
                    ),
                  ),
                  TextButton(
                    child: Text('Attach file in app documents directory'),
                    onPressed: () => _attachFileFromAppDocumentsDirectoy(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openImagePicker() async {
    final picker = ImagePicker();
    PickedFile? pick = await picker.getImage(source: ImageSource.gallery);
    if (pick != null) {
      setState(() {
        attachments.add(pick.path);
      });
    }
  }

  void _removeAttachment(int index) {
    setState(() {
      attachments.removeAt(index);
    });
  }

  Future<void> _attachFileFromAppDocumentsDirectoy() async {
    try {
      final appDocumentDir = await getApplicationDocumentsDirectory();
      final filePath = appDocumentDir.path + '/file.txt';
      final file = File(filePath);
      await file.writeAsString('Text file in app directory');

      setState(() {
        attachments.add(filePath);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to create file in applicion directory'),
        ),
      );
    }
  }
}
