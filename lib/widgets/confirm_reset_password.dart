import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';
import 'package:kidztokenz_app/screens/kidz_screen.dart';

class ConfirmResetPassword extends StatelessWidget {
  final codeController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final String userName;
  final Function setError;

  ConfirmResetPassword(this.userName, this.setError);

  void _confirm_password_reset(BuildContext context) async {
    try {
      await Amplify.Auth.confirmPassword(
          username: this.userName,
          newPassword: passwordController.text.trim(),
          confirmationCode: codeController.text.trim());
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) {
            return KidzScreen();
          },
        ),
      );
    } on AuthError catch (e) {
      setError(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          TextFormField(
            enableSuggestions: false,
            decoration: const InputDecoration(
              icon: Icon(Icons.email),
              hintText: 'Email',
              labelText: 'Email *',
            ),
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
          ),
          TextFormField(
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(
              icon: Icon(Icons.lock),
              hintText: 'New Password',
              labelText: 'New Password *',
            ),
            controller: passwordController,
          ),
          TextFormField(
              controller: codeController,
              decoration: const InputDecoration(
                icon: Icon(Icons.confirmation_number),
                hintText: 'The code we sent you',
                labelText: 'Confirmation Code *',
              )),
          FlatButton(
            textColor: Colors.black, // Theme.of(context).primaryColor,
            color: Colors.amber,
            onPressed: () => _confirm_password_reset(context),
            child: Text(
              'Sign In',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          FlatButton(
            onPressed: _displayCreateAccount,
            child: Text(
              'Create Account',
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
        ],
      ),
    );
  }

  void _displayCreateAccount() {
    // widget._displayAccountWidget('sign_up');
  }
}
