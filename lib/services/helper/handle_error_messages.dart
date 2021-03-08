import 'package:dio/dio.dart';

class HandleError {
  static fetchError(dynamic error) {
    String e = 'Error';
    print('HandleError: ' + error.toString());
    if (error is DioError) {
      print(error.response.toString());
      if (error.response.toString().contains('not found')) {
        e = 'User not found';
      } else if (error.response.toString().contains('email')) {
        e = 'Email is required';
      } else if (error.response.toString().contains('check password')) {
        e = 'Check password';
      } else if (error.response.toString().contains('email_1')) {
        e = 'Email already using';
      } else if (error.response.toString().contains('phone minimum')) {
        e = 'Phone minimum 6 characters';
      }
    }
    return e;
  }
}
