// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuggestionCard extends StatelessWidget {
  final String displaytext;
  final String image;
  final Color background_color;
  const SuggestionCard(
      {super.key,
      required this.displaytext,
      required this.image,
      required this.background_color});

  @override
  Widget build(BuildContext context) {
    Color? darkerBackgroundColor =
        darkenColor(background_color, 0.7); // Adjust the opacity value

    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          color: background_color),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Column(children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  displaytext,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.openSans().fontFamily,
                      fontSize: 22),
                ),
                SizedBox(height: 20),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: MoreButton(
                      onTap: () {},
                      color: darkerBackgroundColor,
                    )),
              ]),
            ),
          ),
          Flexible(
              child: Image.asset(
            image,
            height: 200,
          ))
        ],
      ),
    );
  }
}

class MoreButton extends StatelessWidget {
  final Function()? onTap;
  final Color? color;
  const MoreButton({super.key, required this.onTap, required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: color),
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0), // Adjusted padding
        child: Row(
          mainAxisSize: MainAxisSize.min, // Makes Row occupy only required space
          children: [
            Text(
              'Learn More',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(width: 5),  // Reduced width
            Icon(
              Icons.arrow_forward,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}

Color darkenColor(Color color, double factor) {
  return Color.fromARGB(
    color.alpha,
    (color.red * factor).toInt(),
    (color.green * factor).toInt(),
    (color.blue * factor).toInt(),
  );
}
