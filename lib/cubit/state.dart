// import 'package:apitesting/user.dart';
//
// abstract class States {}
//
// class InitialState extends States {}
//
// class GetAllUsersState extends States {
//   final List<User> allUsersList;
//
//   GetAllUsersState(this.allUsersList);
// }
//
// class GetUserDetailsState extends States {
//   final User userDetails;
//
//   GetUserDetailsState(this.userDetails);
// }
//
// class CreateNewUserState extends States {
//   final User newUser;
//
//   CreateNewUserState(this.newUser);
// }
//
// class DeleteUserState extends States {
//   final dynamic data;
//
//   DeleteUserState(this.data);
// }

import 'package:apitesting/network_exceptions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
class ResultState<T> with _$ResultState<T> {
  const factory ResultState.idle() = Idle<T>;
  const factory ResultState.loading() = Loading<T>;

  const factory ResultState.success(T data) = Success<T>;

  const factory ResultState.error(NetworkExceptions networkExceptions) =
      Error<T>;
}
