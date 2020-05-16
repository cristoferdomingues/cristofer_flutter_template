import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'loginCreateAccountButton_widget.dart';
import 'loginFields_widget.dart';

class LoginForm extends StatefulWidget {
  LoginForm();
  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final AssetImage backgroundImage = new AssetImage(DotEnv().env['APP_LOGO']);
  @override
  Widget build(BuildContext context) {
    print(DotEnv().env);
    return new Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                image: new DecorationImage(
                  image: this.backgroundImage,
                  fit: BoxFit.contain,
                ),
              ),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            flex: 4,
            child: Form(
                key: _formKey,
                child: LoginFields(
                  emailController: _emailController,
                  passwordController: _passwordController,
                  formKey: _formKey,
                )),
          ),
          Expanded(flex: 1, child: CreateAccountButton())
        ],
      ),
    );
  }
}
