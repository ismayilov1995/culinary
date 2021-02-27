import 'package:culinary_app/ui/screens/screens.dart';
import 'package:culinary_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RecipeDetailScreen extends StatelessWidget {
  static const pageID = '/recipe';

  static route(BuildContext context, String id) =>
      Navigator.pushNamed(context, pageID, arguments: id);

  RecipeDetailScreen(this.selectedRecipe);

  final String selectedRecipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: _scaffoldBackground(
            child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              iconTheme: IconThemeData(color: kBgColor),
            ),
            _MealOverview(selectedRecipe),
            _ChefInformationCard(),
            _IngredientsRow(),
            _PrepareRow(),
          ],
        )));
  }

  Widget _scaffoldBackground({Widget child}) {
    return Stack(
      children: [
        Container(
            height: 200,
            child: Image.asset(
              'assets/images/haram1.png',
              height: 400,
              width: 400,
              fit: BoxFit.cover,
            )),
        Container(
          height: 200,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white.withOpacity(0), Colors.white])),
        ),
        child
      ],
    );
  }
}

class _MealOverview extends StatelessWidget {
  _MealOverview(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Image.asset('assets/images/haram1.png', height: size.width * 0.6),
          AppText(
            title,
            font: 'Poppins',
            fontSize: 28,
            fontWeight: FontWeight.w700,
            align: TextAlign.center,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (i) => i)
                  .map((e) => Icon(Icons.grade, color: Colors.yellow[600]))
                  .toList()),
          AppText(
            '\"Even kids will love this quick and easy fried rice, perfect for a weeknight meal. See notes section for Low FODMAP diet tip.\"',
            color: kTextColor,
            align: TextAlign.center,
          ),
          SizedBox(height: 10.0),
          Center(child: BriefInfoWidget('60 min', '12', color: Colors.black)),
        ],
      ),
    );
  }
}

class _ChefInformationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(kAppRadius),
        boxShadow: [kCardShadow],
      ),
      child: ListTile(
        leading: AppCircleAvatar(),
        title: AppText(
          'Sebastian Vettel',
          font: 'Pacifico',
          fontSize: 20,
        ),
        subtitle: AppText(
          'Professional Chef',
          color: kTextColor,
        ),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () => ChefDetailScreen.route(context, 'chefID'),
      ),
    );
  }
}

class _IngredientsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleCardStruct(
      'Ingredients',
      child: SizedBox(
        height: 120,
        child: ListView(
          padding: EdgeInsets.only(left: 20.0),
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          children: [
            IngredientCard(),
            IngredientCard(),
            IngredientCard(),
            IngredientCard(),
            IngredientCard(),
            IngredientCard(),
            IngredientCard(),
          ],
        ),
      ),
    );
  }
}

class _PrepareRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleCardStruct(
      'Directions',
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 20.0),
        child: AppText(
          'Place pork chops in a multi-functional pressure cooker (such as Instant Pot®);\ntop with butter. Sprinkle onion soup mix over pork chops. Pour in apple juice.'
          '\nClose and lock the lid. Select high pressure according to manufacturer\'s instructions; set timer for 5 minutes. Allow 10 to 15 minutes for pressure to build.'
          '\nRelease pressure using the natural-release method according to manufacturer\'s instructions, 10 to 40 minutes.',
          align: TextAlign.center,
          font: 'Poppins',
          fontSize: 16,
        ),
      ),
    );
  }
}
