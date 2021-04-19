import 'package:flutter/material.dart';
import 'package:kidztokenz_app/models/app_user.dart';
import 'package:kidztokenz_app/screens/kidz_screen.dart';
import 'package:kidztokenz_app/screens/sign_in_page.dart';

import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appUser = context.watch<AppUser>().isSignedIn;
    print(appUser);
    return appUser ? KidzScreen() : SignInPage();
  }
}
