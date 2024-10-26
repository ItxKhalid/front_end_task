import 'elements/constants/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: GetMaterialApp(
            title: '',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                useMaterial3: true,
                backgroundColor: AppColors.kWhiteBg,
                scaffoldBackgroundColor: AppColors.kWhiteBg
            ),
            useInheritedMediaQuery: true,
            scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
            defaultTransition: Transition.fadeIn,
            home: const DrawerView(),
          ),
        );
      },
    );
  }
}
