import 'package:flutter/material.dart';

class TranslationItem extends StatelessWidget {
  const TranslationItem({
    Key? key,
    required this.language,
    required this.translated,
  }) : super(key: key);

  final String language;
  final String translated;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.symmetric(
        vertical: 0,
        horizontal: 16,
      ),
      visualDensity: const VisualDensity(
        horizontal: 0,
        vertical: -4,
      ),
      title: Text(
        language,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      trailing: Text(
        translated,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontWeight: FontWeight.normal,
              color: Colors.grey.shade700,
            ),
      ),
    );
  }
}
