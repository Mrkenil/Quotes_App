import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quotes/modal/quotes_api_modal.dart';

class Quotes_api {
  Quotes_api._();
  static Quotes_api quotes_api = Quotes_api._();

  Future<List<Quotes_api_modal>?> quotes_get() async {
    String url = "https://zenquotes.io/api/quotes";

    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);

      List<Quotes_api_modal> quotes =
          data.map((e) => Quotes_api_modal.api(data: e)).toList();

      return quotes;
    }
    return null;
  }
}
