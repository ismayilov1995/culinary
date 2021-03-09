import 'package:culinary_app/models/models.dart';
import 'package:culinary_app/ui/screens/screens.dart';
import 'package:culinary_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:culinary_app/blocs/blocs.dart';

class RecipeDetailScreen extends StatelessWidget {
  static const pageID = '/recipe';

  static route(BuildContext context, String? slug) =>
      Navigator.pushNamed(context, pageID, arguments: slug);

  RecipeDetailScreen(this.selectedRecipe);

  final String selectedRecipe;

  @override
  Widget build(BuildContext context) {
    context.read<RecipeBloc>().add(LoadRecipe(this.selectedRecipe));
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<RecipeBloc, RecipeState>(
          builder: (context, state) {
            if (state is SuccessLoadRecipe) {
              return _scaffoldBackground(
                  image: state.recipe.mainImage,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      BlocListener<FavoriteBloc, FavoriteState>(
                        listener: (context, state) {
                          if (state is AddedFavorite) {
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(
                                  SnackBar(content: Text('Favorite')));
                          }
                        },
                        child: CulinaryAppBar(
                          actions: [
                            TextButton.icon(
                              icon: Icon(
                                Icons.favorite,
                                color: kPrimaryColor,
                              ),
                              label: AppText(
                                'Favorite',
                                color: kPrimaryColor,
                              ),
                              onPressed: () {
                                context
                                    .read<FavoriteBloc>()
                                    .add(AddRemoveFavorite(selectedRecipe));
                              },
                            )
                          ],
                        ),
                      ),
                      _MealOverview(state.recipe),
                      _ChefInformationCard(state.recipe.chef),
                      _IngredientsRow(),
                      _PrepareRow(state.recipe.direction!),
                      LogoHorizontal(),
                    ],
                  ));
            } else if (state is FailLoadRecipe) {
              return Center(child: Text(state.error));
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }

  Widget _scaffoldBackground({required String image, Widget? child}) {
    return Stack(
      children: [
        Container(
            height: 300,
            child: Image.network(
              image,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            )),
        Container(
          height: 300,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white.withOpacity(0), Colors.white])),
        ),
        child!
      ],
    );
  }
}

class CulinaryAppBar extends StatelessWidget {
  CulinaryAppBar({this.actions});

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: kPrimaryColor),
      actions: actions,
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
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 6, color: Colors.white),
                boxShadow: [kCardShadow]),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(size.width * 0.3),
                child: Image.network(
                  recipe.mainImage,
                  height: size.width * 0.6,
                  width: size.width * 0.6,
                  fit: BoxFit.cover,
                )),
          ),
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

  final Chef? chef;

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
        leading: AppCircleAvatar(
          imagePath: chef!.avatar,
        ),
        title: AppText(
          chef!.name,
          font: 'Pacifico',
          fontSize: 20,
        ),
        subtitle: AppText(
          chef!.title,
          color: kTextColor,
        ),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () =>
            ChefDetailScreen.route(context, email: chef!.email, id: chef!.id),
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

  final List<String> direction;
  final padding = 20.0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - padding * 4;
    return SingleCardStruct(
      'Directions',
      padding: EdgeInsets.only(left: padding, top: padding),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding, vertical: 10.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: direction
                .map((e) => Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: kPrimaryColor,
                            child: Text((direction.indexOf(e) + 1).toString()),
                          ),
                          Container(
                            width: width,
                            child: AppText(
                              e,
                              font: 'Poppins',
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ))
                .toList()),
      ),
    );
  }
}
