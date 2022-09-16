import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHelper
{
  static void showErrorDialog({String title = 'Error', String description = 'Something went wrong'}){
    Get.dialog(
      Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,),
            Text(description,),
            ElevatedButton(onPressed: (){
              Get.back();
            }, child: const Text('Okay')),
          ],
        ),
      )
    );
  }
}