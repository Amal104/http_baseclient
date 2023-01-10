import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:baseclient/Services/App_exceptions.dart';
import 'package:http/http.dart' as http;

import '../model/Product_Model.dart';
class BaseClient
{
  static const int TimeOut = 20;
  //GET
  Future<dynamic> get(String baseUrl,String api)async{
     DataModel? result;
    var uri = Uri.parse(baseUrl+api);
    try{
      var response = await http.get(uri).timeout(Duration(seconds:TimeOut ));
       if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = DataModel.fromJson(item);
    } else {
      print("error");
    }
  } catch (e) {
    log(e.toString());
  }
  return result;
      // return _processResponce(response);
    // }
    // on SocketException{
    //   throw FetchDataException('No internet connection', uri.toString());
    // }
    // on TimeoutException{
    //   throw ApiNotRespondingException('Api not responding in  time', uri.toString());
    // }
    
  }

  //POST
   Future<dynamic> post(String baseUrl,String api,dynamic payloadobj)async{
    var payload = json.encode(payloadobj);
    var uri = Uri.parse(baseUrl+api);
    try{
      var response = await http.post(uri,body: payload).timeout(Duration(seconds:TimeOut ));
      return _processResponce(response);
    }
    on SocketException{
      throw FetchDataException('No internet connection', uri.toString());
    }
    on TimeoutException{
      throw ApiNotRespondingException('Api not responding in  time', uri.toString());
    }
    
  }
  //DELETE
  //OTHERS
  dynamic _processResponce(http.Response response){
    switch (response.statusCode) {
      case 200:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
        case 400:
        throw BadRequestException(utf8.decode(response.bodyBytes), response.request!.url.toString());
        case 401:
        case 403:
        throw UnauthorizedException(utf8.decode(response.bodyBytes), response.request!.url.toString());
        case 500:
      default:
      throw FetchDataException('Error occured with code ${response.statusCode}', response.request!.url.toString());
    }
  }
}