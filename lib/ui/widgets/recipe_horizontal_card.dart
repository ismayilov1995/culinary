import 'package:culinary_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RecipeHorizontalCard extends StatelessWidget {
  RecipeHorizontalCard(
    this.title, {
    required this.prepareTime,
    required this.person,
    required this.imagePath,
    this.onPressed,
    this.onDelete,
  });

  final String? title, prepareTime, person, imagePath;
  final VoidCallback? onPressed, onDelete;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onPressed,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 25),
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                color: Theme.of(context).recipeCardBG,
                borderRadius: BorderRadius.circular(kAppRadius),
                boxShadow: [Theme.of(context).cardShadow]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width - 200,
                  child: AppText(
                    title,
                    fontSize: 22,
                    font: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Icon(Icons.grade, color: Colors.yellow[600]),
                SizedBox(height: 10),
                BriefInfoWidget(prepareTime, person)
              ],
            ),
          ),
          Positioned(
              top: 10,
              right: 20,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 4, color: Colors.white),
                  boxShadow: [Theme.of(context).cardShadow],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60.0),
                  child: Image.network(
                    imagePath!,
                    height: 110,
                    width: 110,
                    fit: BoxFit.cover,
                  ),
                ),
              )),
          if (onDelete != null)
            Positioned(
                right: 0,
                bottom: 0,
                child: PopupMenuButton(
                  icon: Icon(Icons.more_horiz),
                  onSelected: onDelete != null ? (v) => onDelete!() : null,
                  itemBuilder: (v) => [
                    PopupMenuItem(
                      value: 0,
                      child: Text('Delete'),
                    ),
                  ],
                ))
        ],
      ),
    );
  }
}
