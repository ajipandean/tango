import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tango/shared/widgets/form_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  Text(
                    'Login to Tango',
                    style: GoogleFonts.pacifico(fontSize: 40),
                  ),
                  const SizedBox(height: 24),
                  FormInput(
                    label: 'Email',
                    prefixIcon: Icon(
                      Icons.alternate_email,
                      color: Theme.of(context).primaryColor,
                    ),
                    onChanged: (String value) => _email = value,
                  ),
                  const SizedBox(height: 16),
                  FormInput(
                    label: 'Password',
                    obscureText: true,
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Theme.of(context).primaryColor,
                    ),
                    onChanged: (String value) => _password = value,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _login(context),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: Text('Login'.toUpperCase()),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => Navigator.pushNamed(
                        context,
                        '/register',
                      ),
                      style: OutlinedButton.styleFrom(
                        elevation: 0,
                        primary: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: Text('Register'.toUpperCase()),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _login(BuildContext context) async {
    try {
      // sign the user in based on inputed email and password
      await _auth.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/',
        (Route<dynamic> route) => false,
      );
    } on FirebaseException catch (error) {
      print('Failed with error code: ${error.code}');

      SnackBar snackBar = SnackBar(content: Text(error.message!));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
