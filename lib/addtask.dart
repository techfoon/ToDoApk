import 'package:flutter/material.dart';

class UpdateNote extends StatelessWidget {
  TextEditingController updateTitleController = TextEditingController();
  TextEditingController updateDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                size: 30,
              )),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.menu_outlined,
              size: 30,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              RichText(
                  //  textAlign: TextAlign.left,
                  text: TextSpan(
                      text: 'Update\n',
                      style: TextStyle(
                          fontSize: 45,
                          color: Color.fromARGB(255, 104, 5, 121),
                          fontWeight: FontWeight.bold),
                      children: [
                    TextSpan(
                      text: 'Your Task',
                      style: TextStyle(
                          fontSize: 40,
                          fontFamily: 'PR',
                          fontWeight: FontWeight.bold),
                    )
                  ])),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: updateTitleController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.transparent)),
                    contentPadding:
                        EdgeInsets.only(left: 50, top: 20, bottom: 20),
                    //  labelText: 'Enter your your',
                    hintText: 'Task Title',
                    hintStyle:
                        TextStyle(color: Color.fromARGB(131, 75, 74, 74)),
                    //   helperText: 'Title should be at least 3 charachters',
                    // errorText: 'worng title'

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    filled: true,
                    fillColor: Color.fromARGB(79, 231, 105, 253)),
              ),
              SizedBox(
                height: 30,
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
                height: 30,
              ),
              TextField(
                maxLines: 2,
                controller: updateDescriptionController,
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
                    hintStyle:
                        TextStyle(color: Color.fromARGB(131, 75, 74, 74)),
                    //   helperText: 'Title should be at least 3 charachters',
                    // errorText: 'worng title'

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    filled: true,
                    fillColor: Color.fromARGB(148, 238, 188, 113)),
              ),
              SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Update Task",
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
