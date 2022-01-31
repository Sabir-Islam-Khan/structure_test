import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({ Key? key }) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isSignedIn = false;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  void signInAccount() async {
    try {
      print(usernameController.text);
          SignInResult res = await Amplify.Auth.signIn(
            username : usernameController.text,
            password : passwordController.text
            //username: usernameController.text.trim(),
            //password: passwordController.text.trim(),
          );
          setState(() {
            isSignedIn = res.isSignedIn;
            print("Signed in Status: $isSignedIn" );
          });
        } on AuthException catch (e) {
          print(e.message);
        }
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
                "Meld dich an :)",
                style: TextStyle(fontSize: 24, fontFamily: 'Gilroy', fontWeight: FontWeight.w600),
                ),
              TextField
              (
                controller: usernameController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
              const TextField
              (
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              TextButton(
                      onPressed: signInAccount,
                      child: Text(
                        "Anmelden",
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
