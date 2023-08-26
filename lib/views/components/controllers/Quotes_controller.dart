import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Quotes_Controller extends GetxController {
  TextEditingController QuotesController = TextEditingController();
  RxString quotes = "".obs;

  cheng({String? quote}) {
    quotes.value = quote!;
  }
}
