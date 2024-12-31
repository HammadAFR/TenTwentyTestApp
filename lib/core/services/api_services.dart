import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'Base Api Service/base_api_service.dart';
import 'error_handling_services.dart';

class ApiServices extends BaseApiServices {
  Future<Dio> launchDio() async {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["accept"] = 'application/json';

    dio.options.headers["Authorization"] =
        'Bearer ${dotenv.env['MOVIES_API_ACCESS_TOKEN']}';

    dio.options.followRedirects = false;
    dio.options.validateStatus = (val) {
      if (val != null) {
        return val < 500;
      } else {
        return false;
      }
    };
    return dio;
  }

  /////Get Api
  @override
  Future getApiService({required String url, data}) async {
    Dio dio = await launchDio();
    try {
      final response = await dio.get(url, data: data);
      return response;
    } on DioException catch (e) {
      ErrorHandler.handleError(e);
      return null;
    } catch (e) {
      ErrorHandler.handleGenericError(e);
      return null;
    }
  }

  ///Post Api
  @override
  Future postApiService({required String url, data}) async {
    Dio dio = await launchDio();
    try {
      final response = await dio.post(url, data: data);
      return response;
    } on DioException catch (e) {
      ErrorHandler.handleError(e);
      return null;
    } catch (e) {
      ErrorHandler.handleGenericError(e);
      return null;
    }
  }

  ///Delete Api
  @override
  Future deleteApiService({required String url, data}) async {
    Dio dio = await launchDio();
    try {
      final response = await dio.delete(url, data: data);
      return response;
    } on DioException catch (e) {
      ErrorHandler.handleError(e);
      return null;
    } catch (e) {
      ErrorHandler.handleGenericError(e);
      return null;
    }
  }

  ///Put Api
  @override
  Future putApiService({required String url, data}) async {
    Dio dio = await launchDio();
    try {
      final response = await dio.put(url, data: data);
      return response;
    } on DioException catch (e) {
      ErrorHandler.handleError(e);
      return null;
    } catch (e) {
      ErrorHandler.handleGenericError(e);
      return null;
    }
  }

  ///Patch Api
  @override
  Future patchApiService({required String url, data}) async {
    Dio dio = await launchDio();
    try {
      final response = await dio.patch(url, data: data);
      return response;
    } on DioException catch (e) {
      ErrorHandler.handleError(e);
      return null;
    } catch (e) {
      ErrorHandler.handleGenericError(e);
      return null;
    }
  }
}
