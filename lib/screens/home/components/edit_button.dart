import 'package:flutter/material.dart';

class EditButton extends StatelessWidget {
  const EditButton({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: OutlinedButton(
          onPressed: () => Navigator.pushNamed(
            context,
            '/edit',
            arguments: id,
          ),
          style: OutlinedButton.styleFrom(
            primary: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          child: Text('Edit'.toUpperCase()),
        ),
      ),
    );
  }
}
