import 'package:rxdart/rxdart.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:testapp/models/test.dart';
import 'package:testapp/api/test_api.dart';

class TestBloc implements BlocBase {
  int _id = 1;
  BehaviorSubject<Test> _testController = BehaviorSubject<Test>();
  Observable<Test> get outTest => _testController.stream;
  Sink<Test> get _inTest => _testController.sink;

  TestBloc() {
    print('iniciou uma instancia do testBloc');
    api.getTestData(_id).then((test) {
      _inTest.add(test);
    });
  }

  void changeTestTitle() {
    final Test test = _testController.value;
    test.title = 'I am AMAZING!';
    _inTest.add(test);
  }

  void callApi() {
    api.getTestData(++_id).then((test) {
      _inTest.add(test);
    });
  }

  @override
  void dispose() {
    print('test disposed');
    _testController.close();
  }
}
