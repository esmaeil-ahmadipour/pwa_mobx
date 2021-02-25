import 'package:flutter/material.dart';
import 'package:pwa_mobx/pages/first_page.dart';
import 'package:pwa_mobx/utils/navigator_service.dart';
import 'package:pwa_mobx/pages/second_page.dart';
import 'package:pwa_mobx/utils/service_locator.dart';
import 'package:pwa_mobx/utils/utility_class.dart';


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    UtilityClass().getCounter().load();
    return MaterialApp(
      navigatorKey:  locator<NavigationService>().navigatorKey,

      onGenerateRoute: (routeSettings) {
        switch (routeSettings.name) {
          case 'second':
            return MaterialPageRoute(builder: (context) {
              return SecondPage(title: routeSettings.arguments);
            });
          case 'home':
            return MaterialPageRoute(builder: (context) {
              return FirstPage();
            });
          default:
            return MaterialPageRoute(builder: (context) => FirstPage());
        }
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstPage(title: 'Page 1'),
    );
  }
}

