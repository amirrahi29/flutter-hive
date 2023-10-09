import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var box = Hive.box('myBox');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            children: <Widget>[

              ElevatedButton(
                  onPressed: (){
                    box.put('name', 'David');
                  },
                  child: Text("Add")
              ),

              SizedBox(height: 16,),

              ElevatedButton(
                  onPressed: (){
                    box.put('name', 'David1');
                  },
                  child: Text("Update")
              ),

              SizedBox(height: 16,),

              ElevatedButton(
                  onPressed: (){
                    box.delete('name');
                  },
                  child: Text("Delete")
              ),

              SizedBox(height: 16,),

              ElevatedButton(
                  onPressed: (){
                    var name = box.get('name');
                    print("name: $name");
                  },
                  child: Text("Get Data")
              )

            ],
          ),
        )
    );
  }
}
