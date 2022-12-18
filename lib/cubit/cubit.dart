import 'package:apitesting/cubit/state.dart';
import 'package:apitesting/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCubit extends Cubit<States> {
  final Repository repository;

  MyCubit(this.repository) : super(InitialState());

  void emitGetAllUsers() {
    repository.getAllUsers().then((usersList) {
      emit(GetAllUsersState(usersList));
    }).catchError((error) {});
  }

  void emitGetUserDetails(int userId) {
    repository.getUserById(userId).then((userDetails) {
      emit(GetUserDetailsState(userDetails));
    }).catchError((error) {});
  }
}
