import 'package:flutter/material.dart';

class LakePage extends StatelessWidget {
  const LakePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: myBody());
  }

  Widget myBody() {
    return Column(children: [block1(), block2(), block3(), block4()]);
  }

  Widget block1() {
    var src =
        "https://images.unspash.com/photo-1439066290691-510066268af5?q=80&w=773&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
    return Image.network(src);
  }

  Widget block2() {
    var namePlace = "Hồ Zurich";
    var addressPlace = "Thuỵ Sĩ";
    var votePlace = "41";
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(namePlace, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(addressPlace, style: TextStyle(color: Colors.grey)),
            ],
          ),
          Row(
            children: [
              Icon(Icons.star, color: Colors.red),
              Text(votePlace),
            ],
          ),
        ],
      ),
    );
  }

  Widget block3() {
    var color = Colors.blue;
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Icon(Icons.call, color: color),
              Text("Call", style: TextStyle(color: color)),
            ],
          ),
          Column(
            children: [
              Icon(Icons.route, color: color),
              Text("Route", style: TextStyle(color: color)),
            ],
          ),
          Column(
            children: [
              Icon(Icons.share, color: color),
              Text("Share", style: TextStyle(color: color)),
            ],
          ),
        ],
      ),
    );
  }
}

Widget block4() {
  var data =
      'Hồ Zurich nằm ở độ cao 406m, với diện tích rộng lớn, dài 40km và rộng 3km. Ở độ sâu tối đa, nó đạt đến 143 m. Nước của hồ rất sạch sẽ, dòng chảy đến từ những ngọn núi Thụy Sĩ và được sử dụng để cung cấp nước cho các thành phố xung quanh, lớn nhất trong số đó là Zurich với khoảng 360.000 cư dân.';
  return Padding(
    padding: const EdgeInsets.only(right: 30, left: 30),
    child: Text(data),
  );
}