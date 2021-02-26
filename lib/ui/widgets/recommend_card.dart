import 'package:culinary_app/ui/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecommendCard extends StatelessWidget {
  RecommendCard(
    this.title, {
    @required this.prepareTime,
    @required this.person,
    @required this.imagePath,
    this.onPressed,
  });

  final String title, prepareTime, person, imagePath;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onPressed,
      child: Container(
          height: 250,
          margin: const EdgeInsets.only(right: 20.0),
          width: size.width * 0.4,
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kAppRadius),
            gradient: kAccentGradient,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(kAppRadius),
            child: Stack(
              children: [
                Positioned(
                  top: 10,
                  left: 40,
                  child: Image.asset(imagePath, width: size.width * 0.4),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppText(
                        title,
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      BriefInfoWidget(prepareTime, person, color: Colors.white)
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
