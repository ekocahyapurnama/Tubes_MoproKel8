import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tubes_moprokel8/pages/sign_up.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 100.0),
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
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32, vertical: 8.0),
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Email",
                    floatingLabelBehavior: FloatingLabelBehavior.always),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32, vertical: 8.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Password",
                    floatingLabelBehavior: FloatingLabelBehavior.always),
              ),
            ),
            Container(
                padding: const EdgeInsets.only(right: 16.0),
                alignment: Alignment.centerRight,
                child: Text("Forgot your password?")),
            const SizedBox(height: 120.0),
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
                onPressed: () {},
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
                    child: Text.rich(
                      TextSpan(text: 'Don\'t have an account?', children: [
                        TextSpan(
                          text: 'Signup',
                          style: TextStyle(color: Color(0xffEE7B23)),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton.icon(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 30.0,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.red),
                  color: Colors.red,
                  highlightedBorderColor: Colors.red,
                  textColor: Colors.red,
                  icon: Icon(
                    FontAwesomeIcons.googlePlusG,
                    size: 18.0,
                  ),
                  label: Text("Google"),
                  onPressed: () {},
                ),
                const SizedBox(width: 10.0),
                OutlineButton.icon(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 30.0,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  highlightedBorderColor: Colors.indigo,
                  borderSide: BorderSide(color: Colors.indigo),
                  color: Colors.indigo,
                  textColor: Colors.indigo,
                  icon: Icon(
                    FontAwesomeIcons.facebookF,
                    size: 18.0,
                  ),
                  label: Text("Facebook"),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
