import 'package:culinary_app/models/models.dart';
import 'package:culinary_app/ui/screens/screens.dart';
import 'package:culinary_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:culinary_app/blocs/blocs.dart';

class RecipeDetailScreen extends StatelessWidget {
  static const pageID = '/recipe';

  static route(BuildContext context, String id) =>
      Navigator.pushNamed(context, pageID, arguments: id);

  RecipeDetailScreen(this.selectedRecipe);

  final String selectedRecipe;

  @override
  Widget build(BuildContext context) {
    context.read<RecipeBloc>().add(LoadRecipe(this.selectedRecipe));
    return Scaffold(
        backgroundColor: Colors.white,
        body: _scaffoldBackground(child: BlocBuilder<RecipeBloc, RecipeState>(
          builder: (context, state) {
            if (state is SuccessLoadRecipe) {
              return ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    iconTheme: IconThemeData(color: kBgColor),
                  ),
                  _MealOverview(state.recipe),
                  _ChefInformationCard(state.recipe.chef),
                  _IngredientsRow(),
                  _PrepareRow(state.recipe.direction),
                ],
              );
            } else if (state is FailLoadRecipe) {
              return Center(child: Text(state.error));
            }
            return Center(child: CircularProgressIndicator());
          },
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
  _MealOverview(this.recipe);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Image.asset('assets/images/haram1.png', height: size.width * 0.6),
          AppText(
            recipe.title,
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
            recipe.overview,
            color: kTextColor,
            align: TextAlign.center,
          ),
          SizedBox(height: 10.0),
          Center(
              child: BriefInfoWidget(
                  '${recipe.cookingTime} min', recipe.person.toString(),
                  color: Colors.black)),
        ],
      ),
    );
  }
}

class _ChefInformationCard extends StatelessWidget {
  _ChefInformationCard(this.chef);

  final Chef chef;

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
          chef.name,
          font: 'Pacifico',
          fontSize: 20,
        ),
        subtitle: AppText(
          chef.title,
          color: kTextColor,
        ),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () => ChefDetailScreen.route(context, chef.email),
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
  _PrepareRow(this.direction);

  final String direction;

  @override
  Widget build(BuildContext context) {
    return SingleCardStruct(
      'Directions',
      padding: EdgeInsets.only(left: 20.0, top: 20.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: AppText(
          direction,
          align: TextAlign.center,
          font: 'Poppins',
          fontSize: 16,
        ),
      ),
    );
  }
}
