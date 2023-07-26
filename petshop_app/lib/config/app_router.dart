// ignore_for_file: prefer_const_constructors

import 'package:go_router/go_router.dart';
import 'package:petshop_app/dashboard.dart';
import 'package:petshop_app/main.dart';
import 'package:petshop_app/util/item_details.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(path: '/', builder: ((context, state) => MyHomePage(title: 'Home'))),
  GoRoute(
      path: '/dashboard',
      builder: (context, state) => DashBoard(),
      routes: [
        GoRoute(
          path: 'item_details/:name',
          builder: (context, state) => ItemDetails(name:state.pathParameters["name"]! ,),
        )
      ]),
  //GoRoute(path: '/item_details',builder: (context, state) => ItemDetails(),),
]);
