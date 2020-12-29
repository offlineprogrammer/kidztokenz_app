import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';

class ConfirmSignup extends StatelessWidget {
  final codeController = TextEditingController();
  final String userName;

  ConfirmSignup(this.userName);

  void _confirm_signup(BuildContext context) async {
    try {
      SignUpResult res = await Amplify.Auth.confirmSignUp(
          username: this.userName,
          confirmationCode: codeController.text.trim());
    } on AuthError catch (e) {
      print(e);
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
              decoration: InputDecoration(labelText: 'Verification code'),
              controller: codeController,
            ),
            FlatButton(
              textColor: Colors.black, // Theme.of(context).primaryColor,
              color: Colors.amber,
              onPressed: () => _confirm_signup(context),
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
