// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class ModernTabs extends StatefulWidget {
  final Function(int index) onTabTap;
  ModernTabs({super.key, required this.onTabTap});

  @override
  State<ModernTabs> createState() => _ModernTabState();
}

class _ModernTabState extends State<ModernTabs> {
  void onTapReturn(int index) {
    widget.onTabTap(index);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: GNav(
        selectedIndex: 0,
        onTabChange: (index) => onTapReturn(index),
        backgroundColor: Theme.of(context).colorScheme.background,
        color: Color.fromARGB(255, 123, 167, 125),
        tabBorderRadius: 25.0,
        tabBackgroundColor: Color.fromARGB(255, 200, 230, 201),
        tabs: [
          GButton(
            icon: Icons.home,
            iconSize: 20.0,
            textColor: Colors.white,
            gap: 10,
            borderRadius: BorderRadius.circular(25.0),
            iconActiveColor: Colors.white,
          ),
          GButton(
              icon: Icons.favorite,
              iconSize: 25.0,
              textColor: Colors.white,
              gap: 10,
              borderRadius: BorderRadius.circular(25.0),
              iconActiveColor: Colors.white),
          GButton(
              icon: Icons.search,
              iconSize: 25.0,
              textColor: Colors.white,
              gap: 10,
              borderRadius: BorderRadius.circular(25.0),
              iconActiveColor: Colors.white),
          GButton(
              icon: Icons.person,
              iconSize: 25.0,
              textSize: 20.0,
              textColor: Colors.white,
              gap: 10,
              borderRadius: BorderRadius.circular(25.0),
              iconActiveColor: Colors.white)
        ],
      ),
    );
  }
}
