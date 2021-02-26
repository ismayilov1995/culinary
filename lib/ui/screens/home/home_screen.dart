import 'package:culinary_app/ui/widgets/text_field.dart';
import 'package:culinary_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const pageID = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        'Good Morning',
                        color: kTextColor,
                      ),
                      AppText(
                        'Sebastian Vettel',
                        font: 'Pacifico',
                        fontSize: 26,
                      ),
                    ],
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        boxShadow: [
                          BoxShadow(color: Colors.grey, blurRadius: 6)
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              'https://i.pinimg.com/736x/89/46/30/89463056da62f4dbcb677c9310ad38bd.jpg',
                            ))),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: AppTextField('Find receipts or chef',
                        prefixIcon: Icon(Icons.search), onChanged: (v) {}),
                  ),
                  SizedBox(width: 20),
                  SearchButton(
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}
