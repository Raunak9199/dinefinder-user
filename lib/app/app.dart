import 'package:dinefinder_user/app/core/core.dart';
import 'package:dinefinder_user/app/users/modules/auth/presentation/bindings/auth_binding.dart';
import 'package:dinefinder_user/app/users/modules/auth/presentation/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DineFinderUser extends StatelessWidget {
  const DineFinderUser({super.key});

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        designSize: const Size(360, 779),
        minTextAdapt: true,
        builder: (_, __) {
          AuthBinding().dependencies();
          final AuthController authController = Get.find<AuthController>();
          return GetMaterialApp(
            translations: AppTranslations(),
            locale: const Locale('en', 'US'),
            fallbackLocale: const Locale('en', 'US'),
            initialBinding: AuthBinding(),
            theme: myTheme,
            themeMode: ThemeMode.dark,
            debugShowCheckedModeBanner: false,
            title: "DineFinderUser",
            initialRoute: authController.user == null
                ? AppPages.initial
                : Routes.dineUser,
            getPages: AppPages.routes,
          );
        },
      );
}
