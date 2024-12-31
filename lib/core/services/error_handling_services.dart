import 'package:dio/dio.dart';

import '../constants/helper widgets/request_failed_dialogue.dart';

class ErrorHandler {
  static void handleError(DioException error) {
    String errorMessage = '';
    switch (error.type) {
      case DioException.connectionTimeout:
        errorMessage = 'Connection Timeout';
        break;
      case DioException.sendTimeout:
        errorMessage = 'Send Timeout';
        break;
      case DioException.receiveTimeout:
        errorMessage = 'Receive Timeout';
        break;
      case DioException.badResponse:
        errorMessage =
            'Received invalid status code: ${error.response?.statusCode}';
        break;
      case DioException.requestCancelled:
        errorMessage = 'Request to API server was cancelled';
        break;
      default:
        errorMessage = 'Unexpected Error';
        break;
    }

    // final Logger logger =
    //     Logger(printer: CustomLogPrinter(className: 'Error Handler'));

    RequestFailedDialog(errorMessage: errorMessage);

    // logger.e('Error $errorMessage');
  }

  static void handleGenericError(dynamic error) {
    // final Logger logger =
    //     Logger(printer: CustomLogPrinter(className: 'Error Handler'));
    String errorMessage = 'An unexpected error occurred';

    RequestFailedDialog(errorMessage: errorMessage);

    // logger.e('Unexpected Error $errorMessage');
  }
}
