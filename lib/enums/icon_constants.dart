import 'package:flutter/material.dart';

enum IconConstants {
  micrphone('microphone'),
  app_icon('app_logo'),
  author_icon('bbc');

  final String value;

  // ignore: sort_constructors_first
  const IconConstants(this.value);

  String get toPng => 'assets/icon/ic_$value.png';
  Image get toImage => Image.asset(toPng);
}
