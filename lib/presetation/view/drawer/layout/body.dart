import 'package:front_end_task/elements/constants/constants.dart';
import 'package:front_end_task/elements/widgets/appbar/app_bar.dart';
import 'package:front_end_task/utils/utils.dart';
import '../../calender/calender_view.dart';
import '../../calender/layout/body.dart';
import '../../chatList/chat_list_view.dart';
import 'components/reusable_row.dart';

class DrawerBody extends StatefulWidget {
  const DrawerBody({super.key});

  @override
  _DrawerBodyState createState() => _DrawerBodyState();
}

class _DrawerBodyState extends State<DrawerBody> {
  double value = 0;
  int selectedScreenIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: Container(
            width: 270.0,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 21),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child:
                      Image.asset(AppAssets.kLogoPng, width: 120, height: 38),
                ),
                20.verticalSpace,
                Expanded(
                  child: ListView.builder(
                    itemCount: Utils().drawerItems.length,
                    itemBuilder: (context, index) {
                      Widget? trailingWidget;
                      if (index == 1) {
                        // e_com index
                        trailingWidget = const Icon(Icons.arrow_forward_ios_rounded,color: AppColors.kGray);
                      } else if (index == 3) {
                        trailingWidget = Container(

                          padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 6.5),
                          decoration: const BoxDecoration(
                            color: AppColors.kOrange,
                            shape: BoxShape.circle,
                          ),
                          child: Text15(
                            text: '8',
                            style: AppTypography.kAppStyle(fontSize: 15)
                                .copyWith(color: AppColors.kWhite),
                          ),
                        );
                      }

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedScreenIndex =
                                index;
                            value = 0;
                          });
                        },
                        child: ReusableRow(
                          imagePath: Utils().drawerItems[index]['image']!,
                          text: Utils().drawerItems[index]['name']!,
                          isSelected: selectedScreenIndex == index,
                          trailingWidget: trailingWidget,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: value),
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
          builder: (_, double val, __) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..setEntry(0, 3, 270 * val),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    value = 0;
                  });
                },
                child: AbsorbPointer(
                  absorbing: value == 1,
                  child: Scaffold(
                    appBar: CustomAppBar(
                      onPressed: () {
                        setState(() {
                          value = value == 0 ? 1 : 0;
                        });
                      },
                    ),
                    body: IndexedStack(
                      index: selectedScreenIndex,
                      children:   [
                        const CalenderView(),
                        const CalenderView(),
                        const CalenderView(),
                        const CalenderView(),
                        MessagesScreen(),
                        const CalenderView(),
                        const CalenderView(),
                        const CalenderView(),
                        const CalenderView(),
                        const CalenderView(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        _rightClick(),
      ],
    );
  }

  Widget _rightClick() {
    return GestureDetector(
      onHorizontalDragUpdate: (e) {
        setState(() {
          value = e.delta.dx > 0 ? 1 : 0;
        });
      },
    );
  }
}
