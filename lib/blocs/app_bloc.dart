import 'package:rxdart/rxdart.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:testapp/blocs/counter_bloc.dart';
import 'package:testapp/blocs/user_bloc.dart';

class AppBloc implements BlocBase {
  ///
  /// Instantiating the user and counter bloc
  /// notice that both will be available for all pages
  /// the downside is that they wont be disposed.
  UserBloc get userBloc => instanceUserBloc;
  CounterBloc get counterBloc => instanceCounterBloc;

 AppBloc () {
   print('iniciou uma instancia do AppBloc');
 }

  @override
  void dispose() {
    userBloc.dispose();
    counterBloc.dispose();
  }
  
}