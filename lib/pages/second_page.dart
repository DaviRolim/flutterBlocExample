import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:testapp/blocs/test_api_bloc.dart';
import 'package:testapp/models/test.dart';

class SecondPage extends StatelessWidget {
  SecondPage(this.testBloc);
  final TestBloc testBloc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: Center(
        child: Column(
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
