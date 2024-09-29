import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/update.dart';
import 'package:todo/frontpolicy.dart';
import 'package:todo/views/profile.dart'; // For formatting the date

class DashBoard1 extends StatefulWidget {
  @override
  State<DashBoard1> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard1> {
  bool mCheckBox = false;

  List<Map<String, dynamic>> mData = [
    {
      "Date": DateTime(2024, 9, 23), //Format(Y, M, date)
      "title": "First Project",
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
  ];

  @override
  void initState() {
    super.initState();
    // Sort the list by date in descending order (latest date first)
    mData.sort((a, b) => b["Date"].compareTo(a["Date"]));
  }

  // Function to group data by date
  Map<String, List<Map<String, dynamic>>> _groupDataByDate() {
    Map<String, List<Map<String, dynamic>>> groupedData = {};
    for (var item in mData) {
      // Format the date to a string, e.g., "2024-09-23"
      String formattedDate = DateFormat('yyyy-MM-dd').format(item["Date"]);

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
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
        child: ListView.builder(
          itemCount: groupedData.keys.length,
          itemBuilder: (context, index) {
            String dateKey = groupedData.keys.elementAt(index);
            List<Map<String, dynamic>> itemsForDate = groupedData[dateKey]!;

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
                    color: item["color"],
                    child: Container(
                      height: 150, // You can adjust this height if necessary
                      child: ListTile(
                        isThreeLine: true,
                        leading: Checkbox(
                          
                          value: item["checkBox"],
                          onChanged: (bool? value) {
                            setState(() {
                              item["checkBox"] = value!;
                            });
                          },
                        ),
                        title: Text(
                          item["title"],
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(item["subtitle"]),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.delete, size: 30),
                              onPressed: () {
                                // Handle delete action
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.edit, size: 30),
                              onPressed: () {
                                // Handle edit action
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ],
            );
          },
        ),
      ),
    );
  }
}
