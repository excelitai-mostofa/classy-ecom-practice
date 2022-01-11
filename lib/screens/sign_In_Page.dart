import 'package:flutter/material.dart';
import 'package:practice_classy_ecom/widgets/signIn_Form.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),


      body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "Welcome Back",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Sign in with your email and password",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20), //SizeConfig.screenHeight * 0.08),
                    SignInForm(),
                    SizedBox(height: 20), //SizeConfig.screenHeight * 0.08),
                    SizedBox(
                      height: 20, //getProportionateScreenHeight(20),
                    ),
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}
