import 'package:flutter/material.dart';
import 'package:flash_chat/components/text_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool showLoader = false;
  @override
  Widget build(BuildContext context) {
    print('showLoader $showLoader');
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showLoader,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                // fit: FlexFit.loose,
                child: Hero(
                  tag: 'flash',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextInput(
                hint: 'Enter your email',
                onChange: (value) {
                  email = value;
                },
              ),
              SizedBox(
                height: 8.0,
              ),
              TextInput(
                hint: "Enter your password",
                obscure: true,
                onChange: (value) {
                  password = value;
                },
              ),
              SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () async {
                      //Implement login functionality.
                      setState(() {
                        showLoader = true;
                      });
                      try {
                        var user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        setState(() {
                          showLoader = false;
                        });
                        Navigator.pushNamed(context, 'chat');
                      } catch (e) {
                        setState(() {
                          showLoader = false;
                        });
                        print(e);
                      }
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Log In',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
