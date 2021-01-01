import 'package:flutter/material.dart';
import 'package:kidztokenz_app/account_screens_enum.dart';
import 'package:kidztokenz_app/widgets/reset_password.dart';
import 'package:kidztokenz_app/widgets/sign_in.dart';
import 'package:kidztokenz_app/widgets/sign_up.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _accountWidget = AccountStatus.sign_in;

  void _displayAccountWidget(int accountStatus) {
    setState(() {
      _accountWidget = AccountStatus.values[accountStatus];
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
