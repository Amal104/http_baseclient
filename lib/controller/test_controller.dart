import 'package:baseclient/Services/BaseClient.dart';
import 'package:baseclient/controller/Base_controller.dart';

class TestController with BaseController
{
  void getData()async{
    var response = await BaseClient().get('https://fakestoreapi.com', '/products')
    .catchError(handleError);
    if(response == null) return;
    print(response);
  }

   void postData()async{
    var request = {'message':'hey there..'};
    var response = await BaseClient().post('https://fakestoreapi.com', '/products',request)
    .catchError(handleError);
    if(response == null) return;
    print(response);
  }
}