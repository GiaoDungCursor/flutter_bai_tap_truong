import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myBody(),
    );
  }
  Widget myBody(){
    return Column(
      mainAxisAlignment:MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("xin chao mng" ,
        style: TextStyle(color: Colors.red, fontSize: 30),),
        Icon(Icons.heart_broken, size: 100,color: Colors.red,),
        Text("lap trinh di dong nhoms 3" ,style: TextStyle(fontSize: 30,color: Colors.blue)),
      ],
    );
  }
}