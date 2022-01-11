import 'package:flutter/material.dart';
import 'package:practice_classy_ecom/key_board_Util.dart';
import 'package:practice_classy_ecom/screens/homePage.dart';
import 'package:practice_classy_ecom/services/productApiService.dart';
import 'package:practice_classy_ecom/widgets/default_button.dart';
import 'package:provider/provider.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {

  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
        child: Column(
          children: [
            buildEmailFormField(),
            SizedBox(height: 30),
            buildPasswordFormField(),
            SizedBox(height: 30),
            DefaultButton(
              text: "Continue",
              press: ()async{
                if(_formKey.currentState!.validate()){
                  _formKey.currentState!.save();
                  KeyboardUtil.hideKeyboard(context);
                  final signInRes=Provider.of<ApiRequest>(context,listen: false);
                  signInRes.SignInApiRequest(
                    {
                      "email": email.toString(),
                      "password": password.toString()
                    }
                  ).then((value){
                    print(">>>>>>>>>>>>>>>>>"+value);
                    Navigator.pushNamed(context, HomePage.routeName);
                  });
                }
              },
            )
          ],
        )
    );
  }




  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {

      },
      validator: (value) {

      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }



  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {

      },
      validator: (value) {

      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
