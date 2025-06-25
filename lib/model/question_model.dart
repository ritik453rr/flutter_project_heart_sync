import 'package:flutter/cupertino.dart';

/// This class represents a question model with a title, options, and an optional icon.
class QuestionModel {
  late final String title;
  late final List<String> options;
  late final IconData? icon;
  final String key;

  QuestionModel({
    required this.title,
    required this.options,
    required this.icon,
    this.key = "",
  });
}
