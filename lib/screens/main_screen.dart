import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';
import 'package:kidztokenz_app/account_screens_enum.dart';
import 'package:kidztokenz_app/widgets/reset_password.dart';
import 'package:kidztokenz_app/widgets/sign_in.dart';
import 'package:kidztokenz_app/widgets/sign_up.dart';

import 'kidz_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _accountWidget;

  @override
  initState() {
    super.initState();
    _fetchSession();
  }

  void _fetchSession() async {
    try {
      CognitoAuthSession res = await Amplify.Auth.fetchAuthSession(
          options: CognitoSessionOptions(getAWSCredentials: false));

      print('Session');

      if (res.isSignedIn) {
        print('Main');
        _go_to_KidzScreen();
      } else {
        _accountWidget = AccountStatus.sign_in.index;
        _displayAccountWidget(_accountWidget);
        print('Sing');
      }
    } on AuthError catch (e) {
      print(e);
    }
  }

  void _displayAccountWidget(int accountStatus) {
    setState(() {
      _accountWidget = AccountStatus.values[accountStatus];
    });
  }

  void _go_to_KidzScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) {
          return KidzScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kidz Tokenz'),
      ),
      body: Container(
        color: Color(0xff90CCE6),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                color: Color(0xff90CCE6),
                height: 200,
                child: Image.asset(
                  'assets/images/storeicon.png',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  Visibility(
                    visible: _accountWidget == AccountStatus.sign_in,
                    child: SignInView(_displayAccountWidget),
                  ),
                  Visibility(
                    visible: _accountWidget == AccountStatus.sign_up,
                    child: SignUpView(_displayAccountWidget),
                  ),
                  Visibility(
                    visible: _accountWidget == AccountStatus.reset_password,
                    child: ResetPasswordView(_displayAccountWidget),
                  ),
                  Visibility(
                    visible: _accountWidget == AccountStatus.main_screen,
                    child: KidzScreen(),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
