import 'package:finance_app/const/images.dart';
import 'package:flutter/material.dart';

class OnboardingProvider with ChangeNotifier {
  int currentIndex = 0;

  void pageChange(int val) {
    currentIndex = val;
    notifyListeners();
  }

  final List<String> allOnboardingImages = [
    CustomImagePath.onBoardingOne,
    CustomImagePath.onBoardingTwo
  ];
  final List<String> allOnboardingText = [
    "Welcome to  \n Expense Manager",
    "Are you ready to\n take control of\n your finaces?"
  ];
}
