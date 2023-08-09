import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:petshop_app/settings.dart';
import 'package:petshop_app/util/ModernTabs.dart';
import 'package:petshop_app/util/desktop_layout.dart';

import 'package:petshop_app/util/input_field.dart';
import 'package:petshop_app/util/mobile_layout.dart';
import 'package:petshop_app/util/recommendation_card.dart';
import 'package:petshop_app/util/responsive_layout.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  bool hasNewNotification = true;
  int _selectedTab = 0;
  final controller = TextEditingController();
  final pagecontroler = PageController();
  final hintext = 'Search in app .....';
  final List items = [
    ['lib/assets/dog_food.png', 'Naturea'],
    ['lib/assets/dog_toys.png', 'Doggies'],
    ['lib/assets/dog_food.png', 'Royal Canin']
  ];

  void handleNotification() {
    setState(() => hasNewNotification = false);
  }

  void tabTap(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  late List<Widget> tabs;

  @override
  void initState() {
    super.initState();
    // Initialize the tabs list here
    tabs = [
      ResponsiveLayout(
        mobilelayout: MobileLayout(
          pageController: PageController(),
          hasNewNotification: hasNewNotification,
          items: items,
          controller: controller,
          handleNotification: handleNotification,
        ),
        desktoplayout: DesktopLayout(),
      ),
      ResponsiveLayout(
        mobilelayout: MobileLayout(
          pageController: PageController(),
          hasNewNotification: hasNewNotification,
          items: items,
          controller: controller,
          handleNotification: handleNotification,
        ),
        desktoplayout: DesktopLayout(),
      ),
      SettingsPage(),
      SettingsPage()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ModernTabs(onTabTap: tabTap,),
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 239, 238, 224),
      body: SafeArea(
        child: tabs[_selectedTab],
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DashBoard(),
    );
  }
}
