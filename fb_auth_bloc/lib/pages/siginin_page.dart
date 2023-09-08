import 'package:fb_auth_bloc/shared/widget/app_elevated_button.dart';
import 'package:fb_auth_bloc/shared/widget/app_text_form_field.dart';
import 'package:flutter/material.dart';

import 'pages.dart';

class SigninPage extends StatefulWidget {
  static const String routeName = '/signin';
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  final _passwordController = TextEditingController();
  String? _name, _email, _password;

  void _submit() {
    setState(() {
      _autovalidateMode = AutovalidateMode.always;
    });

    final form = _formKey.currentState;

    if (form == null || !form.validate()) return;

    form.save();

    print('email: $_email, password: $_password');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Form(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Image.asset(
                    'assets/images/flutter_logo.png',
                    width: 250,
                    height: 250,
                  ),
                  const SizedBox(height: 20.0),
                  AppTextFormField(
                    labelText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: const Icon(Icons.email),
                    onSaved: (String? value) {
                      _email = value;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  AppTextFormField(
                    labelText: 'Email',
                    textEditingController: _passwordController,
                    prefixIcon: const Icon(Icons.password),
                    onSaved: (String? value) {
                      _password = value;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  AppElevatedButton(
                    onPressed: _submit,
                    text: 'Sign in',
                  ),
                  const SizedBox(height: 10.0),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SignupPage.routeName);
                    },
                    child: Text('Not a member? Sign Up!'),
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
