import 'package:flutter/material.dart';

class AppColors {
  // Primary & Secondary.
  static const Color kPrimary = Color(0xFF1A8EFF);
  static const Color kSecondary = Color(0xFFC7354A);
  static const Color kGreen = Color(0xFF24B26B);
  // Additional Colors.
  static const Color kWhite = Color(0xFFFFFFFF);
  static const Color kWhiteBg = Color(0xFFF2F4F7);
  static const Color kBlack = Color(0xFF000000);
  static const Color kGray = Color(0xFFE3E5E8);
  static const Color kGray100 = Color(0xFF637085);
  static const Color kLightGray = Color(0xFFE8EAED);
  static const Color kGray2 = Color(0xFFF5F7FA);
  static const Color kGrayText = Color(0xFF637085);
  static const Color kOrange = Color(0xFFFF6640);
  static const Color kOrangeLight = Color(0xFFFF9640);
  static const Color kIndigo = Color(0xFF826AF9);
  static const Color kYellow = Color(0xFFFFD422);
  // Gradients.
  static LinearGradient kCustomOnboardingGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      const Color(0xFF110C1D).withOpacity(0.0),
      const Color(0xFF110C1D),
    ],
  );
}
