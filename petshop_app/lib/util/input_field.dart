// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;

  const InputField(
      {super.key, required this.controller, required this.hintext});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(7.0),
      child: TextField(
          controller: controller,
          decoration: InputDecoration(
            constraints: BoxConstraints(maxWidth: 280),
            hintText: hintext,
          )),
    );
  }
}
