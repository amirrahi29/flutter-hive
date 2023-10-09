import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_hive_project/model/product_model.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class MyProducts extends StatefulWidget {
  const MyProducts({Key? key}) : super(key: key);

  @override
  State<MyProducts> createState() => _MyProductsState();
}

class _MyProductsState extends State<MyProducts> {

  var box = Hive.box('myBox');
  List<dynamic> allProducts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //from api
    fetchAllProducts();
    //from hive local database
    getDatabase();
  }

  Future<void> fetchAllProducts()async{
    var result = await http.get(Uri.parse("http://fakestoreapi.com/products"));
    var convertedJson = jsonDecode(result.body);
    var data = (convertedJson as List).map((e) => ProductModel.fromJson(e)).toList();
    setState(() {
      box.put("AllProducts", data);
    });
  }

  getDatabase()async{
    var data = box.get('AllProducts');
    allProducts = data;
    print("local data: ${data}");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: allProducts == null?CircularProgressIndicator():
          ListView.builder(
            itemCount: allProducts.length,
              itemBuilder: (context,index){
                return Container(
                  padding: EdgeInsets.all(8),
                  child: Text(allProducts[index].title!),
                );
              }
          ),
        )
    );
  }
}
