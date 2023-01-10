import 'package:baseclient/Services/BaseClient.dart';
import 'package:baseclient/controller/test_controller.dart';
import 'package:flutter/cupertino.dart';
import '../model/Product_Model.dart';


class DataClass extends ChangeNotifier {
  DataModel? post;
  bool loading = false;

  getPostData() async {
    loading = true;
    post = (await BaseClient().get("https://jsonplaceholder.typicode.com","/posts/1"))!;
    loading = false;

    notifyListeners();
  }
}