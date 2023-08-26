import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class spleah extends StatefulWidget {
  const spleah({super.key});

  @override
  State<spleah> createState() => _spleahState();
}

class _spleahState extends State<spleah> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 1),
      () {
        Get.toNamed("/intro");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/logo.png"),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      backgroundColor: Color(0xff252525),
    );
  }
}
