import '../../../../../elements/constants/constants.dart';
import '../../../../../elements/widgets/dotted_line.dart';
import '../../../../../elements/widgets/stack_card.dart';
import 'attendee_row.dart';

class EventCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<String> times;
  final String time;
  final Color accentColor;
  final int attendeeCount;

  const EventCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.times,
    required this.time,
    required this.accentColor,
    required this.attendeeCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 140,
          width: 40,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: times.length,
            itemBuilder: (context, index) {
              // Return each time slot with spacing
              return Column(
                children: [
                  if (index > 0) const SizedBox(height: 40),
                  Text14(
                    text: times[index],
                    style: AppTypography.kAppStyle(fontWeight: FontWeight.w400),
                  ),
                ],
              );
            },
          ),
        ),
        10.horizontalSpace,
        Flexible(
          child: Column(
            children: [
              DottedLine(
                dotWidth: 6,
                spacing: 8,
                color: AppColors.kGray100.withOpacity(0.5),
              ),
              CustomStackCard(
                borderRadius: 14,
                offset: 28,
                child: Row(
                  children: [
                    Container(
                      width: 4,
                      height: 84,
                      decoration: BoxDecoration(
                        color: accentColor,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text15(
                            text: title,
                            style: AppTypography.kAppStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Text12(
                                text: subtitle,
                                style: AppTypography.kAppStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ).copyWith(color: AppColors.kGray100),
                              ),
                              const SizedBox(width: 40),
                              SvgPicture.asset(AppAssets.kTime),
                              const SizedBox(width: 4),
                              Text12(
                                text: time,
                                style: AppTypography.kAppStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ).copyWith(color: AppColors.kGray100),
                              ),
                            ],
                          ),
                          const SizedBox(height: 13),
                          AttendeeRow(
                            imagePaths: [
                              AppAssets.kAvatar,
                              AppAssets.kAvatar1,
                              AppAssets.kAvatar2,
                              AppAssets.kAvatar3,
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              5.verticalSpace,
              DottedLine(
                dotWidth: 6,
                spacing: 8,
                color: AppColors.kGray100.withOpacity(0.5),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
