import 'package:apitesting/user.dart';
import 'package:apitesting/web_services.dart';

class Repository {
  final WebServices webServices;

  Repository(this.webServices);

  Future<List<User>> getAllUsers() async {
    var response = await webServices.getAllUsers();

    return response.map((user) => User.fromJson(user.toJson())).toList();
  }

  Future<User> getUserById(int userId) async {
    var response = await webServices.getUserById(userId);

    return User.fromJson(response.toJson());
  }
}
