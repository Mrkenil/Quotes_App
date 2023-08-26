import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:quotes/helper/pixabay_api_helper.dart';
import 'package:quotes/helper/quotes_api_helper.dart';
import 'package:quotes/modal/pixabay_api_modal.dart';
import 'package:quotes/modal/quotes_api_modal.dart';
import 'package:quotes/views/components/controllers/imagecontroller.dart';
import 'package:quotes/views/components/controllers/navigationbarcontroller.dart';
import 'package:quotes/views/screens/New_Quotes_page.dart';
import 'package:quotes/views/screens/Your_Favorite.dart';
import 'package:quotes/views/screens/creat_page.dart';
import 'package:quotes/views/screens/your_q.dart';
import 'package:quotes/views/screens/your_quotes_page.dart';
import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  final controllimage c = Get.put(controllimage());
  final navigationbar_c navigation = Get.put(navigationbar_c());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: navigation.pageController,
        onPageChanged: (val) {
          navigation.whencheng(val: val);
        },
        children: [
          creat_quotes(),
          home(),
          your_quotes(),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: Obx(
        () => FlashyTabBar(
          selectedIndex: navigation.selectedIndex.value,
          showElevation: true,
          onItemSelected: (index) => navigation.whencheng(val: index),
          items: [
            FlashyTabBarItem(
              icon: Icon(Icons.create),
              title: Text('Create'),
            ),
            FlashyTabBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            FlashyTabBarItem(
              icon: Icon(Icons.person),
              title: Text('Your Quotes'),
            ),
          ],
        ),
      ),
    );
  }
}

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quotes",
          style: TextStyle(fontSize: 30, color: Colors.purple),
        ),
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Tab(text: "New Quotes"),
            Tab(text: "Your Publish"),
            Tab(text: "Favorite"),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          New_Quotes(),
          Your_publish(),
          Your_Favorite(),
        ],
      ),
    );
  }
}
