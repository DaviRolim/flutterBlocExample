import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:testapp/blocs/app_bloc.dart';
import 'package:testapp/blocs/counter_bloc.dart';
import 'package:testapp/blocs/user_bloc.dart';
import 'package:testapp/models/user.dart';
import 'package:testapp/shared/widgets/sideDrawer.dart';


class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    final AppBloc appBloc = BlocProvider.of<AppBloc>(context);
    final CounterBloc counterBloc = appBloc.counterBloc;
    UserBloc userBloc = appBloc.userBloc;
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: Text('User'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<User>(
              initialData: User.empty(),
              stream: userBloc.outUser,
              builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
                return Text(
                  '${snapshot.data.name}',
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
            StreamBuilder<int>(
              initialData: 0,
              stream: counterBloc.outCounter,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                return Text(
                  '${snapshot.data}',
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: userBloc.changeUserName,
        onPressed: () {
          userBloc.changeUserName();
          counterBloc.increaseCounter();
        },
        tooltip: 'changeIt',
        child: const Icon(Icons.track_changes),
      ),
    );
  }
}
