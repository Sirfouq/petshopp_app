import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:petshop_app/settings.dart';
import 'package:petshop_app/util/ModernTabs.dart';
import 'package:petshop_app/util/input_field.dart';
import 'package:petshop_app/util/recommendation_card.dart';
import 'layouts/desktop_layout.dart';
import 'layouts/mobile_layout_home.dart';
import 'layouts/responsive_layout.dart';

final notificationProvider = StateProvider<bool>((ref) => true);
final selectedTabProvider = StateProvider<int>((ref) => 0);

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasNewNotification = ref.watch(notificationProvider);
    final _selectedTab = ref.watch(selectedTabProvider);
    final controller = TextEditingController();
    final pagecontroler = PageController();
    final hintext = 'Search in app .....';
    final List items = [
      ['lib/assets/dog_food.png', 'Naturea'],
      ['lib/assets/dog_toys.png', 'Doggies'],
      ['lib/assets/dog_food.png', 'Royal Canin']
    ];
    final List exploreItems = [
      ['lib/assets/vet.png', 'Find a veteranian near you !', Colors.blue[200]],
      ['lib/assets/offers.png', 'Discover our special offers !', Colors.red[200]],
    ];

    void tabTap(int index) {
      ref.read(selectedTabProvider.notifier).state = index;
    }

    List<Widget> tabs = [
      ResponsiveLayout(
        mobilelayout: MobileLayout(
          pageController: pagecontroler,
          hasNewNotification: hasNewNotification,
          items: items,
          exploreItems: exploreItems,
          controller: controller,
          handleNotification: () => ref.read(notificationProvider.notifier).state = false,
        ),
        desktoplayout: DesktopLayout(),
      ),
      ResponsiveLayout(
        mobilelayout: MobileLayout(
          pageController: PageController(),
          hasNewNotification: hasNewNotification,
          items: items,
          exploreItems: exploreItems,
          controller: controller,
          handleNotification: () => ref.read(notificationProvider.notifier).state = false,
        ),
        desktoplayout: DesktopLayout(),
      ),
      SettingsPage(),
      SettingsPage()
    ];

    return Scaffold(
      bottomNavigationBar: ModernTabs(
        onTabTap: tabTap,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: tabs[_selectedTab],
      ),
    );
  }
}
