import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


import '../ui/home_page.dart';
import '../ui/list_level_page.dart';
import 'package:tp_flutter_lapin/ui/level_1.dart';
import 'package:tp_flutter_lapin/ui/level_2.dart';
import 'package:tp_flutter_lapin/ui/level_3.dart';
import 'package:tp_flutter_lapin/ui/level_4.dart';
import '../ui/score_page.dart';
import '../ui/rules_page.dart';



final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
//final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation:'/home',
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        redirect: (BuildContext context, GoRouterState state){
          return '/home';
        },
      ),
      GoRoute(
          path: '/home',
          name: 'home',
          builder: (context,state) => const HomeScreen(),
          routes: <RouteBase>[
                GoRoute(
                    path: 'level',
                    builder: (context, state) => const LevelsScreen(),
                    routes: [
                      GoRoute(
                        path: '1',
                        builder: (BuildContext context, GoRouterState state){
                          return const Niveau1Screen();
                        },
                      ),
                      GoRoute(
                        path: '2',
                        builder: (BuildContext context, GoRouterState state){
                          return const Niveau2Screen();
                        },
                      ),
                      GoRoute(
                        path: '3',
                        builder: (BuildContext context, GoRouterState state){
                          return const Niveau3Screen();
                        },
                      ),
                      GoRoute(
                        path: '4',
                        builder: (BuildContext context, GoRouterState state){
                          return const Niveau4Screen();
                        },
                      ),
                    ]
                ),
            GoRoute(
              path: 'score',
              builder: (context, state) => const ScoreScreen(),
            ),
            GoRoute(
              path: 'rules',
              builder: (context, state) => const RulesScreen(),
            ),
          ])
        ]
    );