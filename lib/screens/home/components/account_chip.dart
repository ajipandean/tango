import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AccountChip extends StatelessWidget {
  const AccountChip({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      backgroundColor: Colors.white,
      avatar: CircleAvatar(
        backgroundColor: Theme.of(context).primaryColor,
        child: const Text('A'),
      ),
      label: const Text('ajipandean@outlook.com'),
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
                  const Text('ajipandean@outlook.com'),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
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
}
