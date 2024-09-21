import 'package:flutter/material.dart';
import 'package:todo/frontpolicy.dart';

void main() {
  runApp(MainClass());
}

class MainClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Frontpolicy(),
    );
  }
}


class TodoDashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("this our page"),
      ),
    );
  }
}
