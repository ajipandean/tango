import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tango/shared/widgets/form_input.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                    'Register to Tango',
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
                      onPressed: () => _register(context),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: Text('Register'.toUpperCase()),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        elevation: 0,
                        primary: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: Text('Login'.toUpperCase()),
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

  void _register(BuildContext context) async {
    try {
      // register the user based on inputed email and password
      await _auth.createUserWithEmailAndPassword(
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
