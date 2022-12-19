import 'package:apitesting/cubit/state.dart';
import 'package:apitesting/network_exceptions.dart';
import 'package:apitesting/repository.dart';
import 'package:apitesting/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCubit extends Cubit<ResultState<dynamic>> {
  final Repository repository;

  MyCubit(this.repository) : super(const Idle());

  void emitGetAllUsers() async {
    var result = await repository.getAllUsers();

    result.when(success: (List<User> users) {
      emit(ResultState.success(users));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ResultState.error(networkExceptions));
    });
  }

  void emitCreateNewUser(User newUser) async {
    var result = await repository.createNewUser(newUser);

    result.when(success: (User userData) {
      emit(ResultState.success(userData));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ResultState.error(networkExceptions));
    });
  }

  // void emitGetAllUsers() {
  //   repository.getAllUsers().then((usersList) {
  //     emit(GetAllUsersState(usersList));
  //   }).catchError((error) {
  //     print(error.toString());
  //   });
  // }
  //
  // void emitGetUserDetails(int userId) {
  //   repository.getUserById(userId).then((userDetails) {
  //     emit(GetUserDetailsState(userDetails));
  //   }).catchError((error) {
  //     print(error.toString());
  //   });
  // }
  //
  // void emitCreateNewUser(User newUser) {
  //   repository.createNewUser(newUser).then((newUser) {
  //     emit(CreateNewUserState(newUser));
  //   }).catchError((error) {
  //     print(error.toString());
  //   });
  // }
  //
  // void emitDeleteUser(int userId) {
  //   repository.deleteUser(userId).then((data) {
  //     emit(DeleteUserState(data));
  //   }).catchError((error) {
  //     print(error.toString());
  //   });
  // }
}
