import 'package:flutter/material.dart';
import 'package:restaurant/config/session/user_session.dart';
import 'package:restaurant/models/user/user_model.dart';
import 'package:restaurant/pages/main/main_page.dart';
import 'package:restaurant/pages/register/register_page.dart';
import 'package:restaurant/services/user/user_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool acceptedTerms = false;

  @override
  void initState() {
    super.initState();
    checkTermsAcceptance();
  }

  void checkTermsAcceptance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasAcceptedTerms = prefs.getBool('accepted_terms') ?? false;

    setState(() {
      acceptedTerms = hasAcceptedTerms;
    });

    if (!hasAcceptedTerms) {
      showTermsPopup();
    }
  }

  void showTermsPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Terms and Agreement"),
          content:
              const Text("Ini adalah teks syarat dan ketentuan aplikasi Anda."),
          actions: <Widget>[
            TextButton(
              child: const Text("Tolak"),
              onPressed: () {
                Navigator.of(context).pop();
                showToast("Anda harus menerima syarat dan ketentuan.");
              },
            ),
            TextButton(
              child: const Text("Terima"),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setBool('accepted_terms', true);
                Navigator.of(context).pop();
                showToast("Terima kasih telah menerima syarat dan ketentuan.");
              },
            ),
          ],
        );
      },
    );
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
    );
  }

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _userService = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true, title: const Text("Login to Find Restaurants")),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/icons/restaurant_icon.png", height: 150),
              const SizedBox(height: 20),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final username = _usernameController.text.trim();
                  final password = _passwordController.text.trim();
                  User? user = _userService.findUser(username, password);
                  if (user != null) {
                    UserSession().loggedInUser = user;
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Successfully logged in!'),
                    ));
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const MainPage()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Invalid username or password!'),
                    ));
                  }
                },
                child: const Text("Login"),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Don't have an account? "),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()),
                      );
                    },
                    child: const Text('Register'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
