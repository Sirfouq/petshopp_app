// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';


class Recommend_Card extends StatelessWidget {
  final String text;
  final Color? background_color;
  final String image;
  final double width;
  final double height;

  const Recommend_Card(
      {super.key,
      required this.height,
      required this.width,
      required this.background_color,
      required this.image,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: ClipRRect(borderRadius: BorderRadius.circular(10),
        child: Container(
          color: background_color,
          width: width,
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(child: Image.asset(image,fit: BoxFit.contain,)),
              SizedBox(height: 20,),
              Text(text,style: TextStyle(fontSize: 14),textAlign: TextAlign.end,),
            ],
          ),
        ),
      ),
    );
  }
}
