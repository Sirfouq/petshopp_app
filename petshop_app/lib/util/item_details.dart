// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemDetails extends StatefulWidget {
  final String name;
  final String image;
  const ItemDetails({super.key, required this.name,required this.image});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.green[200],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => context.go('/dashboard'),
        ),
        title: Text(widget.name),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(children: [
              Image.asset(
                'lib/assets/${widget.image}',
              ),
              Text('Lorem Ipsum')
            ],),
          )
        ],
      ),
    );
  }
}
