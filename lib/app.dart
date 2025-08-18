import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/routes/route_config.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: RouteConfig.routes,
    );
  }
}
