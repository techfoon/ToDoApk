import 'package:flutter/material.dart';
import 'package:todo/Gpt.dart';
import 'package:todo/dashbord.dart';
import 'package:todo/frontpolicy.dart';
import 'package:todo/update.dart';
import 'package:todo/views/botton_bar.dart';

void main() {
  runApp(MainClass());
}

class MainClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottonBarView(),

      // home: DashBoard1(),
    );
  }
}
