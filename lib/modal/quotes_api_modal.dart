class Quotes_api_modal {
  String q;
  String a;
  String c;
  String h;

  Quotes_api_modal({
    required this.q,
    required this.a,
    required this.c,
    required this.h,
  });

  factory Quotes_api_modal.api({required Map data}) {
    return Quotes_api_modal(
      q: data['q'],
      a: data['a'],
      c: data['c'],
      h: data['h'],
    );
  }
}
