import 'package:cristofer_flutter_template/app/widgets/widgets.dart';
import 'package:cristofer_flutter_template/constants.dart';
import 'package:flutter/material.dart';

class LoginFields extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  LoginFields({
    @required this.emailController,
    @required this.passwordController,
    @required this.formKey,
  });

  @override
  _LoginFieldsState createState() => _LoginFieldsState();
}

class _LoginFieldsState extends State<LoginFields> {
  final GlobalKey _emailKey = new GlobalKey();
  final GlobalKey _passwordKey = new GlobalKey();

  @override
  void initState() {
    super.initState();
    _autoLogin();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          RoundInput(
              key: _emailKey,
              label: "Email",
              controller: widget.emailController,
              hintText: 'Enter your email',
              icon: Icons.person_outline,
              keyboardType: TextInputType.emailAddress,
              validator: (String value) {
                RegExp regex = new RegExp(emailPattern);
                if (!regex.hasMatch(value))
                  return 'Enter a Valid Email';
                else
                  return null;
              }),
          RoundInput(
            key: _passwordKey,
            label: "Password",
            controller: widget.passwordController,
            hintText: 'Enter your password',
            icon: Icons.lock_open,
            obscureText: true,
            validator: (value) {
              return value.isEmpty ? 'Password is required' : null;
            },
          ),
          RoundFlatButton(label: 'LOGIN', onPressed: _onLoginButtonPressed),
        ],
      ),
    );
  }

  _onLoginButtonPressed() async {
    try {
      if (this.widget.formKey.currentState.validate()) {
        Navigator.pushReplacementNamed(context, homeRoute);
      }
    } catch (e) {
      print(e);

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text('Login Error'),
              content: new Text('Login Fail!'),
              actions: <Widget>[
                new FlatButton(
                  child: new Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }
  }

  _autoLogin() async {
    /*  final SharedPreferences prefs = await SharedPreferences.getInstance();
    String loggedUser = prefs.getString('loggedUser');
    if (loggedUser != null) {
      dynamic user = jsonDecode(prefs.getString('loggedUser'));
      print('last Logged user $user');
      widget.emailController.text = user['loginId'];
      widget.passwordController.text = user['password'];
      Timer(Duration(milliseconds: 10), _onLoginButtonPressed);
    } */
  }
}
