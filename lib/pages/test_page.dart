import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:testapp/blocs/app_bloc.dart';
import 'package:testapp/blocs/test_api_bloc.dart';
import 'package:testapp/models/test.dart';
import 'package:testapp/models/user.dart';
import 'package:testapp/pages/second_page.dart';
import 'package:testapp/shared/widgets/sideDrawer.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TestBloc>(bloc: TestBloc(), child: TestPageBloc());
  }
}

class TestPageBloc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppBloc appBloc = BlocProvider.of<AppBloc>(context);
    final userBloc = appBloc.userBloc;
    final TestBloc testBloc = BlocProvider.of<TestBloc>(context);
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<Test>(
              initialData: Test.empty(),
              stream: testBloc.outTest,
              builder: (BuildContext context, AsyncSnapshot<Test> snapshot) {
                return Text(
                  '${snapshot.data.title}',
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
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
             RaisedButton(
              child: Text('Change Page'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => SecondPage(testBloc),
                  ),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: userBloc.changeUserName,
        onPressed: testBloc.callApi,
        tooltip: 'Increment',
        child: const Icon(Icons.train),
      ),
    );
  }
}
