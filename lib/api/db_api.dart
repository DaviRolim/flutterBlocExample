import 'package:testapp/models/user.dart';

class DbApi{
  Future<User> getUser() async {
    await Future.delayed(Duration(seconds: 1));
    User _user = User('Davi, O Doutrinador', 12, 140.0);
    return _user;
  }
}

DbApi api = DbApi();