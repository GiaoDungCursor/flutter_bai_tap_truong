import 'package:dio/dio.dart';
import 'package:flutter_application_1/myproduct.dart';


class Api {
  Future<List<Product>> getAllProducts() async {
    var dio = Dio();
    var response = await dio.request('https://fakestoreapi.com/products');
    List<Product> listProduct = [];
    if (response.statusCode == 200) {
      List data = response.data;
      listProduct = data.map((x) => Product.fromJson(x)).toList();
    } else {
      print('Loi roi');
    }
    return listProduct;
  }
}
    
var test_api = Api();