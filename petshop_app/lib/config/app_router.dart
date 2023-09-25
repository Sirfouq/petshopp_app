// ignore_for_file: prefer_const_constructors

import 'package:go_router/go_router.dart';
import 'package:petshop_app/home.dart';
import 'package:petshop_app/main.dart';
import 'package:petshop_app/settings.dart';
import 'package:petshop_app/util/item_details.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(path: '/', builder: ((context, state) => MyHomePage(title: 'Home'))),
  GoRoute(path: '/home', builder: (context, state) => HomePage(), routes: [
    GoRoute(
      path: 'item_details/:name/:image', // Separate parameters with slashes
      builder: (context, state) {
        final String name = state.pathParameters["name"]!;
        final String image = state.pathParameters["image"]!;
        return ItemDetails(name: name, image: image);
      },
    )
  ]),
  GoRoute(path: '/settings',builder: (context, state) => SettingsPage(),)
  //GoRoute(path: '/item_details',builder: (context, state) => ItemDetails(),),
]);
