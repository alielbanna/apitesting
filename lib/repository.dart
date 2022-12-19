import 'package:apitesting/user.dart';
import 'package:apitesting/web_services.dart';
import 'package:retrofit/retrofit.dart';
import 'api_result.dart';
import 'network_exceptions.dart';

class Repository {
  final WebServices webServices;

  Repository(this.webServices);

  Future<ApiResult<List<User>>> getAllUsers() async {
    try {
      var response = await webServices.getAllUsers();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<User> getUserById(int userId) async {
    return await webServices.getUserById(userId);
  }

  Future<ApiResult<User>> createNewUser(User newUser) async {
    try {
      var response = await webServices.createNewUser(newUser,
          'Bearer d79f96c44a09ef510a70488fbf6c058a8c782b4d96228d7284b698e14b868063');

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<HttpResponse> deleteUser(int usedId) async {
    return await webServices.deleteUser(usedId,
        'Bearer d79f96c44a09ef510a70488fbf6c058a8c782b4d96228d7284b698e14b868063');
  }

  // Future<List<User>> getAllUsers() async {
  //   var response = await webServices.getAllUsers();
  //
  //   return response.map((user) => User.fromJson(user.toJson())).toList();
  //
  //   // we can return just response direct because retrofit made
  //   // this "response.map((user) => User.fromJson(user.toJson())).toList()" for us.
  // }
  //
  // Future<User> getUserById(int userId) async {
  //   var response = await webServices.getUserById(userId);
  //
  //   return User.fromJson(response.toJson());
  //
  //   // we can return just response direct because retrofit made
  //   // this "User.fromJson(response.toJson())" for us.
  // }
  //
  // Future<User> createNewUser(User newUser) async {
  //   return await webServices.createNewUser(newUser,
  //       'Bearer d79f96c44a09ef510a70488fbf6c058a8c782b4d96228d7284b698e14b868063');
  // }
  //
  // Future<HttpResponse> deleteUser(int useId) async {
  //   return await webServices.deleteUser(useId,
  //       'Bearer d79f96c44a09ef510a70488fbf6c058a8c782b4d96228d7284b698e14b868063');
  // }
}
