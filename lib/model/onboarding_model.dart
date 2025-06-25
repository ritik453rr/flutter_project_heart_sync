import 'package:flutter/cupertino.dart';

/// A model class for onboarding items.
class OnboardingModel
{
  String title;
  bool? isSelected;
  IconData? imagePath;

  OnboardingModel({
    required this.title,
    this.isSelected,
    this.imagePath
  });
}