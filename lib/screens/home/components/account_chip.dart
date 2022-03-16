import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AccountChip extends StatelessWidget {
  AccountChip({
    Key? key,
  }) : super(key: key);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      backgroundColor: Colors.white,
      avatar: CircleAvatar(
        backgroundColor: Theme.of(context).primaryColor,
        child: const Text('A'),
      ),
      label: Text(_auth.currentUser?.email ?? '-'),
      onPressed: () => showAccountBottomSheet(context),
    );
  }

  void showAccountBottomSheet(BuildContext context) {
    showMaterialModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Wrap(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Logged in as'.toUpperCase(),
                    style: Theme.of(context).textTheme.overline,
                  ),
                  const SizedBox(height: 8),
                  Text(_auth.currentUser?.email ?? '-'),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => _logout(context),
                      style: OutlinedButton.styleFrom(
                        primary: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: Text('Logout'.toUpperCase()),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  void _logout(BuildContext context) async {
    try {
      // sign out currently logged in user
      await _auth.signOut();

      Navigator.pushNamedAndRemoveUntil(
        context,
        '/login',
        (Route<dynamic> route) => false,
      );
    } on FirebaseException catch (error) {
      print('Failed with error code: ${error.code}');

      SnackBar snackBar = SnackBar(content: Text(error.message!));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
