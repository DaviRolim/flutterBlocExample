import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:testapp/blocs/app_bloc.dart';
import 'package:testapp/blocs/counter_bloc.dart';
import 'package:testapp/shared/widgets/sideDrawer.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final AppBloc AppBloc = BlocProvider.of<AppBloc>(context);
    final AppBloc appBloc = BlocProvider.of<AppBloc>(context);
    final CounterBloc counterBloc = appBloc.counterBloc;
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
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
        onPressed: counterBloc.increaseCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
