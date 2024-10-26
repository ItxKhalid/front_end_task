import 'package:flutter/material.dart';
import '../../constants/constants.dart';


class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? color;
  final double? fontSize;
  const CustomTextButton({
    required this.onPressed,
    required this.text,
    this.fontSize,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: AppTypography.kAppStyle(fontSize: 18).copyWith(
          color: color ?? AppColors.kBlack,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
