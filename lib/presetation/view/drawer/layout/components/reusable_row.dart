import '../../../../../elements/constants/constants.dart';

class ReusableRow extends StatelessWidget {
  final String imagePath;
  final String text;
  final Widget? trailingWidget;
  final bool isSelected; // New parameter to indicate selection

  const ReusableRow({
    super.key,
    required this.imagePath,
    required this.text,
    this.trailingWidget,
    this.isSelected = false, // Default to false
  });

  @override
  Widget build(BuildContext context) {
    bool isSvg = imagePath.endsWith('.svg');
    bool isPngOrJpg = imagePath.endsWith('.png') || imagePath.endsWith('.jpg');

    return Container(
      width: 238.w,
      height: 56.h,
      padding: EdgeInsets.all(17.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: isSelected == false ? Colors.transparent : AppColors.kPrimary.withOpacity(.10),
      ),
      child: Row(
        children: [
          if (isSvg)
            SvgPicture.asset(
              imagePath,
              height: 22.h,
              width: 22.w,
              color: isSelected ?  text == 'Calendar' ? null : AppColors.kPrimary : text == 'Calendar' ? AppColors.kBlack : null,
            )
          else if (isPngOrJpg)
            Image.asset(
              imagePath,
              height: 22.h,
              width: 22.w,
              color: isSelected ? AppColors.kPrimary : null,
            )
          else
            Container(),
          16.horizontalSpace,
          Text15(text: text,style: AppTypography.kAppStyle(fontSize: 15).copyWith(color: isSelected ? AppColors.kPrimary : null,

          )),
          const Spacer(),
          if (trailingWidget != null) trailingWidget!,
        ],
      ),
    );
  }
}
