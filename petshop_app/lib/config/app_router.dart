// ignore_for_file: prefer_const_constructors

import 'package:go_router/go_router.dart';
import 'package:petshop_app/dashboard.dart';
import 'package:petshop_app/main.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(path: '/', builder: ((context, state) => MyHomePage(title: 'Home'))),
  GoRoute(
    path: '/dashboard',
    builder: (context, state) => DashBoard(),
  )
]);
