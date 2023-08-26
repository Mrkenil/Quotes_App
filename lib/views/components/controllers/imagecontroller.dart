import 'package:get/get.dart';

class controllimage extends GetxController {
  RxInt? image;

  imageval(int val) {
    if (image!.value == val) {
      image = null;
    } else {
      image?.value = val;
    }
  }
}
