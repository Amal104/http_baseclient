import 'package:baseclient/Services/BaseClient.dart';
import 'package:baseclient/Widgets/baseWidget.dart';
import 'package:baseclient/controller/test_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TestController();
    return basewidget(
      appBar: AppBar(
      backgroundColor: Colors.deepPurple,
      title: Text('Baseclient',style: TextStyle(color: Colors.white,fontSize: 25.0,fontWeight: FontWeight.bold),),
      leading: Icon(Icons.adobe,color: Colors.white,size: 30,),
      leadingWidth: 18,
      elevation: 0.0,
      ),
      Body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){
           controller.getData();
          }, child: Text('Get Data')),
           ElevatedButton(onPressed: (){
           controller.postData();
          }, child: Text('Post Data')),
        ],
        ),
      ),
    );
  }
} 