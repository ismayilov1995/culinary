import 'package:culinary_app/blocs/blocs.dart';
import 'package:culinary_app/models/models.dart';
import 'package:culinary_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultScreen extends StatelessWidget {
  static const pageID = '/result';

  static Future route(BuildContext context, String query) =>
      Navigator.pushNamed(context, pageID, arguments: query);

  ResultScreen(this.query);

  final String query;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Results')),
      body: SingleChildScrollView(
        child: RecipesListView(
          'Results',
          filter: Filter(query: query),
        ),
      ),
    );
  }
}
