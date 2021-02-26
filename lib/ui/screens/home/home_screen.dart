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
              RecipeHorizontalCard(),
              RecipeHorizontalCard(),
              RecipeHorizontalCard(),
              RecipeHorizontalCard(),
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
              RecommendCard(),
              RecommendCard(),
              RecommendCard(),
              RecommendCard(),
              RecommendCard(),
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
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                border: Border.all(width: 4, color: Colors.white),
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 6)],
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://i.pinimg.com/736x/89/46/30/89463056da62f4dbcb677c9310ad38bd.jpg',
                    ))),
          )
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
