import 'package:culinary_app/models/models.dart';
import 'package:culinary_app/ui/screens/screens.dart';
import 'package:culinary_app/ui/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:culinary_app/blocs/blocs.dart';

class HomeScreen extends StatelessWidget {
  static const pageID = '/';

  @override
  Widget build(BuildContext context) {
    context.read<RecipeBloc>().add(LoadRecipes());
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

class _UserWelcomeRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ListTile(
        title: AppText(
          'Good Morning',
          color: kTextColor,
          fontSize: 14,
        ),
        subtitle: AppText(
          'Sebastian Vettel',
          color: Colors.black,
          font: 'Pacifico',
          fontSize: 26,
        ),
        trailing: AppCircleAvatar(),
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

class _RecommendRecipesRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeBloc, RecipeState>(
      builder: (context, state) {
        if (state is SuccessLoadRecipes) {
          return SingleCardStruct('Recommended',
              child: SizedBox(
                height: 250,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.only(left: 20.0),
                    scrollDirection: Axis.horizontal,
                    itemCount: state.recipeResponse.recipes.length,
                    itemBuilder: (context, i) {
                      final r = state.recipeResponse.recipes[i];
                      return RecommendCard(
                        r.title,
                        person: r.person.toString(),
                        prepareTime: '${r.cookingTime} min',
                        imagePath: 'assets/images/haram1.png',
                        onPressed: () =>
                            RecipeDetailScreen.route(context, r.slug),
                      );
                    }),
              ));
        } else if (state is FailLoadRecipes) {
          return Center(child: Text(state.error));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

class _LatestRecipesRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeBloc, RecipeState>(
      builder: (context, state) {
        if (state is SuccessLoadRecipes) {
          final loaded = state.recipeResponse.recipes.length;
          return SingleCardStruct('New Recipe',
              padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  itemCount: loaded + 1,
                  itemBuilder: (context, i) {
                    if (loaded == i) {
                      return FlatButton(
                        padding: EdgeInsets.symmetric(vertical: 40.0),
                        child: Text('Load more'),
                        onPressed: () {
                          if (loaded == state.recipeResponse.total) {
                            Scaffold.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(SnackBar(
                                  content: Text('Sorry, no more recipes')));
                          }
                          context
                              .read<RecipeBloc>()
                              .add(LoadRecipes(filter: Filter(skip: loaded)));
                        },
                      );
                    }
                    final r = state.recipeResponse.recipes[i];
                    return RecipeHorizontalCard(
                      r.title,
                      person: r.person.toString(),
                      prepareTime: '${r.cookingTime} min',
                      imagePath: 'assets/images/haram1.png',
                      onPressed: () =>
                          RecipeDetailScreen.route(context, r.slug),
                    );
                  }));
        } else if (state is FailLoadRecipes) {
          return Center(child: Text(state.error));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
