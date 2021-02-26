import 'package:culinary_app/ui/widgets/app_circle_avatar.dart';
import 'package:culinary_app/ui/widgets/app_text.dart';
import 'package:culinary_app/ui/widgets/brief_info_widget.dart';
import 'package:culinary_app/ui/widgets/colors.dart';
import 'package:flutter/material.dart';

class RecipeDetailScreen extends StatelessWidget {
  static const pageID = '/recipe';

  static route(BuildContext context, String id) =>
      Navigator.pushNamed(context, pageID, arguments: id);

  RecipeDetailScreen(this.selectedRecipe);

  final String selectedRecipe;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Image.asset('assets/images/haram1.png', height: size.width * 0.6),
          AppText(
            selectedRecipe,
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
            '\"Even kids will love this quick and easy fried rice, perfect for a weeknight meal. See notes section for Low FODMAP diet tip.\"',
            color: kTextColor,
            align: TextAlign.center,
          ),
          SizedBox(height: 10.0),
          Center(child: BriefInfoWidget('60 min', '12', color: Colors.black)),
          Container(
            margin: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(kAppRadius),
              boxShadow: [kCardShadow],
            ),
            child: ListTile(
              leading: AppCircleAvatar(),
              title: AppText(
                'Sebastian Vettel',
                font: 'Pacifico',
                fontSize: 20,
              ),
              subtitle: AppText(
                'Professional Chef',
                color: kTextColor,
              ),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
