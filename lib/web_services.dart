import 'package:apitesting/user.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: 'https://gorest.co.in/public/v2/')
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;

  @GET('users')
  Future<List<User>> getAllUsers();

  @GET('users/{id}')
  Future<User> getUserById(@Path('id') int userId);

  @POST('users')
  Future<User> createNewUser(
      @Body() User newUser, @Header('Authorization') String token);

  @DELETE('users/{id}')
  Future<HttpResponse> deleteUser(
      @Path('id') int userId, @Header('Authorization') String token);
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
