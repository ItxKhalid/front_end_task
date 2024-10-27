import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../elements/constants/constants.dart';
import '../../../../../elements/widgets/stack_card.dart';

class OverviewCard extends StatelessWidget {
  final String dropdownValue;
  final String username;
  final String platformName;
  final String followersCount;
  final String followersGrowth;
  final int itemCount;

  const OverviewCard({
    super.key,
    this.dropdownValue = 'This Week',
    this.username = 'mitchell.cooper',
    this.platformName = 'Facebook',
    this.followersCount = '353,49K',
    this.followersGrowth = '1.43%',
    this.itemCount = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Container(
                height: 48,
                width: 48,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.kWhiteBg,
                  border: Border.all(color: AppColors.kGray),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: SvgPicture.asset(AppAssets.kDownload),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  height: 48,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: AppColors.kWhiteBg,
                    border: Border.all(color: AppColors.kGray),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      style: AppTypography.kAppStyle(fontSize: 15, fontWeight: FontWeight.w400),
                      items: ['This Week', 'This Month', 'This Year']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text15(
                            text: value,
                            style: AppTypography.kAppStyle(fontSize: 15, fontWeight: FontWeight.w400),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        // Handle dropdown value change
                      },
                      icon: const Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.kBlack),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        22.verticalSpace,
        SizedBox(
          height: 188,
          child: ListView.builder(
            itemCount: itemCount,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: CustomStackCard(
                  borderRadius: 16,
                  offset: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            index == 0
                                ? const Icon(
                              Icons.facebook,
                              color: Colors.blue,
                              size: 50,
                            )
                                : Container(
                              height: 48,
                              width: 48,
                              clipBehavior: Clip.hardEdge,
                              decoration: const BoxDecoration(shape: BoxShape.circle),
                              child: index == 1
                                  ? Image.asset(AppAssets.kInsta, fit: BoxFit.fill)
                                  : const Icon(
                                Icons.facebook,
                                color: Colors.blue,
                                size: 60,
                              ),
                            ),
                            16.horizontalSpace,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text15(
                                  text: username,
                                  style: AppTypography.kAppStyle(
                                      fontWeight: FontWeight.w600, fontSize: 15),
                                ),
                                4.verticalSpace,
                                Text15(
                                  text: index == 1 ? 'Instagram' : platformName,
                                  style: AppTypography.kAppStyle(
                                      fontWeight: FontWeight.w400, fontSize: 15)
                                      .copyWith(color: AppColors.kGrayText),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text30(
                                  text: followersCount,
                                  style: AppTypography.kAppStyle(
                                      fontSize: 28, fontWeight: FontWeight.w600)
                                      .copyWith(height: 1),
                                ),
                                Text15(
                                  text: 'Followers',
                                  style: AppTypography.kAppStyle(
                                      fontWeight: FontWeight.w400, fontSize: 15)
                                      .copyWith(color: AppColors.kGrayText),
                                ),
                              ],
                            ),
                            14.horizontalSpace,
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
                                    followersGrowth,
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
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
