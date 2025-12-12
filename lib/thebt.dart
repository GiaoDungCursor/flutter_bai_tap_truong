import 'package:flutter/material.dart';

class myclassroom extends StatelessWidget {
  const myclassroom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myBody(),
    );
  }
  Widget myBody(){
    return SafeArea(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: List.generate(10, (index)=>item()),
      ),
    );
  }
  Widget item(){
    return Container(
      height: 100,
      margin: EdgeInsets.only(left: 20,right: 20, top: 0, bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("lap trinh mobi"),
                  Text("Tin3043")
                ],
              ),
              Text("58 hoc vien")
            ],
          ),
          IconButton(onPressed: ()=>{}, icon: Icon(Icons.more_horiz))
        ],
      ),
    );
  }
}