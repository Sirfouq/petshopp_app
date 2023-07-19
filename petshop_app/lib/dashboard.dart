// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:petshop_app/util/desktop_layout.dart';

import 'package:petshop_app/util/input_field.dart';
import 'package:petshop_app/util/mobile_layout.dart';
import 'package:petshop_app/util/recommendation_card.dart';
import 'package:petshop_app/util/responsive_layout.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  bool hasNewNotification = true;
  final controller = TextEditingController();
  final hintext = 'Search in app .....';
  final List items = [
    ['lib/assets/dog_food.png', 'Naturea'],
    ['lib/assets/dog_toys.png', 'Doggies'],
    ['lib/assets/dog_food.png', 'Royal Canin']
  ];

  void handleNotification() {
    setState(() => hasNewNotification = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 239, 238, 224),
      body: SafeArea(
        child: ResponsiveLayout(
          mobilelayout: MobileLayout(
            hasNewNotification: hasNewNotification,
            items: items,
            controller: controller,
            handleNotification: handleNotification,
          ),
          desktoplayout: DesktopLayout(),
        ),
      ),
    );
  }
}
