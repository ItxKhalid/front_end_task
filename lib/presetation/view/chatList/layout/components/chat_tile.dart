import 'package:front_end_task/elements/constants/constants.dart';
import '../../../../../configuration/frontend_configs.dart';

class ChatTile extends StatelessWidget {
  final String name;
  final String message;
  final bool isOnline;
  final bool useTextAvatar;
  final bool? isSelected;
  final String? avatarText;
  final String? avatar;
  final int? unreadCount;

  const ChatTile({
    super.key,
    required this.name,
    required this.message,
    required this.isOnline,
    this.isSelected = false,
    required this.useTextAvatar,
    this.avatarText,
    this.avatar,
    this.unreadCount,
  });

  @override
  Widget build(BuildContext context) {
    final gradientColors = FrontendConfigs().getGradientColorsFromName(name);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: isSelected == false ? const Color(0xffF5F7FA) : AppColors.kWhite
      ),
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: gradientColors,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: useTextAvatar
                    ? Center(
                  child: Text18(
                    text: avatarText ?? '',
                    style: AppTypography.kAppStyle(fontSize: 18),
                  ),
                )
                    : ClipOval(
                  child: avatar != null
                      ? SvgPicture.asset(
                    avatar!,
                    fit: BoxFit.cover,
                  )
                      : const SizedBox(),
                ),
              ),
              if (isOnline)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text15(
                  text: name,
                  style:
                  AppTypography.kAppStyle(fontWeight: FontWeight.w600, fontSize: 15)
                      .copyWith(color: AppColors.kGrayText),
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          if (unreadCount != null)
            Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                unreadCount.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
