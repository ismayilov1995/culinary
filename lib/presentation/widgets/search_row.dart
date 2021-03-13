import 'package:culinary_app/presentation/screens/home/result_screen.dart';
import 'package:culinary_app/presentation/widgets/search_button.dart';
import 'package:culinary_app/presentation/widgets/text_field.dart';
import 'package:flutter/material.dart';

class SearchRow extends StatefulWidget {
  SearchRow({this.route = true, this.onSearch});

  final bool route;
  final ValueChanged? onSearch;

  @override
  SearchRowState createState() => SearchRowState();
}

class SearchRowState extends State<SearchRow> {
  late TextEditingController _textController;
  String query = "";

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Expanded(
            child: AppTextField('Find recipes or chef',
                controller: _textController,
                prefixIcon: Icon(Icons.search), onChanged: (v) {
              query = v;
            }),
          ),
          SizedBox(width: 20),
          SearchButton(
            onPressed: () async {
              if (query.length > 4) {
                if (widget.route) {
                  await ResultScreen.route(context, query);
                } else {
                  widget.onSearch!(query);
                }
                setState(() {
                  FocusScope.of(context).requestFocus(FocusNode());
                  _textController.clear();
                  query = "";
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
