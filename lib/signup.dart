import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginandsignup/homepage.dart';
import 'package:loginandsignup/user_auth/firebase_auth_implementation/firebase_auth_services.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyWidget(
            email: _email.text,
          ),
        ),
      );
      String email = _email.text;
      String password = _password.text;

      User? user = await _auth.signUpWithEmailAndPassword(email, password);

      if (user != null) {
        print('User signed up');
      } else {
        print('User not signed up');
      }
    }
  }

  // void _signUp() async {
  //   String email = _email.text;
  //   String password = _password.text;

  //   User? user = await _auth.signUpWithEmailAndPassword(email, password);

  //   if (user != null) {
  //     print('User signed up');
  //   } else {
  //     print('User not signed up');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(100.0, 0, 100.0, 0),
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  width: 400,
                  child: Image.asset('assets/images/logo.png'),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(
                    label: Text("Enter Your Email"),
                    hintText: "Email",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!RegExp(
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                        .hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _password,
                  decoration: const InputDecoration(
                    label: Text("Enter Your Password"),
                    hintText: "Password",
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (!RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
                        .hasMatch(value)) {
                      return 'must contain 8 characters, one uppercase letter, one lowercase letter.';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _confirmPassword,
                  decoration: const InputDecoration(
                    label: Text("Confirm Password"),
                    hintText: "Confirm Password",
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  // ignore: body_might_complete_normally_nullable
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (!RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
                        .hasMatch(value)) {
                      return 'must contain 8 characters, one uppercase letter, one lowercase letter.';
                    } else if (value != _password.text) {
                      return "The password doesn't match!";
                    } else if (value == _password.text) {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: _submit,
                  child: const Text("Sign Up"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
