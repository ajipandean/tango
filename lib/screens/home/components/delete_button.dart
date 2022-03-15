import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class DeleteButton extends StatelessWidget {
  DeleteButton({
    Key? key,
    required this.id,
  }) : super(key: key);

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final String id;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: OutlinedButton(
          onPressed: () => showDeleteBottomSheet(context),
          style: OutlinedButton.styleFrom(
            primary: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          child: Text('Delete'.toUpperCase()),
        ),
      ),
    );
  }

  void showDeleteBottomSheet(BuildContext context) {
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
                    'Are you sure want\'s to delete this card?',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Once delete, it can\'t be restored',
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => _delete(context),
                      style: OutlinedButton.styleFrom(
                        primary: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: Text('Delete'.toUpperCase()),
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

  void _delete(BuildContext context) async {
    try {
      _firestore.collection('cards').doc(id).delete();

      Navigator.pop(context);
    } on FirebaseException catch (error) {
      print('Failed with error code: ${error.code}');

      SnackBar snackBar = SnackBar(content: Text(error.message!));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
