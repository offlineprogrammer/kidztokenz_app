import 'package:flutter/material.dart';
import 'package:kidztokenz_app/widgets/sign_in.dart';
import 'package:kidztokenz_app/widgets/sign_up.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

enum AccountStatus { sign_in, sign_up, reset_password, confirm_code }

class _MainScreenState extends State<MainScreen> {
  var _accountWidget = AccountStatus.sign_in;

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
                    child: SignInView(),
                  ),
                  Visibility(
                    visible: _accountWidget == AccountStatus.sign_up,
                    child: SignUpView(),
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
