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
            RecipesListView(),
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
        trailing: AppCircleAvatar(
          imagePath:
              'https://static.wikia.nocookie.net/queen-of-the-south/images/e/e6/Kelly_anne_sacar_con_sifron_el_mar.jpg/revision/latest/top-crop/width/220/height/220?cb=20180718062632',
        ),
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
                        imagePath: r.mainImage,
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
