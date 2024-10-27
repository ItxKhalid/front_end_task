import '../../constants/constants.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final bool isEnabled;
  final String? hintText;
  final void Function(String)? onChanged;

  const SearchField({
    required this.controller,
    this.isEnabled = true,
    this.onChanged,
    this.hintText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      textAlignVertical: TextAlignVertical.bottom,
      enabled: isEnabled,
      decoration: InputDecoration(
        hintText: hintText ?? 'Search...',
        hintStyle: AppTypography.kAppStyle(fontWeight: FontWeight.w400)
            .copyWith(color: AppColors.kGrayText),
        border: InputBorder.none,
        prefixIcon: Padding(
          padding: EdgeInsets.all(14.h),
          child: SvgPicture.asset(
            AppAssets.kSearchSvg,
          ),
        ),
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
      ),
    );
  }
}
