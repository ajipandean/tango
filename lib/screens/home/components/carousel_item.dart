import 'package:flutter/material.dart';
import 'package:tango/screens/home/components/delete_button.dart';
import 'package:tango/screens/home/components/edit_button.dart';
import 'package:tango/screens/home/components/translation_item.dart';

class CarouselItem extends StatelessWidget {
  const CarouselItem({
    Key? key,
    required this.index,
    required this.currentCarouselIndex,
  }) : super(key: key);

  final int index;
  final int currentCarouselIndex;

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
                        '単語',
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                      const Text(
                        'tan go',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                const TranslationItem(
                  language: 'English',
                  translated: 'Vocabulary',
                ),
                const TranslationItem(
                  language: 'Indonesian',
                  translated: 'Kosa kata',
                ),
                const TranslationItem(
                  language: 'Spanish',
                  translated: 'Vocabulario',
                ),
                const TranslationItem(
                  language: 'France',
                  translated: 'Vocabulaire',
                ),
                if (index == currentCarouselIndex)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const <Widget>[
                          EditButton(),
                          SizedBox(width: 12),
                          DeleteButton(),
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
