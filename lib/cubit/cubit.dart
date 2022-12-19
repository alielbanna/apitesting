import 'package:apitesting/cubit/state.dart';
import 'package:apitesting/repository.dart';
import 'package:apitesting/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCubit extends Cubit<States> {
  final Repository repository;

  MyCubit(this.repository) : super(InitialState());

  void emitGetAllUsers() {
    repository.getAllUsers().then((usersList) {
      emit(GetAllUsersState(usersList));
    }).catchError((error) {
      print(error.toString());
    });
  }

  void emitGetUserDetails(int userId) {
    repository.getUserById(userId).then((userDetails) {
      emit(GetUserDetailsState(userDetails));
    }).catchError((error) {
      print(error.toString());
    });
  }

  void emitCreateNewUser(User newUser) {
    repository.createNewUser(newUser).then((newUser) {
      emit(CreateNewUserState(newUser));
    }).catchError((error) {
      print(error.toString());
    });
  }

  void emitDeleteUser(int userId) {
    repository.deleteUser(userId).then((data) {
      emit(DeleteUserState(data));
    }).catchError((error) {
      print(error.toString());
    });
  }
}
