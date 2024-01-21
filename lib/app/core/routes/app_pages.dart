import 'package:dinefinder_user/app/users/modules/auth/presentation/bindings/auth_binding.dart';
import 'package:dinefinder_user/app/users/modules/auth/presentation/views/login_view.dart';
import 'package:dinefinder_user/app/users/modules/auth/presentation/views/signup_view.dart';
import 'package:dinefinder_user/app/users/modules/dineuser/views/my_current_bookings_view.dart';
import 'package:dinefinder_user/app/users/modules/dineuser/views/dineuser_home_view.dart';
import 'package:get/get.dart';

import '../../users/modules/dineuser/bindings/dineuser_binding.dart';
import '../../users/modules/dineuser/views/detailed_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.loginview;

  static final routes = [
    GetPage(
      name: _Paths.loginview,
      page: () => const LoginView(),
      bindings: [AuthBinding()],
    ),
    GetPage(
      name: _Paths.signupview,
      page: () => const SignupView(),
      bindings: [AuthBinding()],
    ),
    // GetPage(
    //   name: _Paths.homeview,
    //   page: () => const HomeView(),
    //   bindings: [AuthBinding(), TabBarBinding()],
    //   // middlewares: [AuthMiddleware()],
    // ),
    // /* GetPage(
    //   name: _Paths.bottomNav,
    //   page: () => const BottomNavIndexPage(),
    //   bindings: [AuthBinding(), BottomNavBindings()],
    //   // middlewares: [AuthMiddleware()],
    // ), */
    // GetPage(
    //   name: _Paths.tabBarView,
    //   page: () => const AppTabBarView(),
    //   bindings: [AuthBinding(), TabBarBinding(), HomeViewBinding()],
    //   // middlewares: [AuthMiddleware()],
    // ),
    // GetPage(
    //   name: _Paths.profileView,
    //   page: () => const ProfileView(),
    //   bindings: [AuthBinding(), TabBarBinding(), ProfileBinding()],
    // ),
    // GetPage(
    //   name: _Paths.addMenuView,
    //   page: () => const AddMenuView(),
    //   bindings: [HomeViewBinding()],
    // ),
    // GetPage(
    //   name: Routes.editMenuPage,
    //   page: () => const EditmenuPage(),
    //   // arguments: const MenuPostEntity(),
    //   bindings: [TabBarBinding(), HomeViewBinding()],
    // ),
    // GetPage(
    //   name: Routes.editProfilePgae,
    //   page: () => const EditProfilePage(),
    //   bindings: [
    //     HomeViewBinding(),
    //     TabBarBinding(),
    //     ProfileBinding(),
    //   ],
    // ),
    GetPage(
      name: _Paths.detailedView,
      page: () => const DetailedView(),
      bindings: [DineuserBinding(), AuthBinding()],
    ),
    GetPage(
      name: _Paths.dineUser,
      page: () => const DineUserPage(),
      bindings: [DineuserBinding(), AuthBinding()],
    ),
    GetPage(
      name: _Paths.bookingView,
      page: () => const MyCurrentBookingsView(),
      binding: DineuserBinding(),
    ),
  ];
}
