// ignore_for_file: use_build_context_synchronously, avoid_print, body_might_complete_normally_nullable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authentication/Setup/Pages/sign_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? _email, _password;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Sign Up',
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
            child: Column(
              children: [
                TextFormField(
                  validator: (input) {
                    if (input!.isEmpty) {
                      return 'Please input Email';
                    }
                  },
                  onSaved: (input) => _email = input!,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  expands: false,
                  validator: (input) {
                    if (input!.length < 6) {
                      return 'Your Password needs to be atleast 6 characters long';
                    }
                  },
                  onSaved: (input) => _password = input,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: signUp,
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(400, 50),
                      primary: Colors.black,
                      elevation: 0),
                  child: const Text(
                    'SIGN UP',
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void signUp() async {
    final formState = _formkey.currentState;
    try {
      if (formState!.validate()) {
        formState.save();

        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _email!, password: _password!);

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      }
    } catch (e) {
      Object errorMessage = e;
      showDialog(
          context: context,
          builder: (context) => Dialog(
                  child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(25),
                ),
                alignment: Alignment.center,
                width: 100,
                height: 100,
                child: Text(errorMessage
                    .toString()
                    .replaceAll('[firebase_auth/email-already-in-use]', '')),
              )));
    }
  }
}
