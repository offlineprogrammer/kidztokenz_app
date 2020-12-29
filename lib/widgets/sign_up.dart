import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kidztokenz_app/widgets/confirm_signup.dart';

class SignUpView extends StatefulWidget {
  final Function showConfirmSignUp;

  SignUpView(this.showConfirmSignUp);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  DateTime signupDate;

  String _signUpError = "";
  List<String> _signUpExceptions = [];

  @override
  void initState() {
    super.initState();
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
      Navigator.pop(context, true);
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

  void _signUp(BuildContext context) async {
    try {
      Map<String, dynamic> userAttributes = {
        "email": emailController.text.trim(),
        // additional attributes as needed
      };
      SignUpResult res = await Amplify.Auth.signUp(
          username: emailController.text.trim(),
          password: passwordController.text.trim(),
          options: CognitoSignUpOptions(userAttributes: userAttributes));

      print(res.isSignUpComplete);
      widget.showConfirmSignUp();

      /*     Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) {
            return ConfirmSignup();
          },
        ),
      ); */

      //  setState(() {
      // isSignUpComplete = res.isSignUpComplete;
      //  });
    } on AuthError catch (e) {
      print(e.toString);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
              controller: emailController,
            ),
            TextField(
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(labelText: 'Password'),
              controller: passwordController,
            ),
            FlatButton(
              textColor: Colors.black, // Theme.of(context).primaryColor,
              color: Colors.amber,
              onPressed: () => _signUp(context),
              child: Text(
                'Create Account',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              'Already registered? Sign In',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      ),
    );
  }
}
