import 'package:apitesting/user.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: 'https://gorest.co.in/public/v2/')
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;

  @GET('users')
  Future<List<User>> getAllUsers();
}

Dio createAndSetupDio() {
  Dio dio = Dio();

  dio
    ..options.connectTimeout = 10 * 1000
    ..options.receiveTimeout = 10 * 1000;

  dio.interceptors.add(LogInterceptor(
    responseBody: true,
    error: true,
    responseHeader: false,
    requestHeader: false,
    request: true,
    requestBody: true,
  ));
  return dio;
}
