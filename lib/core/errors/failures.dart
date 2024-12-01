import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;
  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate with ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request canceled with ApiServer');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection error with ApiServer');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure('NO Internet connection');
        }
        return ServerFailure('Unexpected error , Please try again again');
      default:
        return ServerFailure('An Error Occured , Please try again later !');
    }
  }

  factory ServerFailure.fromResponse(int stautsCode, dynamic response) {
    if (stautsCode == 400 || stautsCode == 401 || stautsCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (stautsCode == 404) {
      return ServerFailure('Your Request Not found , Please try again !');
    } else if (stautsCode == 500) {
      return ServerFailure('Server Error , Please try again later !');
    } else {
      return ServerFailure('An Error Occured , Please try again later !');
    }
  }
}
