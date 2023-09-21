import 'package:collection/collection.dart';

import 'package:restaurant/models/user/user_model.dart';

class UserService {
  static final List<User> users = [];

  void addUser(User user) {
    users.add(user);
  }

  User? findUser(String username, String password) {
    return users.firstWhereOrNull(
        (user) => user.username == username && user.password == password);
  }
}
