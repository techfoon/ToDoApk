import 'package:flutter/material.dart';

void main() {
  runApp(MainClass());
}

class MainClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner:  false,

      home: TodoDashBoard(),
    );
  }
}


class TodoDashBoard extends StatelessWidget {


  @override
  Widget build(BuildContext context){
    return Scaffold();
  }
}
