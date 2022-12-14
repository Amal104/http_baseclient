class AppException implements Exception
{
  final String prefix;
  final String message;
  final String url;

  AppException(this.prefix, this.message, this.url); 
}

class BadRequestException extends AppException
{
  BadRequestException(String message,String url): super(message,'Bad Request',url);
}

class FetchDataException extends AppException
{
  FetchDataException(String message,String url): super(message,'Unable to process',url);
}

class ApiNotRespondingException extends AppException
{
  ApiNotRespondingException(String message,String url): super(message,'Api not responding',url);
}

class UnauthorizedException extends AppException
{
  UnauthorizedException(String message,String url): super(message,'Unauthorized request',url);
}