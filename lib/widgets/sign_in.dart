import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';
import 'package:kidztokenz_app/widgets/error_view.dart';
import 'package:kidztokenz_app/widgets/kidz_screen.dart';

class SignInView extends StatefulWidget {
  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String _signUpError = "";
  List<String> _signUpExceptions = [];

  @override
  void initState() {
    super.initState();
  }

  void _setError(AuthError error) {
    setState(() {
      _signUpError = error.cause;
      _signUpExceptions.clear();
      error.exceptionList.forEach((el) {
        _signUpExceptions.add(el.exception);
      });
    });
  }

  void _signIn() async {
    // Sign out before in case a user is already signed in
    // If a user is already signed in - Amplify.Auth.signIn will throw an exception
    try {
      await Amplify.Auth.signOut();
    } on AuthError catch (e) {
      print(e);
    }

    try {
      SignInResult res = await Amplify.Auth.signIn(
          username: emailController.text.trim(),
          password: passwordController.text.trim());
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) {
            return KidzScreen();
          },
        ),
      );
    } on AuthError catch (e) {
      setState(() {
        _signUpError = e.cause;
        _signUpExceptions.clear();
        e.exceptionList.forEach((el) {
          _signUpExceptions.add(el.exception);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            // wrap your Column in Expanded
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Enter your email',
                      labelText: 'email *',
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.lock),
                      hintText: 'Enter your password',
                      labelText: 'Password *',
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(10.0)),
                  FlatButton(
                    textColor: Colors.black, // Theme.of(context).primaryColor,
                    color: Colors.amber,
                    onPressed: _signIn,
                    child: const Text(
                      'Sign In',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FlatButton(
                        height: 5,
                        onPressed: () {},
                        child: Text(
                          'Create Account',
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                      FlatButton(
                        height: 5,
                        onPressed: () {},
                        child: Text(
                          'Reset Password',
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                    ],
                  ),
                  ErrorView(_signUpError, _signUpExceptions)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
