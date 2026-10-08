import 'package:flutter/material.dart';

class LessonModel {
  final String sectionTitle;
  final String title;
  final bool isLocked;
  final Color? buttonColor;
  final Color? buttonShadowColor;
  final Color? iconColor;
  final String? routePath;

  const LessonModel({
    required this.sectionTitle,
    required this.title,
    this.isLocked = false,
    this.buttonColor,
    this.buttonShadowColor,
    this.iconColor,
    this.routePath,
  });
}
