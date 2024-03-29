import 'package:culinary_app/data/models/models.dart';
import 'package:culinary_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  static const pageID = '/result';

  static Future route(BuildContext context, String query) =>
      Navigator.pushNamed(context, pageID, arguments: query);

  ResultScreen(this.query);

  final String query;

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late Filter filter;

  @override
  void initState() {
    super.initState();
    filter = Filter(query: widget.query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AppBar(
            iconTheme: IconThemeData(
              color: Theme.of(context).primaryColor,
            ),
            title: AppText(
              'Result',
              color: Theme.of(context).primaryColor,
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          SearchRow(
            route: false,
            onSearch: (v) {
              setState(() {
                filter = Filter(query: v);
              });
            },
          ),
          RecipesListView(
            'Results',
            filter: filter,
          )
        ],
      ),
    );
  }
}
