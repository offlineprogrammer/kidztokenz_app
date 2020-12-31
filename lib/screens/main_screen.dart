import 'package:flutter/material.dart';
import 'package:kidztokenz_app/widgets/reset_password.dart';
import 'package:kidztokenz_app/widgets/sign_in.dart';
import 'package:kidztokenz_app/widgets/sign_up.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

enum AccountStatus { sign_in, sign_up, reset_password, confirm_code }

class _MainScreenState extends State<MainScreen> {
  var _accountWidget = AccountStatus.sign_in;

  void _displayAccountWidget(String accountStatus) {
    setState(() {
      switch (accountStatus) {
        case 'sign_in':
          _accountWidget = AccountStatus.sign_in;
          break;
        case 'sign_up':
          _accountWidget = AccountStatus.sign_up;
          break;
        case 'reset_password':
          _accountWidget = AccountStatus.reset_password;
          break;
        case 'confirm_code':
          _accountWidget = AccountStatus.confirm_code;
          break;
        default:
          _accountWidget = AccountStatus.sign_up;
      }
    });
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
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
