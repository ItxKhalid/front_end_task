import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:front_end_task/elements/widgets/text/text_widget.dart';
import '../../../../../elements/constants/constants.dart';
import '../../../../../elements/widgets/stack_card.dart';

class FollowersCard extends StatelessWidget {
  final String title;
  final String moreIconAsset;
  final List<double> followersData;
  final double maxY;
  final String followersCount;
  final String unfollowedCount;

  const FollowersCard({
    Key? key,
    this.title = 'Followers',
    this.moreIconAsset = 'assets/images/More.svg',
    this.followersData = const [40, 50, 60, 80, 45, 30, 55],
    this.maxY = 100,
    this.followersCount = '834',
    this.unfollowedCount = '152',
  }) : super(key: key);

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
                    text: title,
                    style: AppTypography.kAppStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20
                    ),
                  ),
                  SvgPicture.asset(AppAssets.kMore),
                ],
              ),
              23.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text30(
                    text: '254,68K',
                    style: AppTypography.kAppStyle(
                        fontSize: 28, fontWeight: FontWeight.w600)
                        .copyWith(height: 1),
                  ),
                  12.horizontalSpace,
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.green[50],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          CupertinoIcons.arrow_up_right,
                          color: Colors.green[400],
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '6.18%',
                          style: TextStyle(
                            color: Colors.green[400],
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              23.verticalSpace,
              SizedBox(
                height: 200,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: maxY,
                    barTouchData: BarTouchData(enabled: false),
                    titlesData: FlTitlesData(
                      show: true,
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            const titles = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
                            return Text(
                              titles[value.toInt()],
                              style: TextStyle(
                                  color: Colors.grey[600], fontSize: 12),
                            );
                          },
                        ),
                      ),
                      leftTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    gridData: const FlGridData(show: false),
                    borderData: FlBorderData(show: false),
                    barGroups: followersData
                        .asMap()
                        .entries
                        .map((entry) => _generateBar(entry.key, entry.value))
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text30(
                        text: followersCount,
                        style: AppTypography.kAppStyle(
                            fontSize: 24,
                            color: AppColors.kGreen,
                            fontWeight: FontWeight.w600)
                            .copyWith(height: 1),
                      ),
                      Text15(
                        text:'Followers',
                        style: AppTypography.kAppStyle(
                            fontSize: 15,
                            color: AppColors.kGrayText,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text30(
                        text: unfollowedCount,
                        style: AppTypography.kAppStyle(
                            fontSize: 24,
                            color: AppColors.kOrangeLight,
                            fontWeight: FontWeight.w600)
                            .copyWith(height: 1),
                      ),
                      Text15(
                        text:'Unfollowed',
                        style: AppTypography.kAppStyle(
                            fontSize: 15,
                            color: AppColors.kGrayText,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  BarChartGroupData _generateBar(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: x == 3 ? AppColors.kOrangeLight : AppColors.kIndigo,
          width: 12,
          borderRadius: BorderRadius.circular(8),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: maxY,
            color: AppColors.kGrayText.withOpacity(0.2), // Distinct background
          ),
        ),
      ],
    );
  }
}
