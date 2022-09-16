import 'package:baseclient/Services/App_exceptions.dart';
import 'package:baseclient/helper/Dialog_helper.dart';

class BaseController
{
  void handleError(error){
    if(error is BadRequestException){
      //SHOW ERROR DIALOG
      var message = error.message;
      DialogHelper.showErrorDialog(description: message);

    }else if (error is FetchDataException){
       var message = error.message;
      DialogHelper.showErrorDialog(description: message);
    }else if (error is ApiNotRespondingException){
      DialogHelper.showErrorDialog(description: 'Oops! it took longer to respond');
    }
  }
}