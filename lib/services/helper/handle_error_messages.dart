import 'package:dio/dio.dart';

class HandleError {
  static fetchError(dynamic error) {
    String e = 'Error';
    print('HandleError: ' + error.toString());
    if (error is DioError) {
      if (error.response.toString().contains('not found')) {
        e = 'User not found';
      } else if (error.response.toString().contains('email')) {
        e = 'Email is required';
      } else if (error.response.toString().contains('check password')) {
        e = 'Check password';
      } else if (error.response.toString().contains('email already taken')) {
        e = 'Email already using';
      }
    }
    return e;
  }
}
