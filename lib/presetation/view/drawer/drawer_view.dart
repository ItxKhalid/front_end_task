import 'package:flutter/material.dart';
import '../../../../elements/constants/constants.dart';
import 'layout/body.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: const Scaffold(
        backgroundColor: AppColors.kWhiteBg,
        resizeToAvoidBottomInset: false,
        body: DrawerBody(),
      ),
    );
  }
}
