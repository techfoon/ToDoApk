import 'package:flutter/material.dart';
import 'package:todo/addNote.dart';
import 'package:todo/dashbord.dart';
import 'package:todo/frontpolicy.dart';
import 'package:todo/views/profile.dart';

class BottonBarView extends StatefulWidget {
  @override
  _BottonBarState createState() => _BottonBarState();
}

class _BottonBarState extends State<BottonBarView> {
  int currentIndexValue = 0;
  List screenList = [
    DashBoard(),
    AddNote(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: screenList[currentIndexValue],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndexValue,
          onTap: (index) {
            setState(() {
              currentIndexValue = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard), label: "DashBoard"),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: "New"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "settings"),
          ]),
    );
  }
}
//https://www.youtube.com/watch?v=9__pMx8_Gsc&t=302s  need check later