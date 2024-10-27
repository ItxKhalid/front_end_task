import 'package:fl_chart/fl_chart.dart';
import '../../../../../eleme'
    'nts/constants/constants.dart';
import '../../../../../elements/widgets/stack_card.dart';

class GenderCard extends StatelessWidget {
  const GenderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomStackCard(
        borderRadius: 16,
        offset: 30,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text20(
                    text: 'Gender',
                    style: AppTypography.kAppStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  SvgPicture.asset(AppAssets.kMore),
                ],
              ),
              const SizedBox(height: 16),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 200,
                    child: PieChart(
                      swapAnimationDuration: const Duration(milliseconds: 150),
                      swapAnimationCurve: Curves.linear,
                      PieChartData(
                        sectionsSpace: 5,
                        centerSpaceRadius: 60,
                        startDegreeOffset: 320,
                        sections: [
                          PieChartSectionData(
                            value: 42,
                            color: AppColors.kIndigo,
                            badgeWidget: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: AppColors.kWhite,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    offset: const Offset(0, 4),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              child: Text15(
                                text: '42%',
                                style: AppTypography.kAppStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            radius: 15,
                            showTitle: false,
                          ),
                          PieChartSectionData(
                            value: 58,
                            color: AppColors.kYellow,
                            radius: 15,
                            badgeWidget: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: AppColors.kWhite,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    offset: const Offset(0, 4),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              child: Text15(
                                text: '58%',
                                style: AppTypography.kAppStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            showTitle: false,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
              _buildGenderStats()
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildGenderStats() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.kIndigo,width: 3)
              ),
            ),
            const SizedBox(width: 6),
            Text15(
              text: 'Male: ',
              style: AppTypography.kAppStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400
              ),
            ),
             Text14(
            text: '352k',
              style: AppTypography.kAppStyle(
                  fontSize: 14,
                  color: AppColors.kGrayText,
                  fontWeight: FontWeight.w400
              ),
            ),
          ],
        ),
        const SizedBox(width: 20),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.kYellow,width: 3)
              ),
            ),
            const SizedBox(width: 6),
            Text15(
              text: 'Female: ',
              style: AppTypography.kAppStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400
              ),
            ),
            Text14(
              text: '884k',
              style: AppTypography.kAppStyle(
                  fontSize: 14,
                  color: AppColors.kGrayText,
                  fontWeight: FontWeight.w400
              ),
            ),
          ],
        ),
      ],
    );
  }
}
