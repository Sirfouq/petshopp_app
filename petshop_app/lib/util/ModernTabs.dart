// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class ModernTabs extends StatefulWidget {
  final Function(int index) onTabTap;
  ModernTabs({super.key,required this.onTabTap});

  @override
  State<ModernTabs> createState() => _ModernTabState();
}

class _ModernTabState extends State<ModernTabs> {
  

  void onTapReturn(int index){
    widget.onTabTap(index);
  }

  @override
  Widget build(BuildContext context) {
  
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: GNav(
        selectedIndex: 0,
        onTabChange: (index) => onTapReturn(index),
        backgroundColor: Color.fromARGB(255, 239, 238, 224),
        color: Color.fromARGB(255, 123, 167, 125),
        tabBorderRadius: 35.0,
        tabBackgroundColor: Color.fromARGB(255, 200, 230, 201),
        tabs: [
          GButton(
            icon: Icons.home,
            iconSize: 30.0,
            text: 'Home',
            textColor: Colors.white,
            gap: 10,
            iconActiveColor: Colors.white,
          ),
          GButton(
              icon: Icons.favorite,
              iconSize: 30.0,
              text: 'Likes',
              textColor: Colors.white,
              gap: 10,
              iconActiveColor: Colors.white),
          GButton(
              icon: Icons.search,
              iconSize: 30.0,
              text: 'Search',
              textColor: Colors.white,
              gap: 10,
              iconActiveColor: Colors.white),
          GButton(
              icon: Icons.person,
              iconSize: 30.0,
              text: 'Profile',
              textSize: 20.0,
              textColor: Colors.white,
              gap: 10,
              iconActiveColor: Colors.white)
        ],
      ),
    );
  }
}
