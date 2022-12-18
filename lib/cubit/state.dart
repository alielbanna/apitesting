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
