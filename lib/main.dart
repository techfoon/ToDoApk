import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/Gpt.dart';
import 'package:todo/dashbord.dart';
import 'package:todo/frontpolicy.dart';
import 'package:todo/update.dart';
import 'package:todo/views/botton_bar.dart';

void main() {
  runApp(MainClass());
}

class MainClass extends StatefulWidget {
  @override
  State<MainClass> createState() => _MainClassState();
}



class _MainClassState extends State<MainClass> {

  


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home: Frontpolicy(),

    //home: MyColorPicker(),
    );
  }
}


