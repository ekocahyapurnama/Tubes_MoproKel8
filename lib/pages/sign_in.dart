import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tubes_moprokel8/Dashboard/home.dart';
import 'package:tubes_moprokel8/pages/sign_up.dart';
import 'package:tubes_moprokel8/Services/AuthServices.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _key = GlobalKey<FormState>();

  final AuthServices _auth = AuthServices();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 80.0),
              Stack(
                children: <Widget>[
                  Positioned(
                    left: 20.0,
                    top: 15.0,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xfff7892b),
                          borderRadius: BorderRadius.circular(20.0)),
                      width: 70.0,
                      height: 20.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40.0),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 8.0),
                child: TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Email cannot be empty';
                    } else
                      return null;
                  },
                  decoration: InputDecoration(
                      labelText: "Email",
                      floatingLabelBehavior: FloatingLabelBehavior.always),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 8.0),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Password cannot be empty';
                    } else
                      return null;
                  },
                  decoration: InputDecoration(
                      labelText: "Password",
                      floatingLabelBehavior: FloatingLabelBehavior.always),
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(right: 16.0),
                  alignment: Alignment.centerRight,
                  child: Text("")),
              const SizedBox(height: 60.0),
              Align(
                alignment: Alignment.centerRight,
                child: RaisedButton(
                  padding: const EdgeInsets.fromLTRB(40.0, 16.0, 30.0, 16.0),
                  color: Color(0xfff7892b),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          bottomLeft: Radius.circular(30.0))),
                  onPressed: () {
                    if (_key.currentState.validate()) {
                      signInUser();
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "Sign In".toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                      ),
                      const SizedBox(width: 40.0),
                      Icon(
                        FontAwesomeIcons.arrowRight,
                        size: 18.0,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Center(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 20),
                        child: Text.rich(
                          TextSpan(text: 'Don\'t have an account? ', children: [
                            TextSpan(
                              text: 'SignUp',
                              style: TextStyle(color: Color(0xffEE7B23)),
                            ),
                          ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

  void signInUser() async {
    dynamic authResult =
        await _auth.loginUser(_emailController.text, _passwordController.text);
    if (authResult == null) {
      print('Sign in error. could not be able to login');
    } else {
      _emailController.clear();
      _passwordController.clear();
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }
  }
}
