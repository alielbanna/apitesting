import 'package:apitesting/cubit/cubit.dart';
import 'package:apitesting/cubit/state.dart';
import 'package:apitesting/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> usersList = [];
  User userDetails = User();

  @override
  void initState() {
    super.initState();
    // BlocProvider.of<MyCubit>(context).emitGetAllUsers();
    BlocProvider.of<MyCubit>(context).emitGetUserDetails(6275);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Column(
        children: [
          // BlocBuilder<MyCubit, States>(
          //   builder: (context, state) {
          //     if (state is GetAllUsersState) {
          //       usersList = state.allUsersList;
          //       return ListView.builder(
          //         shrinkWrap: true,
          //         itemCount: usersList.length,
          //         itemBuilder: (context, index) {
          //           return Container(
          //             height: 50.0,
          //             color: Colors.grey,
          //             child: Center(
          //               child: Text(usersList[index].name.toString()),
          //             ),
          //           );
          //         },
          //       );
          //     } else {
          //       return const Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     }
          //   },
          // ),

          BlocBuilder<MyCubit, States>(
            builder: (context, state) {
              if (state is GetUserDetailsState) {
                userDetails = state.userDetails;
                return Container(
                  height: 50.0,
                  color: Colors.grey,
                  child: Center(
                    child: Text(userDetails.name.toString()),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
