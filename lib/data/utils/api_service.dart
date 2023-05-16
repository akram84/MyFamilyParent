import 'dart:io';

import 'package:dio/dio.dart';

import '../repository/auth_repository.dart';
import '../repository/language_repository.dart';
import 'api_path.dart';


class ApiService {
  static const String urlencodedType = 'application/x-www-form-urlencoded';
  static const String jsonType = 'application/json';
  static const String multiPart = "multipart/form-data";
  static const int unauthorizedCode = 401;
  static const int internalServerErrorCode = 500;
  static const String authorizationParameter = 'Authorization';
  static const String bearer = 'Bearer';


  static late Dio _dio;
  static init(){
    _dio = Dio(
        BaseOptions(
          baseUrl: ApiPaths.base,
          receiveDataWhenStatusError: true,
          headers: {
            'Accept': jsonType,
            'lang': LanguageRepository.getLang
          }
        )
    );
  }
  static final AuthRepository _authRepository = AuthRepository();


  /// Post api
  static Future<Response<T>> postApi<T>(
    String path, {
    Map<String, dynamic> body = const {},
    bool isJson = true,
    bool isAuth = true,
    bool isRefresh = false,
  }) async {
    //call api
    if (isAuth) {
      await authorize(isRefresh: isRefresh);
    }

    _dio.options.headers['Accept'] = jsonType;
    _dio.options.headers['lang'] = LanguageRepository.getLang;
    final Response<T> response = await _dio.post(
        path,
        data: body,
        options: Options(
            contentType: isJson ? jsonType : urlencodedType,
            validateStatus: (int? status) {
              // if (status == 401) return false;
              return true;
            },
        ),
    );
    return response;
  }
  static Future<Response<T>> postFormData<T>(
    String path, {
    Map<String, dynamic> body = const {},
  }) async {
    await authorize();
    final FormData formData = FormData.fromMap(body);
    final Response<T> response = await _dio.post(
        path,
        data: formData,
        options: Options(validateStatus: (int? status) => true),
    );
    return response;
  }

  /// Get api
  static Future<Response<T>> getApi<T>(String path, {Map<String, dynamic>? params}) async {
    // authorize the api
    await authorize();

    final Response<T> response = await _dio.get(path, queryParameters: params, options: Options(validateStatus: (int? status) {
      if (status == 401 || status == 403) return false;
      return true;
    }));
    return response;
  }

  static Future<Response<T>> deleteApi<T>(
      String path, {
        Map<String, dynamic> body = const {},
        bool isJson = true,
        bool isAuth = true,
        bool isRefresh = false,
      }) async {
    //call api
    if (isAuth) {
      await authorize(isRefresh: isRefresh);
    }

    final Response<T> response = await _dio.delete(path,
        data: body,
        options: Options(
            contentType: isJson ? jsonType : urlencodedType,
            validateStatus: (int? status) {
              // if (status == 401) return false;
              return true;
            }));

    return response;
  }

  static Future<Response<T>> upload<T>(
    String path, {
    required String typeValue,
    required File file,
    bool isJson = true,
    bool isAuth = true,
    bool hasUserId = false,
  }) async {
    // dio init

    // ignore: always_specify_types
    final Map<String, dynamic> map = {
      'type': typeValue,
      'media': await MultipartFile.fromFile(
        file.path,
        filename: file.path.split('/').last,
        // contentType: MediaType.parse(lookupMimeType(file.path)!),
      )
    };
    final FormData formData = FormData.fromMap(map);

    //call api
    if (isAuth) {
      authorize();
    }

    final Response<T> response = await _dio.post(path,
        data: formData,
        options: Options(
            validateStatus: (int? status) {
              if (status == 401 || status == 403) return false;
              return true;
            },
            contentType: multiPart));

    return response;
  }

  static Future<void> authorize({bool isRefresh = false}) async {
    final String? token = _authRepository.accessToken;
    _dio.options.headers[authorizationParameter] = '$bearer $token';
  }

  static Future<Response<T>> putApi<T>(
    String path, {
    Map<String, dynamic> body = const {},
    bool isJson = true,
    bool isAuth = true,
    bool isRefresh = false,
  }) async {
    //call api
    if (isAuth) {
      await authorize(isRefresh: isRefresh);
    }

    final Response<T> response = await _dio.put(path,
        data: body,
        options: Options(
            contentType: isJson ? jsonType : urlencodedType,
            validateStatus: (int? status) {
              // if (status == 401) return false;
              return true;
            }));

    return response;
  }

  static Stream<Response> streamApi(
      String path, {
        Map<String, dynamic>? params,
        bool isAuth = true,
        bool isRefresh = false,
      }) async* {
    // authorize the api
    if (isAuth) {
      await authorize(isRefresh: isRefresh);
    }

    final Stream<Response> stream = _dio.get(
      path,
      queryParameters: params,
      options: Options(
          responseType: ResponseType.stream,
          validateStatus: (int? status) {
        if (status == 401 || status == 403) return false;
        return true;
      }),
    ).asStream();

    await for (final response in stream) {
      yield response;
    }
  }

}
