import 'dart:io';

import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_shop/core/api/endpoints.dart';
import 'package:e_shop/core/shared_preferences/my_shared.dart';
import 'package:e_shop/core/shared_preferences/my_shared_keys.dart';
import 'package:e_shop/core/utils/safe_print.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class MyDio {
  static late Dio dio;

  static init() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: EndPoints.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );

    dio = Dio(baseOptions);
    dio.interceptors.add(PrettyDioLogger());

    dio.interceptors.add(ChuckerDioInterceptor());
  }




  static Future<Either<String, dynamic>> postData({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    dio.options.headers = {
      "lang": MyShared.getCurrentLanguage(),
      "Authorization":  MyShared.getString(key: MySharedKeys.apiToken),
    };

    try {
      var response = await dio.post(
        endPoint,
        data: data,
        queryParameters: queryParameters,
      );

      safePrint(
          "DATA => $data\nPOST => $endPoint\nCODE => ${response.statusCode}\nRESPONSE => ${response.data}");
      // BaseModel baseModel = BaseModel.fromJson(response.data);

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return Right(response.data);
      } else {
        return Left(response.data['message'].toString());
      }

    } on SocketException {
      return const Left("No Internet Connection");
    } on FormatException {
      return const Left("Format Exception");
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        safePrint(
          "DATA => $data\nPOST => $endPoint\nCODE => ${e.response!.statusCode}\nRESPONSE => ${e.response?.data['message']}",
        );

        // e.response.statusCode
        // safePrint(e.response!.data['message'].toString().tr());
        // safePrint(e.response!.data['message'].toString().replaceAll(".", '').tr());
        return Left(e.response!.data['message'].toString());
      } else if (e.type == DioExceptionType.connectionTimeout) {
        return const Left("Check your connection");
      } else if (e.type == DioExceptionType.receiveTimeout) {
        return const Left("Unable to connect to the server");
      } else {
        return Left(e.message ?? "");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }


  static Future<Either<String, dynamic>> uploadFile({
    required String endPoint,
    required FormData formData,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    // prints(tokenId);
    dio.options.baseUrl = EndPoints.baseUrl;
    dio.options.headers = {
      "lang": MyShared.getCurrentLanguage(),
      "Authorization":  MyShared.getString(key: MySharedKeys.apiToken),
    };

    try {
      var response = await dio.post(
        endPoint,
        data: formData,
        queryParameters: queryParameters,
      );

      safePrint(
          "DATA => $formData\nPOST => $endPoint\nCODE => ${response.statusCode}\nRESPONSE => ${response.data}");

      return Right(response.data);
    } on SocketException {
      return const Left("No Internet Connection");
    } on FormatException {
      return const Left("Format Exception");
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        safePrint(
          "DATA => $formData\nPOST => $endPoint\nCODE => ${e.response!.statusCode}\nRESPONSE => ${e.response!.data['message']}",
        );

        // safePrint(e.message);
        //
        return Left(e.response!.data['message']);
        // return Left(_l)(e.message);
      } else if (e.type == DioExceptionType.connectionTimeout) {
        // safePrint('check your connection');
        return const Left("Check your connection");
      } else if (e.type == DioExceptionType.receiveTimeout) {
        // safePrint('unable to connect to the server');
        return const Left("Unable to connect to the server");
      } else {
        return Left(e.message ?? "");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  static Future<Either<String, dynamic>> putData({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    dio.options.headers = {
      "lang": MyShared.getCurrentLanguage(),
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization":  MyShared.getString(key: MySharedKeys.apiToken),

    };

    try {
      var response =
          await dio.put(endPoint, data: data, queryParameters: queryParameters);
      return Right(response.data);
    } on SocketException {
      return const Left("No Internet Connection");
    } on FormatException {
      return const Left("Format Exception");
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        // safePrint(e.message);
        //
        return Left(e.response!.data['message']);
        // return Left(_l)(e.message);
      } else if (e.type == DioExceptionType.connectionTimeout) {
        // safePrint('check your connection');
        return const Left("Check your connection");
      } else if (e.type == DioExceptionType.receiveTimeout) {
        // safePrint('unable to connect to the server');
        return const Left("Unable to connect to the server");
      } else {
        return Left(e.message ?? "");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  static Future<Either<String, dynamic>> patchData({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    String? token,
    bool isRaw = false,
  }) async {
    dio.options.headers = {

      "lang": MyShared.getCurrentLanguage(),
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization":  MyShared.getString(key: MySharedKeys.apiToken),
    };

    try {
      var response = await dio.patch(
        endPoint,
        data: data == null
            ? null
            : isRaw
                ? data
                : FormData.fromMap(data),
        queryParameters: queryParameters,
      );

      safePrint(
          "DATA => $data\nPATCH => $endPoint\nCODE => ${response.statusCode}\nRESPONSE => ${response.data}");

      return Right(response.data);
    } on SocketException {
      return const Left("No Internet Connection");
    } on FormatException {
      return const Left("Format Exception");
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        safePrint(
          "DATA => $data\nPATCH => $endPoint\nCODE => ${e.response!.statusCode}\nRESPONSE => ${e.response!.data['message']}",
        );
        // safePrint(e.message);
        //
        return Left(e.response!.data['message']);
        // return Left(_l)(e.message);
      } else if (e.type == DioExceptionType.connectionTimeout) {
        // safePrint('check your connection');
        return const Left("Check your connection");
      } else if (e.type == DioExceptionType.receiveTimeout) {
        // safePrint('unable to connect to the server');
        return const Left("Unable to connect to the server");
      } else {
        return Left(e.message ?? "");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  static Future<Either<String, dynamic>> deleteData({
    required String endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {

    dio.options.headers = {
      "lang": MyShared.getCurrentLanguage(),
      "Authorization":  MyShared.getString(key: MySharedKeys.apiToken),
      "Accept": "application/json",
      "Content-Type": "application/json",
      // "Authorization": "Bearer ${MyShared.getString(key: MySharedKeys.apiToken)}",
    };

    try {
      var response = await dio.delete(endPoint,
          data: data, queryParameters: queryParameters);

      safePrint(
          "QUERY => $queryParameters\nDELETE => $endPoint\nCODE => ${response.statusCode}\nRESPONSE => ${response.data}");

      return Right(response.data);
    } on SocketException {
      return const Left("No Internet Connection");
    } on FormatException {
      return const Left("Format Exception");
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        // safePrint(e.message);
        safePrint(
            "DELETE => $endPoint\nCODE => ${e.response?.statusCode}\nRESPONSE => ${e.response?.data}");

        return Left(e.response!.data['message']);
        // return Left(_l)(e.message);
      } else if (e.type == DioExceptionType.connectionTimeout) {
        // safePrint('check your connection');
        return const Left("Check your connection");
      } else if (e.type == DioExceptionType.receiveTimeout) {
        // safePrint('unable to connect to the server');
        return const Left("Unable to connect to the server");
      } else {
        return Left(e.message ?? "");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }



  static Future<Either<String, dynamic>> getData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    safePrint('${EndPoints.baseUrl}$endPoint');
    dio.options.headers = {
      "lang": MyShared.getCurrentLanguage(),
      "Authorization":  MyShared.getString(key: MySharedKeys.apiToken),
    };

    try {
      var response = await dio.get(endPoint, queryParameters: queryParameters);
      safePrint(
          "QUERY => $queryParameters\nGET => $endPoint\nCODE => ${response.statusCode}\nRESPONSE => ${response.data}");
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return Right(response.data);
      } else {
        return Left(response.data['message']);
      }

    } on SocketException {
      return const Left("No Internet Connection");
    } on FormatException {
      return const Left("Format Exception");
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse) {
        safePrint(
            "GET => $endPoint\nCODE => ${e.response?.statusCode}\nRESPONSE => ${e.response?.data}");
        return Left(e.response!.data['message'].Int.toString());
        // return Left(_l)(e.message);
      } else if (e.type == DioExceptionType.connectionTimeout) {
        // safePrint('check your connection');
        return const Left("Check your connection");
      } else if (e.type == DioExceptionType.receiveTimeout) {
        // safePrint('unable to connect to the server');
        return const Left("Unable to connect to the server");
      } else {
        return Left(e.message ?? "");
        // return const Left("Check internet connection");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

}
