// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemDetails extends StatelessWidget {
  final String name;
  const ItemDetails({super.key,required this.name});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        title: Text(name),
        leading: IconButton(onPressed: () => context.go('/dashboard'), icon: Icon(Icons.arrow_back_ios_new))
      ),
    );
  }
}
