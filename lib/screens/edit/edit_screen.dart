import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tango/shared/widgets/form_input.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            onPressed: () => Navigator.pop(context),
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
                      const FormInput(
                        label: 'Japanese Moji',
                        initialValue: '単語',
                      ),
                      const SizedBox(height: 16),
                      const FormInput(
                        label: 'Pronounciation',
                        initialValue: 'tan go',
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Translation',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(height: 16),
                      const FormInput(
                        label: 'English',
                        initialValue: 'Vocabulary',
                      ),
                      const SizedBox(height: 16),
                      const FormInput(
                        label: 'Indonesian',
                        initialValue: 'Kosa kata',
                      ),
                      const SizedBox(height: 16),
                      const FormInput(
                        label: 'Spanish',
                        initialValue: 'Vocabulario',
                      ),
                      const SizedBox(height: 16),
                      const FormInput(
                        label: 'French',
                        initialValue: 'Vocabulaire',
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
}
