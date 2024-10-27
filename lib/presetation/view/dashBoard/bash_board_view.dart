import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front_end_task/elements/constants/app_assets.dart';
import 'package:front_end_task/elements/constants/constants.dart';

import '../../../elements/constants/app_colors.dart';
import '../../../elements/widgets/stack_card.dart';
import 'layout/components/activity_card.dart';
import 'layout/components/followers_card.dart';
import 'layout/components/gender_card.dart';
import 'layout/components/overview_card.dart';
import 'layout/components/statistics_card.dart';

class AnalyticsDashboard extends StatelessWidget {
  const AnalyticsDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.verticalSpace,
              _buildHeader(),
              22.verticalSpace,
              const OverviewCard(),
              22.verticalSpace,
              const FollowersCard(),
              16.verticalSpace,
              const GenderCard(),
              16.verticalSpace,
              const ActivityCard(),
              16.verticalSpace,
              const StatisticsCard(),
              16.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text30(
            text: 'Overview',
            style: AppTypography.kAppStyle(fontSize: 28),
          ),
          Container(
            width: 40,
            height: 40,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: AppColors.kWhite,
                borderRadius: BorderRadius.circular(12)),
            child: SvgPicture.asset(AppAssets.kProgress),
          ),
        ],
      ),
    );
  }
}
