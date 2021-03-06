import 'package:culinary_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CreateRecipeScreen extends StatelessWidget {
  static const pageID = '/createRecipe';

  static route(BuildContext context) => Navigator.pushNamed(context, pageID);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: AppText('Dimdiy'),
      ),
    );
  }
}
