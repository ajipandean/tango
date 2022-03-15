import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tango/shared/widgets/form_input.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String _moji = '';
  String _pronounciation = '';
  String _english = '';
  String _indonesian = '';
  String _spanish = '';
  String _french = '';

  @override
  Widget build(BuildContext context) {
    String? id = ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black87,
        title: Text(
          'Edit Card',
          style: GoogleFonts.pacifico(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () => _update(context, id!),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                FutureBuilder<DocumentSnapshot>(
                  future: _firestore.collection('cards').doc(id).get(),
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot,
                  ) {
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text('Error'),
                      );
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                        ),
                      );
                    }

                    Map<String, dynamic> data =
                        snapshot.data!.data() as Map<String, dynamic>;

                    _moji = data['moji'];
                    _pronounciation = data['pronounciation'];
                    _english = data['english'];
                    _indonesian = data['indonesian'];
                    _spanish = data['spanish'];
                    _french = data['french'];

                    return Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FormInput(
                            label: 'Japanese Moji',
                            initialValue: data['moji'],
                            onChanged: (String value) => _moji = value,
                          ),
                          const SizedBox(height: 16),
                          FormInput(
                            label: 'Pronounciation',
                            initialValue: data['pronounciation'],
                            onChanged: (String value) =>
                                _pronounciation = value,
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Translation',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          const SizedBox(height: 16),
                          FormInput(
                            label: 'English',
                            initialValue: data['english'],
                            onChanged: (String value) => _english = value,
                          ),
                          const SizedBox(height: 16),
                          FormInput(
                            label: 'Indonesian',
                            initialValue: data['indonesian'],
                            onChanged: (String value) => _indonesian = value,
                          ),
                          const SizedBox(height: 16),
                          FormInput(
                            label: 'Spanish',
                            initialValue: data['spanish'],
                            onChanged: (String value) => _spanish = value,
                          ),
                          const SizedBox(height: 16),
                          FormInput(
                            label: 'French',
                            initialValue: data['french'],
                            onChanged: (String value) => _french = value,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _update(BuildContext context, String id) async {
    try {
      Map<String, dynamic> fields = <String, dynamic>{
        'moji': _moji,
        'pronounciation': _pronounciation,
        'english': _english,
        'indonesian': _indonesian,
        'spanish': _spanish,
        'french': _french,
      };

      await _firestore.collection('cards').doc(id).update(fields);

      Navigator.pop(context);
    } on FirebaseException catch (error) {
      print('Failed with error code: ${error.code}');

      SnackBar snackBar = SnackBar(content: Text(error.message!));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
