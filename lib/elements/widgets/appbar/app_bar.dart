import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front_end_task/elements/constants/app_assets.dart';
import 'package:front_end_task/elements/constants/constants.dart';

import '../../constants/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function()? onPressed;

  const CustomAppBar({super.key, this.onPressed});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: const BoxDecoration(
        color: AppColors.kWhiteBg,
        border: Border(
          left: BorderSide(
            color: AppColors.kGray,
            width: 1.5,
          ),
          bottom: BorderSide(
            color: AppColors.kGray,
            width: 2,
          ),
        ),
      ),
      child: SafeArea(
        child: Row(
          children: [
            IconButton(
              icon: SvgPicture.asset(AppAssets.kGridView),
              color: Colors.black87,
              onPressed: onPressed,
            ),
            const Spacer(),
            Row(
              children: [
                // Search Button
                IconButton(
                  icon: SvgPicture.asset(AppAssets.kSearchSvg),
                  color: Colors.black87,
                  onPressed: () {
                    // Add search functionality
                  },
                ),

                // Settings Button
                IconButton(
                  icon: SvgPicture.asset(AppAssets.kSettingSvg),
                  color: Colors.black87,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Badge(
                    backgroundColor: AppColors.kOrange,
                    smallSize: 7,
                    child: SvgPicture.asset(
                      AppAssets.kNotificationSvg,
                    ),
                  ),
                  onPressed: () {
                    // Add search functionality here
                  },
                ),
              ],
            ),
            const VerticalDivider(color: AppColors.kGray,indent: 6,endIndent: 6,width: 1.5),
            20.horizontalSpace,
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orange[100],
              ),
              child: ClipOval(
                child: Center(
                  child: SvgPicture.asset(AppAssets.kAvatarPro),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
