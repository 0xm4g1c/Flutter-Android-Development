// ignore_for_file: avoid_print, use_build_context_synchronously, body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_authentication/Setup/Pages/sign_up.dart';
import 'package:flutter_authentication/Setup/Pages/home_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? _email, _password;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Text(
                  'Sign in',
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Become a Member — you\'ll enjoy exclusive deals,offers,invites and rewards. ',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(
                  height: 20,
                ),
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
                  height: 60,
                ),
                ElevatedButton(
                  onPressed: signIn,
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black, fixedSize: const Size(400, 50)),
                  child: const Text('SIGN IN'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUp()));
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(400, 50),
                      primary: Colors.transparent.withOpacity(0.09),
                      elevation: 0),
                  child: const Text(
                    'BECOME A MEMBER',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Future<void> signIn() async {
    final formState = _formkey.currentState;
    if (formState!.validate()) {
      formState.save();
      try {
        UserCredential result = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email!, password: _password!);

        User? user = result.user;
        if (user != null) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Home(user: user)));
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
                  child: Text(errorMessage.toString().substring(31, 55)),
                )));
      }
    }
  }
}
