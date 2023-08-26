import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quotes/modal/pixabay_api_modal.dart';

class Pixabay_api_helper {
  Pixabay_api_helper._();

  static final Pixabay_api_helper pixabay_api_helper = Pixabay_api_helper._();

  Future<List<pixabay_api>?> apicaller() async {
    http.Response response = await http.get(
      Uri.parse(
          "https://pixabay.com/api/?key=38081227-3207d44da6e9977a344aeff8d&q=quotes background&image_type=photo"),
    );

    if (response.statusCode == 200) {
      Map alldata = jsonDecode(response.body);

      List hits = alldata["hits"];

      List<pixabay_api> pixabay_api_modal = [];

      hits.forEach((element) {
        pixabay_api_modal.add(pixabay_api.getData(data: element));
      });

      return pixabay_api_modal;
    }
    return null;
  }

  Future<List<pixabay_api>?> Api_image({required String serch}) async {
    String image = serch;
    String url =
        "https://pixabay.com/api/?key=38081227-3207d44da6e9977a344aeff8d&q=$image&image_type=photo";
    http.Response response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      Map alldata = jsonDecode(response.body);

      List hits = alldata["hits"];

      List<pixabay_api> pixabay_api_modal = [];

      hits.forEach((element) {
        pixabay_api_modal.add(pixabay_api.getData(data: element));
      });

      return pixabay_api_modal;
    }
    return null;
  }
}
