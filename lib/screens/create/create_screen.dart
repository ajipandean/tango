import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tango/shared/widgets/form_input.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({Key? key}) : super(key: key);

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String _moji = '';
  String _pronounciation = '';
  String _english = '';
  String _indonesian = '';
  String _spanish = '';
  String _french = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black87,
        title: Text(
          'Create New Card',
          style: GoogleFonts.pacifico(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () => _add(context),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormInput(
                        label: 'Japanese Moji',
                        onChanged: (String value) => _moji = value,
                      ),
                      const SizedBox(height: 16),
                      FormInput(
                        label: 'Pronounciation',
                        onChanged: (String value) => _pronounciation = value,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Translation',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(height: 16),
                      FormInput(
                        label: 'English',
                        onChanged: (String value) => _english = value,
                      ),
                      const SizedBox(height: 16),
                      FormInput(
                        label: 'Indonesian',
                        onChanged: (String value) => _indonesian = value,
                      ),
                      const SizedBox(height: 16),
                      FormInput(
                        label: 'Spanish',
                        onChanged: (String value) => _spanish = value,
                      ),
                      const SizedBox(height: 16),
                      FormInput(
                        label: 'French',
                        onChanged: (String value) => _french = value,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _add(BuildContext context) async {
    try {
      // create new collection with data supplied by fields
      Map<String, dynamic> fields = <String, dynamic>{
        'moji': _moji,
        'pronounciation': _pronounciation,
        'english': _english,
        'indonesian': _indonesian,
        'spanish': _spanish,
        'french': _french,
        'userId': _auth.currentUser!.uid,
      };
      await _firestore.collection('cards').add(fields);

      Navigator.pop(context);
    } on FirebaseException catch (error) {
      print('Failed with error code: ${error.code}');

      SnackBar snackBar = SnackBar(content: Text(error.message!));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
