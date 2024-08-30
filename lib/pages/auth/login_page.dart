import 'package:chatapp_firebase/pages/auth/register.dart';
import 'package:chatapp_firebase/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 60.0, vertical: 80),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Groupie',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Login now to see what they are talking!',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                    Image.asset('assets/groupie.jpg', height: 300, width: 300),
                    SizedBox(height: 10),
                    TextFormField(
                        decoration: textInputDecoration.copyWith(
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email,
                              color: Theme.of(context).primaryColor),
                        ),
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                        validator: (val) {
                          return RegExp(
                                      '^[a-zA-Z0-9]+([._-][0-9a-zA-Z]+)*@[a-zA-Z0-9]+([.-][0-9a-zA-Z]+)*\.[a-zA-Z]{2,}')
                                  .hasMatch(val!)
                              ? null
                              : 'print enter a valid email';
                        }),
                    SizedBox(height: 10),
                    TextFormField(
                      obscureText: true,
                      decoration: textInputDecoration.copyWith(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock,
                            color: Theme.of(context).primaryColor),
                      ),
                      validator: (val) {
                        if (val!.length < 6) {
                          return 'password must be atleast 6 characters';
                        } else {
                          return null;
                        }
                      },
                      onChanged: (val) {
                        setState(() {
                          password = val;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            login();
                          },
                          child: Text('Sign in',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text.rich(
                      TextSpan(
                        text: "Don't have an account?",
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Register here',
                              style: TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  nextScreen(context, const RegisterPage());
                                }),
                        ],
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  void login() {
    if (formKey.currentState!.validate()) {}
  }
}
