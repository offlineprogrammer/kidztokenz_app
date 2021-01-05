import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';
import 'package:kidztokenz_app/models/User.dart';
import 'package:kidztokenz_app/models/kid.dart';
import 'package:kidztokenz_app/screens/kidz_screen.dart';

class ConfirmSignup extends StatelessWidget {
  final codeController = TextEditingController();
  final String userName;
  final Function setError;

  ConfirmSignup(this.userName, this.setError);

  void _skip_confirm_signup(BuildContext context) {
    _go_to_KidzScreen(context);
  }

  void _confirm_signup(BuildContext context) async {
    try {
      SignUpResult res = await Amplify.Auth.confirmSignUp(
          username: this.userName,
          confirmationCode: codeController.text.trim());

      _create_user();
    } on AuthError catch (e) {
      setError(e);
    }
  }

  void _create_user() async {
    try {
      User newUser = User(
          id: null,
          dateCreated: DateTime.now().toString(),
          fcmInstanceId: 'N/A',
          userEmail: this.userName,
          userId: 'N/A');

      await Amplify.DataStore.save(newUser);
      print("Created a user");
    } catch (e) {
      setError(e);
    }
  }

  void _go_to_KidzScreen(BuildContext context) {
/*     Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) {
          return KidzScreen();
        },
      ),
    ); */
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
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
            onPressed: () => _confirm_signup(context),
            child: Text(
              'Confirm Sign Up',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          FlatButton(
            onPressed: () => _skip_confirm_signup(context),
            child: Text(
              'I\'ll do it later ? Skip',
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
        ],
      ),
    );
  }
}
