import 'dart:ui';

import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class CustomStackCard extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final double offset;

  const CustomStackCard({
    super.key,
    required this.child,
    this.borderRadius = 16.0,
    this.offset = 30,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Bottom container
        Transform.translate(
          offset: Offset(0, offset),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: AppColors.kGray.withOpacity(0.5),
              borderRadius: BorderRadius.circular(borderRadius),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.kGray2,
                  offset: Offset(0, 4),
                  blurRadius: 8,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Opacity(
                opacity: 0.0,
                child: child),
          ),
        ),
        // Main container
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.kWhite,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: child,
        ),
      ],
    );
  }
}