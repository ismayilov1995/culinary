import 'package:culinary_app/ui/screens/screens.dart';
import 'package:culinary_app/ui/widgets/text_field.dart';
import 'package:culinary_app/ui/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const pageID = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          primary: false,
          physics: BouncingScrollPhysics(),
          children: [
            _UserWelcomeRow(),
            _SearchRow(),
            _RecommendRecipesRow(),
            _LatestRecipesRow(),
          ],
        ),
      ),
    );
  }
}

class _LatestRecipesRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            'New Recipe',
            fontSize: 20,
            font: 'Poppins',
            fontWeight: FontWeight.w700,
          ),
          ListView(
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
              RecipeHorizontalCard(
                'Stalichny',
                person: '8',
                prepareTime: '40 min',
                imagePath: 'assets/images/haram2.png',
                onPressed: () => RecipeDetailScreen.route(context, 'Stalichny'),
              ),
              RecipeHorizontalCard(
                'Chicken Soup',
                person: '4',
                prepareTime: '1h 30m',
                imagePath: 'assets/images/haram3.png',
                onPressed: () =>
                    RecipeDetailScreen.route(context, 'Chicken Soup'),
              ),
              RecipeHorizontalCard(
                'Piti',
                person: '2',
                prepareTime: '3h',
                imagePath: 'assets/images/haram4.png',
                onPressed: () => RecipeDetailScreen.route(context, 'Piti'),
              ),
              RecipeHorizontalCard(
                'Dolma',
                person: '12',
                prepareTime: '2h',
                imagePath: 'assets/images/haram1.png',
                onPressed: () => RecipeDetailScreen.route(context, 'Dolma'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RecommendRecipesRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: AppText(
            'Recommended',
            fontSize: 20,
            font: 'Poppins',
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 250,
          child: ListView(
            padding: EdgeInsets.only(left: 20.0),
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            children: [
              RecommendCard(
                'Avocado',
                person: '12',
                prepareTime: '2h',
                imagePath: 'assets/images/haram1.png',
                onPressed: () => RecipeDetailScreen.route(context, 'Avocado'),
              ),
              RecommendCard(
                'Bozbash',
                person: '8',
                prepareTime: '2h',
                imagePath: 'assets/images/haram1.png',
                onPressed: () => RecipeDetailScreen.route(context, 'Bozbash'),
              ),
              RecommendCard(
                'Ayran',
                person: '10',
                prepareTime: '10 min',
                imagePath: 'assets/images/haram1.png',
                onPressed: () => RecipeDetailScreen.route(context, 'Ayran'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _UserWelcomeRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
          AppCircleAvatar()
        ],
      ),
    );
  }
}

class _SearchRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Expanded(
            child: AppTextField('Find recipes or chef',
                prefixIcon: Icon(Icons.search), onChanged: (v) {}),
          ),
          SizedBox(width: 20),
          SearchButton(
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
