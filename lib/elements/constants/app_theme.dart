import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/text/text_widget.dart';
import 'app_colors.dart';
import 'app_spacing.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.brown,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.kWhite,
    appBarTheme: AppBarTheme(
      titleTextStyle: AppTypography.kAppStyle(fontSize: 18),
      iconTheme: const IconThemeData(color: AppColors.kBlack),
      backgroundColor: AppColors.kWhite,
      elevation: 0,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: const Color(0xFFF6F6F6),
      contentPadding: EdgeInsets.symmetric(
        horizontal: AppSpacing.twentyHorizontal,
        vertical: 18.h,
      ),
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.kPrimary),
        borderRadius: BorderRadius.circular(AppSpacing.radiusThirty),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(AppSpacing.radiusThirty),
      ),
      hintStyle: AppTypography.kAppStyle(fontSize: 18).copyWith(color: AppColors.kBlack),
    ),
  );
}

// Default Overlay.
SystemUiOverlayStyle defaultOverlay = const SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  statusBarBrightness: Brightness.light,
  statusBarIconBrightness: Brightness.dark,
  systemNavigationBarColor: Colors.black,
  systemNavigationBarDividerColor: Colors.transparent,
  systemNavigationBarIconBrightness: Brightness.light,
);
