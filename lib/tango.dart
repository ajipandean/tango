import 'package:flutter/material.dart';
import 'package:tango/screens/create/create_screen.dart';
import 'package:tango/screens/edit/edit_screen.dart';
import 'package:tango/screens/home/home_screen.dart';
import 'package:tango/screens/login/login_screen.dart';
import 'package:tango/screens/register/register_screen.dart';

class Tango extends StatelessWidget {
  const Tango({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF22577A),
        scaffoldBackgroundColor: const Color(0xFFFAFAFA),
      ),
      initialRoute: '/login',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => const HomeScreen(),
        '/create': (BuildContext context) => const CreateScreen(),
        '/edit': (BuildContext context) => const EditScreen(),
        '/login': (BuildContext context) => const LoginScreen(),
        '/register': (BuildContext context) => const RegisterScreen(),
      },
    );
  }
}
