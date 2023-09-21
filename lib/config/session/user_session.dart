import 'package:restaurant/models/user/user_model.dart';

class UserSession {
  static final UserSession _instance = UserSession._internal();
  factory UserSession() => _instance;

  UserSession._internal();

  User? loggedInUser;

  void login(User user) {
    loggedInUser = user;
  }

  void logout() {
    loggedInUser = null;
  }

  bool isLoggedIn() {
    return loggedInUser != null;
  }
}
