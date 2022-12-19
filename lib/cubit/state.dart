import 'package:apitesting/user.dart';

abstract class States {}

class InitialState extends States {}

class GetAllUsersState extends States {
  final List<User> allUsersList;

  GetAllUsersState(this.allUsersList);
}

class GetUserDetailsState extends States {
  final User userDetails;

  GetUserDetailsState(this.userDetails);
}

class CreateNewUserState extends States {
  final User newUser;

  CreateNewUserState(this.newUser);
}

class DeleteUserState extends States {
  final dynamic data;

  DeleteUserState(this.data);
}
