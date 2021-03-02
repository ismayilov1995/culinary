import 'package:culinary_app/ui/screens/detail/detail.dart';
import 'package:culinary_app/ui/widgets/app_circle_avatar.dart';
import 'package:culinary_app/ui/widgets/app_text.dart';
import 'package:culinary_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ChefDetailScreen extends StatelessWidget {
  static const pageID = '/chefDetail';

  static route(BuildContext context, String id) =>
      Navigator.pushNamed(context, pageID, arguments: id);

  ChefDetailScreen(this.id);

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(color: kBgColor),
          ),
          _ChefAboutRow(),
          _ChefsRecipes(),
        ],
      ),
    );
  }
}

class _ChefAboutRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppCircleAvatar(diameter: 160),
          AppText(
            'Charles Leclerc',
            font: 'Pacifico',
            fontSize: 26.0,
          ),
          AppText('Formula 1 youngest Chef', color: kTextColor),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite,
                size: 16,
                color: kTextColor,
              ),
              AppText('54', color: kTextColor),
              SizedBox(width: 20.0),
              Icon(Icons.face, size: 16, color: kTextColor),
              AppText('12 follower', color: kTextColor),
            ],
          ),
          SizedBox(height: 20),
          AppText(
            '\"Even kids will love this quick and easy fried rice, perfect for a weeknight meal. See notes section for Low FODMAP diet tip.\"',
            color: kTextColor,
            align: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _ChefsRecipes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleCardStruct(
      'Chef\'s recipes',
      padding: EdgeInsets.only(left: 20.0, top: 20.0),
      child: ListView(
        padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 20.0),
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: [
          RecipeHorizontalCard(
            'Dovğa 3 baci dolmasi plovlu qarabasaq',
            person: '6',
            prepareTime: '60 min',
            imagePath: 'assets/images/haram1.png',
            onPressed: () => RecipeDetailScreen.route(
                context, 'Dovğa 3 baci dolmasi plovlu qarabasaq'),
          ),
        ],
      ),
    );
  }
}
