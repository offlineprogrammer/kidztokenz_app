import 'package:flutter/material.dart';
import 'package:kidztokenz_app/models/app_user.dart';
import 'package:kidztokenz_app/screens/landing_page.dart';
import 'package:provider/provider.dart';

// Generated in previous step
import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => AppUser(),
        ),
      ],
      child: MaterialApp(
        title: 'Kidz Tokenz',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: ThemeData.light().textTheme.copyWith(
                subtitle2: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontStyle: FontStyle.italic),
              ),
        ),
        home: LandingPage(),
      ),
    );
  }
}
