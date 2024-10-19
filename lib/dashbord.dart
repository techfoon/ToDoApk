import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:todo/db/dbheaper.dart';
import 'package:todo/providers/Crudprovider.dart';
import 'package:todo/update.dart';
import 'package:todo/frontpolicy.dart';
import 'package:todo/views/profile.dart';

import 'package:provider/provider.dart'; // For formatting the date

class DashBoard extends StatefulWidget {
  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  bool mCheckBox = false;

  List<Map<String, dynamic>> mData = [];

  DBhelper mainDB = DBhelper.getMyinstance();

   

  /*List<Map<String, dynamic>> gmData = [
    {
      "Date": DateTime(2024, 9, 23), //Format(Y, M, date)
      "title": "FirstProject",
      "subtitle": "anmole",
      "checkBox": true,
      "color": Color.fromARGB(137, 42, 234, 87)
    },
    {
      "Date": DateTime(2024, 9, 26),
      "title": "SecondProject",
      "subtitle": "Suseel",
      "checkBox": true,
      "color": Color.fromARGB(146, 180, 235, 91)
    },
    {
      "Date": DateTime(2024, 9, 23), //Format(Y, M, date)
      "title": "FirstProject",
      "subtitle": "Akshay",
      "checkBox": true,
      "color": Color.fromARGB(137, 171, 35, 229)
    },
    {
      "Date": DateTime(2024, 9, 26),
      "title": "SecondProject",
      "subtitle": "rahul",
      "checkBox": true,
      "color": Color.fromARGB(146, 210, 83, 9)
    },
    {
      "Date": DateTime(2024, 9, 23), //Format(Y, M, date)
      "title": "FirstProject",
      "subtitle": "anmole",
      "checkBox": true,
      "color": Color.fromARGB(138, 2, 174, 253)
    },
    {
      "Date": DateTime(2024, 9, 24),
      "title": "SecondProject",
      "subtitle": "Ashish",
      "checkBox": true,
      "color": Color.fromARGB(146, 213, 44, 50)
    },
  ];*/

  getInitialToDo() async {
    mData = await mainDB.getAlltodo();

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    // Sort the list by date in descending order (latest date first)
    getInitialToDo();

    mData.sort((a, b) => b["todoDate"].compareTo(a["todoDate"]));
  }

  // Function to group data by date
  Map<String, List<Map<String, dynamic>>> _groupDataByDate() {
    Map<String, List<Map<String, dynamic>>> groupedData = {};

    for (var item in mData) {
      // Format the date to a string, e.g., "2024-09-23"
      String formattedDate = DateFormat('yyyy-MM-dd').format(
          item["todoDate"] != null
              ? DateTime.parse(item["todoDate"])
              : DateTime(2024, 9, 23));

      // If the date is not already in the map, create an empty list
      if (!groupedData.containsKey(formattedDate)) {
        groupedData[formattedDate] = [];
      }
      // Add the item to the corresponding date's list
      groupedData[formattedDate]!.add(item);
    }
    return groupedData;
  }

  @override
  Widget build(BuildContext context) {

   //  var data = Provider.of<Crudprovider>(context).getMap();
    // Group the data by date
    Map<String, List<Map<String, dynamic>>> groupedData = _groupDataByDate();

    return Scaffold(
      appBar: AppBar(
        //   leading: ,

        actions: [
          Stack(
            children: [
              SizedBox(
                height: 60,
                child: IconButton(
                    iconSize: 60,
                    onPressed: () {},
                    icon: Image.asset("assets/img/i/p1.png")),
              ),
              Positioned(
                top: 8,
                right: 3,
                child: Container(
                  height: 16,
                  width: 16,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.white),
                      color: const Color.fromARGB(255, 217, 89, 80),
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ],
          )
        ],
        title: Text(
          "MyTasks",
          style: TextStyle(
              fontSize: 30,
              color: Color.fromARGB(255, 104, 5, 121),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: mData.isNotEmpty
          ? Padding(
              padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
              child: ListView.builder(
                itemCount: groupedData.keys.length,
                itemBuilder: (context, index) {
                  String dateKey = groupedData.keys.elementAt(index);
                  List<Map<String, dynamic>> itemsForDate =
                      groupedData[dateKey]!;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Date header
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          dateKey, // Print the date (group header)
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      // Cards for that date
                      ...itemsForDate.map((item) {
                        return Card(
                          elevation: 5,
                          color: Color(int.parse(
                              item[mainDB.cardColor])), //  still facing issue
                          child: Container(
                            height: 150,
                            child: Stack(children: [
                              ListTile(
                                visualDensity: VisualDensity(vertical: 4),
                                isThreeLine: true,
                                leading: Padding(
                                  padding: const EdgeInsets.only(top: 45),
                                  child: Transform.scale(
                                      scale: 2,

                                      //------------------------------------------------/////  need CHECKBOX need attaendtion
                                      child: Checkbox(
                                        value: item[mainDB.todoCheckbox] ==
                                            1, // Convert int to bool for Checkbox
                                        onChanged: (bool? value) async {
                                          if (value != null) {
                                            // Update the database
                                            await mainDB.updateCheckBox(
                                                cValue: value,
                                                sNo: item[mainDB
                                                    .s_no]); // Pass the correct item id

                                            // Update the UI after the database update
                                            setState(() {
                                              item[mainDB.todoCheckbox] = value
                                                  ? 1
                                                  : 0; // Convert bool back to int
                                            });
                                          }
                                        },
                                      )
                                      //     Text(item[mainDB.s_no].toString())
                                      //
                                      ),
                                ),
                                title: Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Text(
                                    item[mainDB.todoTableTitle] != null
                                        ? item[mainDB.todoTableTitle]
                                        : "value is null",
                                    style: TextStyle(
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1),
                                        fontSize: 23,
                                        fontFamily: 'PR'),
                                  ),
                                ),
                                subtitle: Text(
                                  item[mainDB.todoTableDescription] != null
                                      ? item[mainDB.todoTableDescription]
                                      : "value is null",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 206, 203, 203),
                                      fontSize: 18,
                                      fontFamily: 'PR'),
                                ),
                                trailing: Container(
                                  height: 160,
                                  // color: Colors.grey,
                                  child: Card(
                                      elevation: 5,
                                      child: IconButton(
                                        onPressed: () {
                                          //print(item[index][mainDB.s_no].runtimeType);

                                          mainDB.todoDelete(
                                              Sn: item[mainDB.s_no]);
                                           
                                          /// smaj nahi agya
                                        getInitialToDo();
                                        },
                                        icon: Icon(Icons.delete),
                                        iconSize: 40,
                                      )),
                                ),
                              ),
                              Positioned(
                                  top: 80,
                                  right: 22,
                                  child: Card(
                                    elevation: 5,
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return UpdateNote();
                                        }));
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        size: 40,
                                      ),
                                    ),
                                  ))
                            ]),
                          ),
                        );
                      }).toList(),
                    ],
                  );
                },
              ),
            )
          : Text("no notes found"),
    );
  }
}
