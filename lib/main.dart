// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:matchmap_app/providers/event_data_provider.dart';
import 'package:matchmap_app/providers/filter_provider.dart';
import 'package:matchmap_app/providers/map_style_provider.dart';
import 'package:matchmap_app/providers/marker_providers.dart';
import 'package:matchmap_app/screens/homescreen/home.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'amplifyconfiguration.dart';

import 'core/auth/register.dart';
import 'core/auth/sign_in.dart';
import 'widgets/bottom_navigator.dart';

void main() {
  runApp(const MatchMapApp());
}

class MatchMapApp extends StatefulWidget {
  const MatchMapApp({Key? key}) : super(key: key);

  @override
  _MatchMapAppState createState() => _MatchMapAppState();
}

class _MatchMapAppState extends State<MatchMapApp> {
  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  Future<void> _configureAmplify() async {
    try {
      // Add the following line to add Auth plugin to your app.
      await Amplify.addPlugin(AmplifyAuthCognito());

      // call Amplify.configure to use the initialized categories in your app
      await Amplify.configure(amplifyconfig);
      debugPrint('Successfully configured');
    } on Exception catch (e) {
      debugPrint('An error occurred configuring Amplify: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: MarkerProvider(),
        ),
        ChangeNotifierProvider.value(
          value: MapStyleProvider(),
        ),
        ChangeNotifierProvider.value(
          value: EventDataProvider(),
        ),
        ChangeNotifierProvider.value(
          value: FilterProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: HomeScreen(),
      ),
    );
  }
}

Map<CognitoUserAttributeKey, String> userAttributes = {
  CognitoUserAttributeKey.email: 'email@email.com',
};

String _email = "flutterexp@gmail.com";
String _password = "12345678";
void registerAccount() async {
  await Amplify.Auth.signUp(
      username: _email,
      password: _password,
      options: CognitoSignUpOptions(userAttributes: userAttributes));
}

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  // bool isSignedIn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        bottomNavigationBar: CustomBottom(),
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Skip",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.right,
              ),
              //Image(image: AssetImage("assets/peace.png"),),
              Text(
                "✌🏻",
                style: TextStyle(
                  fontSize: 64,
                  backgroundColor: Colors.white,
                ),
                textAlign: TextAlign.left,
              ),
              const Text(
                "Hey, willkommen bei\nMatchMap.",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    fontFamily: 'Gilroy',
                    color: Colors.black),
              ),
              SizedBox(height: 50),
              Text(
                "Entdecke Spiele, Tuniere und Partien deiner lieblings Vereine, Machschaften, Ligen oder Spieler.",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 60),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpScreen(),
                      ),
                    );
                  },
                  child: Text("Registrieren"),
                  style: TextButton.styleFrom(
                      primary: Colors.white, backgroundColor: Colors.black)),
              ConstrainedBox(
                constraints: new BoxConstraints(
                  maxHeight: 40,
                ),
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 4),
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.white),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignInScreen()));
                        },
                        child: Text("Anmelden"),
                        style: TextButton.styleFrom(
                          primary: Colors.black,
                        ))),
              ),
            ],
          ),
        )));
  }
}
