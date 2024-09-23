import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  List<Map<String, dynamic>> mData = [
    {
      "Date": "12-3-23",
      "title": "FirstProject",
      "subtitle": "anmole",
      "checkBox": true
    },
    {
      "Date": "13-3-23",
      "title": "SecondProject",
      "subtitle": "rahul",
      "checkBox": true
    },
  ];
  @override
  Widget build(BuildContext context) {
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
                        color: Colors.red,
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
            padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
            child: ListView.builder(
              itemBuilder: (context, index) {
               
                   return ListTile(

                      leading:Icon(Icons.abc),
                      title: Text(mData[index]["title"]),
                      subtitle: Text(mData[index]["subtitle"]),
                      trailing: Column(children: [

                        Text("abc"),
                         Text("abc"),
                      ],) ,
                      
                    );
              
              },
              itemCount: mData.length,
            )));
  }
}
