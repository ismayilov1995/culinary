import 'package:culinary_app/models/auth_model.dart';
import 'package:culinary_app/models/models.dart';
import 'package:culinary_app/services/repositories/repositories.dart';
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
      body: SafeArea(
        child: ListView(
          primary: false,
          physics: BouncingScrollPhysics(),
          children: [
            _UserWelcomeRow(),
            SearchRow(),
            BlocProvider(
                create: (context) => RecipeBloc(),
                child: _RecommendRecipesRow()),
            BlocProvider(
              create: (context) => RecipeBloc(),
              child: RecipesListView('Latest Recipes'),
            )
          ],
        ),
      ),
    );
  }
}

class _UserWelcomeRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        final bool authenticated = state.status == AuthStatus.authenticated;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: ListTile(
            title: AppText(
              'Welcome',
              color: Theme.of(context).helperTextColor,
              fontSize: 14,
            ),
            subtitle: AppText(
              authenticated ? state.auth!.user.name : 'Guest chef',
              font: 'Pacifico',
              fontSize: 26,
              color: Theme.of(context).textColor,
            ),
            trailing: PopupMenuButton(
              child: AppCircleAvatar(
                imagePath: authenticated
                    ? state.auth!.user.avatar
                    : 'https://static.wikia.nocookie.net/queen-of-the-south/images/e/e6/Kelly_anne_sacar_con_sifron_el_mar.jpg/revision/latest/top-crop/width/220/height/220?cb=20180718062632',
              ),
              onSelected: (dynamic v) =>
                  _onMenuItemSelect(context, v, state.auth),
              itemBuilder: (context) => [
                if (authenticated) ...[
                  PopupMenuItem(
                    child: Text('Write recipe'),
                    value: 4,
                  ),
                  PopupMenuItem(
                    child: Text('Go to profile'),
                    value: 0,
                  ),
                  PopupMenuItem(
                    child: Text('Logout'),
                    value: 3,
                  ),
                ] else ...[
                  PopupMenuItem(
                    child: Text('Login'),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Text('Create account'),
                    value: 2,
                  ),
                ]
              ],
            ),
          ),
        );
      },
    );
  }

  void _onMenuItemSelect(BuildContext context, int v, Auth? auth) {
    switch (v) {
      case 0:
        ChefDetailScreen.route(context,
            email: auth!.user.email, id: auth.user.id, isUser: true);
        break;
      case 1:
        LoginScreen.route(context);
        break;
      case 2:
        RegisterScreen.route(context);
        break;
      case 3:
        context
            .read<AuthenticationBloc>()
            .add(AuthLogoutRequested(logOutAll: false));
        break;
      case 4:
        CreateRecipeScreen.route(context);
        break;
    }
  }
}

class _RecommendRecipesRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<RecipeBloc>().add(LoadRecipes(filter: Filter(popular: true)));
    return SingleCardStruct(
      'Recommended',
      child: BlocBuilder<RecipeBloc, RecipeState>(
        builder: (context, state) {
          if (state is SuccessLoadRecipes) {
            return SizedBox(
              height: 250,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(left: 20.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.recipeResponse.recipes!.length,
                  itemBuilder: (context, i) {
                    final r = state.recipeResponse.recipes![i];
                    return RecommendCard(
                      r.title,
                      person: r.person.toString(),
                      prepareTime: '${r.cookingTime} min',
                      imagePath: r.mainImage,
                      index: i,
                      onPressed: () =>
                          RecipeDetailScreen.route(context, r.slug),
                    );
                  }),
            );
          } else if (state is FailLoadRecipes) {
            return Center(child: Text(state.error));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
