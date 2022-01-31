import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';


//import 'amplifyconfiguration.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({ Key? key }) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isSignedIn = false;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final codeController = TextEditingController();
  void registerAccount() async {
    Map<CognitoUserAttributeKey, String> userAttributes = {
        CognitoUserAttributeKey.email: usernameController.text,
      };
    await Amplify.Auth.signUp(
      username: usernameController.text, 
      password: passwordController.text, 
      options: CognitoSignUpOptions(
      userAttributes: userAttributes)
      );
  }
  void confirmSignUp() async{
    await Amplify.Auth.confirmSignUp(username: usernameController.text, confirmationCode: codeController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(    
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: <Widget>[
              Text(
                "Registrier dich :)",
                style: TextStyle(fontSize: 24, fontFamily: 'Gilroy', fontWeight: FontWeight.w600),
                ),
              TextField
              (
                controller: usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
              TextField
              (
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              TextButton(
                      onPressed: registerAccount,
                      child: Text(
                        "Registrieren",
                      ),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.black
                      )
                    ),
              const SizedBox(height: 40,),
              TextField
              (
                controller: codeController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Dein Bestätigungscode',
                ),
              ),
              TextButton(
                onPressed: confirmSignUp,
                child: Text(
                  "Code Bestätigen",
                ),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.black
                )
              ),
            ],
          ),
        ),
      )
    );
  }
}