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
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (_) {
                      return addPageBMS();
                    });
              },
              child: Icon(
                Icons.add,
              ),
            )
          : null,
    );
  }

//ADD TASK PAGE BOTTOMMODELSHOW
  Widget addPageBMS() {
    TextEditingController addTitleController = TextEditingController();
    TextEditingController addDescriptionController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Your Task!',
              style: TextStyle(
                  fontSize: 35,
                  color: Color.fromARGB(255, 104, 5, 121),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: addTitleController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.transparent)),
                  contentPadding:
                      EdgeInsets.only(left: 50, top: 20, bottom: 20),
                  //  labelText: 'Enter your your',
                  hintText: 'Task Title',
                  hintStyle: TextStyle(color: Color.fromARGB(131, 75, 74, 74)),
                  //   helperText: 'Title should be at least 3 charachters',
                  // errorText: 'worng title'

                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  filled: true,
                  fillColor: Color.fromARGB(79, 231, 105, 253)),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/img/icons/calender.png",
                      width: 40,
                    ),
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Text("Saturday, June 27"),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              maxLines: 2,
              controller: addDescriptionController,
              decoration: InputDecoration(
                  suffixIcon: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    elevation: 5,
                    child: IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/img/icons/attached.png",
                          width: 30,
                        )),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.transparent)),
                  contentPadding: EdgeInsets.only(
                    left: 50,
                    top: 80,
                  ),

                  //  labelText: 'Enter your your',
                  hintText: 'Description',
                  hintStyle: TextStyle(color: Color.fromARGB(131, 75, 74, 74)),
                  //   helperText: 'Title should be at least 3 charachters',
                  // errorText: 'worng title'

                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  filled: true,
                  fillColor: Color.fromARGB(148, 238, 188, 113)),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "add Task",
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'PR',
                      fontWeight: FontWeight.w300),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 104, 5, 121)),
                    foregroundColor: MaterialStatePropertyAll(Colors.white),
                    overlayColor: MaterialStatePropertyAll(
                        const Color.fromARGB(255, 194, 46, 220)),
                    elevation: MaterialStatePropertyAll(5),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                    // enableFeedback: true,
                    minimumSize:
                        MaterialStatePropertyAll(Size(double.infinity, 70))),
              ),
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
