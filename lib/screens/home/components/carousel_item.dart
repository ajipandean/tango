import 'package:flutter/material.dart';
import 'package:tango/screens/home/components/delete_button.dart';
import 'package:tango/screens/home/components/edit_button.dart';
import 'package:tango/screens/home/components/translation_item.dart';

class CarouselItem extends StatelessWidget {
  const CarouselItem({
    Key? key,
    required this.id,
    required this.data,
  }) : super(key: key);

  final String id;
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                width: 1,
                color: Colors.grey.withOpacity(0.2),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Text(
                        data['moji'],
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                      Text(
                        data['pronounciation'],
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                TranslationItem(
                  language: 'English',
                  translated: data['english'],
                ),
                TranslationItem(
                  language: 'Indonesian',
                  translated: data['indonesian'],
                ),
                TranslationItem(
                  language: 'Spanish',
                  translated: data['spanish'],
                ),
                TranslationItem(
                  language: 'France',
                  translated: data['french'],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        EditButton(id: id),
                        const SizedBox(width: 12),
                        DeleteButton(id: id),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
