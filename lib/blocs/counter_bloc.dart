import 'package:rxdart/rxdart.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class CounterBloc implements BlocBase {
  int _counter = 0;
  BehaviorSubject<int> _counterController = BehaviorSubject<int>();
  Observable<int> get outCounter => _counterController.stream.asBroadcastStream();
  // Sink<int> get inAdd => _counterController.sink;

 CounterBloc () {
   print('iniciou uma instancia do counterBloc');
 }

  void increaseCounter() {
    _counterController.sink.add(++_counter);
  }

  void decreaseCounter() {
    _counterController.sink.add(--_counter);
  }

  @override
  void dispose() {
    print('counter disposed');
    _counterController.close();
  }
}
///
/// Creating an instance to be used in the appBloc
/// This way I can separate the logic and I can access this object anywhere in my app
/// For more, see the flow of app_bloc.
/// There I make use of this object.
CounterBloc instanceCounterBloc = CounterBloc();