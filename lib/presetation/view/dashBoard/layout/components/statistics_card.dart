import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:front_end_task/elements/constants/constants.dart';
import '../../../../../elements/widgets/stack_card.dart';

class StatisticsCard extends StatelessWidget {
  final String dropdownValue;

  const StatisticsCard({
    super.key,
    this.dropdownValue = 'This Week',
  });

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
              Text20(
                text: 'Statistics',
                style: AppTypography.kAppStyle(
                    fontWeight: FontWeight.w600, fontSize: 20),
              ),
              const SizedBox(height: 16),
              Container(
                height: 48,
                width: double.infinity,
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: AppColors.kWhiteBg,
                  border: Border.all(color: AppColors.kGray),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    style: AppTypography.kAppStyle(
                        fontSize: 15, fontWeight: FontWeight.w400),
                    items: ['This Week', 'This Month', 'This Year']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text15(
                          text: value,
                          style: AppTypography.kAppStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      // Handle dropdown value change
                    },
                    icon: const Icon(Icons.keyboard_arrow_down_rounded,
                        color: AppColors.kBlack),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text15(
                        text: 'Share',
                        style: AppTypography.kAppStyle(
                            fontSize: 15,
                            color: AppColors.kGrayText,
                            fontWeight: FontWeight.w400),
                      ),
                      4.verticalSpace,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text20(
                            text: '254,68K',
                            style: AppTypography.kAppStyle(
                                fontSize: 20, fontWeight: FontWeight.w600)
                                .copyWith(height: 1),
                          ),
                          10.horizontalSpace,
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
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
                                4.horizontalSpace,
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
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Likes',
                        style: AppTypography.kAppStyle(
                            fontSize: 15,
                            color: AppColors.kGrayText,
                            fontWeight: FontWeight.w400),
                      ),
                      4.verticalSpace,
                      Text20(
                        text: '34,293',
                        style: AppTypography.kAppStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)
                            .copyWith(height: 1),
                      ),
                    ],
                  ),
                ],
              ),
              24.verticalSpace,
              SizedBox(
                height: 200,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    barTouchData: BarTouchData(
                      enabled: true,
                      touchTooltipData: BarTouchTooltipData(
                        tooltipPadding: const EdgeInsets.all(8),
                        tooltipMargin: 8,
                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                          return BarTooltipItem(
                            'Value: ${rod.toY}',
                            const TextStyle(color: Colors.white),
                          );
                        },
                      ),
                      touchCallback: (FlTouchEvent event, BarTouchResponse? response) {
                        if (event is FlTapUpEvent && response != null) {
                          // Handle touch event here
                        }
                      },
                    ),
                    barGroups: [
                      makeGroupData(0, 5, 12, 8),
                      makeGroupData(1, 10, 9, 14),
                    ],
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 40,
                          getTitlesWidget: (value, meta) {
                            return Text12(
                              text: value.toInt().toString(),
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                            );
                          },
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (double value, _) {
                            const days = ['Mon', 'Tue'];
                            return Text(
                              days[value.toInt()],
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                            );
                          },
                        ),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2, double y3) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: Colors.purple,
          width: 10,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        BarChartRodData(
          toY: y2,
          color: Colors.amber,
          width: 10,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        BarChartRodData(
          toY: y3,
          color: Colors.orange,
          width: 10,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
      ],
    );
  }
}
