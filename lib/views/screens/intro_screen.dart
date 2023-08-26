import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';

class intro extends StatelessWidget {
  intro({super.key});
  final List<Introduction> list = [
    Introduction(
      title: 'Get New Quotes Daily',
      subTitle: 'you can save and create your quotes',
      imageUrl: 'assets/introimage1.jpg',
    ),
    Introduction(
      title: 'Like Quotes',
      subTitle:
          'Add your favorite quotes to Favorite then you can yous that letter',
      imageUrl: 'assets/introimage2.png',
    ),
    Introduction(
      title: 'Publish Facility',
      subTitle: 'you can publish your created quotes',
      imageUrl: 'assets/introimage3.jpg',
    ),
    Introduction(
      title: 'Sher To Other Friends',
      subTitle:
          'we gives you a facility to sher your or your liked quotes to your friends and others',
      imageUrl: 'assets/introimage4.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroScreenOnboarding(
        introductionList: list,
        onTapSkipButton: () {
          Get.offNamedUntil('/home_page', (route) => false);
        },
      ),
    );
  }
}
