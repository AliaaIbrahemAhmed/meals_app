// ignore_for_file: file_names

import 'dart:ui';

import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class Category {
  Category({required this.title, required this.color, required this.id});
  final String title;
  final String id;
  final Color color;
}
