import 'package:flutter/material.dart';
import 'package:todo/update.dart';
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
    UpdateNote(),
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
            if (currentIndexValue != 0)
              BottomNavigationBarItem(icon: Icon(Icons.add), label: "old"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "settings"),
          ]),
      // Conditionally display floatingActionButton based on currentIndexValue
      floatingActionButtonLocation: currentIndexValue == 0
          ? FloatingActionButtonLocation.centerDocked
          : null,
      floatingActionButton: currentIndexValue == 0
          ? FloatingActionButton.small(
              onPressed: () {},
              child: Icon(
                Icons.add,
              ),
            )
          : null,
    );
  }
}
//https://www.youtube.com/watch?v=9__pMx8_Gsc&t=302s  need check later