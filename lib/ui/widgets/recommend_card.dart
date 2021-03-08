import 'package:culinary_app/ui/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecommendCard extends StatelessWidget {
  RecommendCard(
    this.title, {
    required this.prepareTime,
    required this.person,
    required this.imagePath,
    this.onPressed,
  });

  final String? title, prepareTime, person, imagePath;
  final VoidCallback? onPressed;

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
                  top: 12,
                  left: 40,
                  child: Container(
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 6,
                        offset: Offset(-6, 0),
                      ),
                    ]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(size.width * 0.2),
                      child: Image.network(
                        imagePath!,
                        fit: BoxFit.cover,
                        height: size.width * 0.4,
                        width: size.width * 0.4,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, bottom: 10.0, right: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(title!,
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              shadows: [
                                Shadow(
                                    color: Colors.black.withOpacity(0.5),
                                    blurRadius: 4,
                                    offset: Offset(2, -1))
                              ])),
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
