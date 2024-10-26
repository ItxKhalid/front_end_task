import 'package:flutter/material.dart';
import 'package:front_end_task/elements/constants/app_colors.dart';

class CustomIconButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final double height;
  final double width;
  final Color? color;

  const CustomIconButton({
    super.key,
    required this.child,
    this.onPressed,
    this.height = 48.0,
    this.width = 48.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? AppColors.kPrimary,
          borderRadius: BorderRadius.circular(14),
        ),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}
