import 'package:flutter/material.dart';

class Frontpolicy extends StatefulWidget {
  @override
  State<Frontpolicy> createState() => _FrontpolicyState();
}

class _FrontpolicyState extends State<Frontpolicy> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 25,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 30),
            width: double.infinity,
            child: Image.asset(
              'assets/img/i/fi.gif',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Text(
                  "Welcome to your task Manager",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'PR',
                      color: const Color.fromARGB(255, 104, 5, 121)),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 38),
                  child: Text(
                    "Best way to list your Task. here you can create adn see all your Task schedule with the time.",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CheckboxListTile(
                    title: Text("Terms & Condition."),
                    subtitle: Text(
                      "I am acception all the Terms & Condition",
                      style: TextStyle(fontSize: 10),
                    ),
                    value: isChecked,
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (bool? newValue) {
                      setState(() {
                        isChecked = newValue!; // value को update करते हैं
                      });
                    }),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Get Started",
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
                        minimumSize: MaterialStatePropertyAll(
                            Size(double.infinity, 70))),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
