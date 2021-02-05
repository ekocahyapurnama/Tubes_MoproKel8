import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tubes_moprokel8/Services/AuthServices.dart';
import 'package:tubes_moprokel8/pages/sign_in.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _key = GlobalKey<FormState>();

  final AuthServices _auth = AuthServices();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailContoller = TextEditingController();
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
                      "Sign Up",
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 8.0),
                child: TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      labelText: "Name",
                      floatingLabelBehavior: FloatingLabelBehavior.always),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 8.0),
                child: TextFormField(
                  controller: _emailContoller,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Email cannot be empty';
                    } else
                      return null;
                  },
                  //obscureText: true,
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Text.rich(
                  TextSpan(children: [
                    TextSpan(
                        text:
                            "By clicking Sign Up you agree to the following "),
                    TextSpan(
                        text: "Terms and Conditions",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.indigo)),
                    TextSpan(text: " withour reservations."),
                  ]),
                ),
              ),
              const SizedBox(height: 60),
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
                      createUser();
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "Sign Up".toUpperCase(),
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
                            MaterialPageRoute(builder: (context) => SignIn()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 20),
                        child: Text.rich(
                          TextSpan(text: 'Back To SignIn? ', children: [
                            TextSpan(
                              text: 'SignIn',
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

  void createUser() async {
    dynamic result = await _auth.createNewUser(
        _nameController.text, _emailContoller.text, _passwordController.text);
    if (result == null) {
      print('Email is not valid');
    } else {
      print(result.toString());
      _nameController.clear();
      _passwordController.clear();
      _emailContoller.clear();
      Navigator.pop(context);
    }
  }
}
