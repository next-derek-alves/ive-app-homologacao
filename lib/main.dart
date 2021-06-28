import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

import './core/core.dart';
import './features/features.dart';

void main() async {
  await DotEnv.load();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends GetView<AuthenticationController> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(elevation: 0),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.white,
        accentColor: AppColors.darkOrange,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(primary: AppColors.darkOrange),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                primary: AppColors.darkOrange,
                textStyle: AppTextStyles.whiteHeading18)),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: AppColors.darkOrange,
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.darkOrange),
          ),
        ),
      ),
      defaultTransition: Transition.cupertino,
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        defaultScale: true,
        minWidth: 450,
        breakpoints: [
          ResponsiveBreakpoint.autoScaleDown(450, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
        ],
      ),
      initialBinding: MainBindings(),
      home: Obx(() {
        if (controller.state is AuthenticationState &&
            GetStorage().read("token") != null &&
            controller.tokenExpired(GetStorage().read("token")) != true) {
          return HomePage();
        }

        if (GetStorage().read("token") != null &&
            controller.tokenExpired(GetStorage().read("token"))) {
          GetStorage().remove("token");
          return LoginPage();
        }

        return LandingPage();
      }),
      getPages: [
        GetPage(
            name: AppRoutes.LANDING_PAGE,
            page: () => LandingPage(),
            middlewares: []),
        GetPage(
          name: AppRoutes.HOME,
          page: () => HomePage(),
          middlewares: [AuthRoutesMiddleware()],
        ),
        GetPage(
          name: AppRoutes.LOGIN,
          page: () => LoginPage(),
        ),
        GetPage(
            name: AppRoutes.INSTITUTIONAL_VIDEO,
            page: () => InstitutionalVideo()),
      ],
    );
  }
}
