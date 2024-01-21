import 'dart:convert';

import 'package:dinefinder_user/main.dart';
import 'package:dinefinder_user/app/core/core.dart';
import 'package:dinefinder_user/app/users/modules/auth/data/models/user_model/user_model.dart';
import 'package:dinefinder_user/app/users/modules/auth/domain/entities/user_entity.dart';

class AuthUtils {
  const AuthUtils._();

  static bool isOnboarded = false;
  static UserEntity? signUpUserData;

  static Future<void> getAuthLocalData() async {
    // await getIsOnBoarded();
    await _getSignUpUserData();
  }

  static Future<void> setIsOnBoarded({bool val = false}) async {
    await box.write(AppKeys.isOnboarded, val);
    await getIsOnBoarded();
  }

  static Future<void> getIsOnBoarded() async {
    if (box.hasData(AppKeys.isOnboarded)) {
      isOnboarded = box.read(AppKeys.isOnboarded) as bool;
    }
  }

  // static Future<void> onLogoutClearUserData() async {
  //   await box.erase();
  //   signUpUserData = null;
  //   await setSignUpUserData(signUpUserData!);
  // }
  static Future<void> onLogoutClearUserData() async {
    await box.remove(AppKeys.signUpUserData);
    signUpUserData = null;
  }

  static Future<void> clearData() async {
    // Nav.pushAndRemoveUntilNamed(Routes.onboardingView);
    await box.erase();
    await setIsOnBoarded(val: true);

    // await setSignUpUserData("");
    isOnboarded = false;
  }

  static Future<void> setSignUpUserData(UserEntity data) async {
    if (data.uid != null) {
      final encoded = jsonEncode(data.toModel());
      await box.write(AppKeys.signUpUserData, encoded);
      await _getSignUpUserData();
    }
  }

  static Future<void> _getSignUpUserData() async {
    if (box.hasData(AppKeys.signUpUserData)) {
      final rawData = await box.read(AppKeys.signUpUserData);
      if (rawData != null) {
        final userModel =
            UserModel.fromJson(jsonDecode(rawData) as Map<String, dynamic>);
        final res = UserEntity.fromModel(userModel);
        if (res.uid != null) {
          signUpUserData = res;
        }
      }
    }
  }
}
