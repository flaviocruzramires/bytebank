import 'package:bytebank_app/database/app_database.dart';
import 'package:bytebank_app/models/contact_model.dart';
import 'package:bytebank_app/screen/contact_list.dart';
import 'package:bytebank_app/screen/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BytebankApp());
  save(ContactModel(id: 1, name: 'Flavio', conta: 1254)).then((id) {
    findAll().then((ContactList) {
      debugPrint(ContactList.toString());
    });
  });
}

class BytebankApp extends StatelessWidget {
  const BytebankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.green[900],
          //accentColor: Colors.blueAccent[700],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[700],
            textTheme: ButtonTextTheme.primary,
          )),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[900],
          title: const Text('Bytebank'),
        ),
        body: const Dashboard(),
      ),
    );
  }
}
