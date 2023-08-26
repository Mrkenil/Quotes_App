import 'package:flutter/services.dart';

class Qiotes_modal {
  int? id;
  String quote;
  int fontsize;
  Uint8List Bgimage;
  Uint8List fullimage;

  Qiotes_modal({
    this.id,
    required this.quote,
    required this.fontsize,
    required this.Bgimage,
    required this.fullimage,
  });
}
