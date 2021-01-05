import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:flutter/material.dart';
// Amplify Flutter Packages
import 'package:amplify_core/amplify_core.dart';
import 'package:amplify_analytics_pinpoint/amplify_analytics_pinpoint.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
//import 'codegen/ModelProvider.dart';
import 'package:kidztokenz_app/screens/loading_screen.dart';
import 'package:kidztokenz_app/screens/main_screen.dart';

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
    return MaterialApp(
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
      home: MyHomePage(title: 'Kidz Tokenz Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _amplifyConfigured = false;
  Amplify amplifyInstance = Amplify();
  String userName;

  @override
  initState() {
    super.initState();
    _configureAmplify();
  }

  void _configureAmplify() async {
    // Add Pinpoint and Cognito Plugins, or any other plugins you want to use
    AmplifyAnalyticsPinpoint analyticsPlugin = AmplifyAnalyticsPinpoint();
    AmplifyAuthCognito authPlugin = AmplifyAuthCognito();
    amplifyInstance.addPlugin(
        authPlugins: [authPlugin], analyticsPlugins: [analyticsPlugin]);

    AmplifyDataStore datastorePlugin =
        AmplifyDataStore(modelProvider: ModelProvider.instance);
    amplifyInstance.addPlugin(dataStorePlugins: [datastorePlugin]);

    // Once Plugins are added, configure Amplify
    await amplifyInstance.configure(amplifyconfig);
    try {
      setState(() {
        _amplifyConfigured = true;
      });
    } catch (e) {
      print(e);
    }
  }

  Widget _display() {
    if (_amplifyConfigured) {
      return MainScreen();
    } else {
      return LoadingScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return _display();
  }
}
