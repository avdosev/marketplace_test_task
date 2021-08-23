import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';
import 'pages/pages.dart';

void main() {
  runApp(MarketPlaceApp());
}

class MarketPlaceApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      routerDelegate: RoutemasterDelegate(
          routesBuilder: (context) => _buildRouteMap(context)),
      routeInformationParser: RoutemasterParser(),
    );
  }
}

RouteMap _buildRouteMap(BuildContext context) {
  return RouteMap(
    routes: {
      '/': (route) => MaterialPage(child: Catalog()),
    },
  );
}
