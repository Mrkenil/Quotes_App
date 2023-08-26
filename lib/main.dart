import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes/views/screens/home_page.dart';
import 'package:quotes/views/screens/intro_screen.dart';
import 'package:quotes/views/screens/spleah.dart';
import '';

void main() {
  runApp(app());
}

class app extends StatelessWidget {
  const app({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      getPages: [
        GetPage(
          name: '/',
          page: () => spleah(),
        ),
        GetPage(
          name: '/intro',
          page: () => intro(),
        ),
        GetPage(
          name: '/home_page',
          page: () => home_page(),
        )
      ],
    );
  }
}
