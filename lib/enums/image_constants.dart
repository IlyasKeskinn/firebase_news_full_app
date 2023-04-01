import 'package:flutter/material.dart';

enum ImageConstants {
  avatar('avatar'),
  avatarPhoto('avatarPhoto');

  final String value;

  // ignore: sort_constructors_first
  const ImageConstants(this.value);

  String get toJpg => 'assets/image/img_$value.jpg';
  Image get toImage => Image.asset(toJpg);
}
