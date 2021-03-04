import 'package:culinary_app/blocs/blocs.dart';
import 'package:culinary_app/models/models.dart';
import 'package:culinary_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChefDetailScreen extends StatelessWidget {
  static const pageID = '/chefDetail';

  static route(BuildContext context, String? email) =>
      Navigator.pushNamed(context, pageID, arguments: email);

  ChefDetailScreen(this.email);

  final String? email;

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
          _ChefAboutRow(email),
          // _ChefsRecipes(email),
          RecipesListView(
            filter: Filter(chef: email),
          )
        ],
      ),
    );
  }
}

class _ChefAboutRow extends StatelessWidget {
  _ChefAboutRow(this.email);

  final String? email;

  @override
  Widget build(BuildContext context) {
    context.read<ChefBloc>().add(LoadChef(email: email));
    return BlocBuilder<ChefBloc, ChefState>(
      builder: (context, state) {
        if (state is SuccessLoadChef) {
          return Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppCircleAvatar(imagePath: state.chef!.avatar, diameter: 160),
                AppText(
                  state.chef!.name,
                  font: 'Pacifico',
                  fontSize: 26.0,
                ),
                AppText(state.chef!.title, color: kTextColor),
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
                  state.chef!.about ?? 'Chefs biography',
                  color: kTextColor,
                  align: TextAlign.center,
                ),
              ],
            ),
          );
        } else if (state is FailLoadChef) {
          return Center(child: Text(state.error));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
