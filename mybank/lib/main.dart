import 'package:flutter/material.dart';

import 'screens/transfer/list.dart';

void main() => runApp(MyBank());

/// Main start application.
class MyBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: TransfersList(),
    );
  }
}
