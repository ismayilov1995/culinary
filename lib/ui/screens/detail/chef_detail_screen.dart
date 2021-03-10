import 'dart:convert';

import 'package:culinary_app/blocs/blocs.dart';
import 'package:culinary_app/models/models.dart';
import 'package:culinary_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChefDetailScreen extends StatelessWidget {
  static const pageID = '/chefDetail';

  static route(BuildContext context,
          {String? email, String? id, bool isUser = false}) =>
      Navigator.pushNamed(context, pageID,
          arguments: jsonEncode({'email': email, 'id': id, 'isUser': isUser}));

  ChefDetailScreen(this.email, this.id, {this.isUser = false});

  final String? email, id;
  final bool isUser;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(
              color: Theme.of(context).primaryColor,
            ),
            actions: [
              if (isUser)
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () => Navigator.pop(context),
                ),
            ],
          ),
          _ChefAboutRow(email),
          RecipesListView('Chef\'s Recipes',
              filter: Filter(chef: id), showDelete: true)
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
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppCircleAvatar(imagePath: state.chef!.avatar, diameter: 160),
                AppText(
                  state.chef!.name,
                  font: 'Pacifico',
                  fontSize: 26.0,
                ),
                AppText(state.chef!.title,
                    color: Theme.of(context).helperTextColor),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite,
                      size: 16,
                      color: Theme.of(context).helperTextColor,
                    ),
                    AppText(
                      '54',
                      color: Theme.of(context).helperTextColor,
                    ),
                    SizedBox(width: 20.0),
                    Icon(
                      Icons.face,
                      size: 16,
                      color: Theme.of(context).helperTextColor,
                    ),
                    AppText(
                      '12 follower',
                      color: Theme.of(context).helperTextColor,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                AppText(
                  state.chef!.about ?? 'Chefs biography',
                  color: Theme.of(context).helperTextColor,
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
