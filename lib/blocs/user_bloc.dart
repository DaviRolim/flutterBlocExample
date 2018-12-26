import 'package:rxdart/rxdart.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:testapp/models/user.dart';
import 'package:testapp/api/db_api.dart';

class UserBloc implements BlocBase {
  BehaviorSubject<User> _userController = BehaviorSubject<User>();
  Observable<User> get outUser => _userController.stream;
  Sink<User> get _inUser => _userController.sink;

  UserBloc() {
    print('iniciou uma instancia do userBloc');
    api.getUser().then((user) {
      _inUser.add(user);
    });
  }

  void changeUserName() {
    final User user = _userController.value;
    user.name = 'Rodolpho';
    _userController.sink.add(user);
  }

  @override
  void dispose() {
    print('disposed user');
    _userController.close();
  }
}
///
/// Creating an instance to be used in the globalBloc
/// This way I can separate the logic and I can access this object anywhere in my app
/// For more, see the flow of app_bloc.
/// There I make use of this object.
UserBloc instanceUserBloc = UserBloc(); 
