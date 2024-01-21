import 'dart:developer';

import 'package:dinefinder_user/app/core/core.dart';
import 'package:dinefinder_user/app/global-widgets/app_snackbar.dart';
import 'package:dinefinder_user/app/users/modules/auth/domain/entities/user_entity.dart';
import 'package:dinefinder_user/app/users/modules/auth/domain/repositories/auth_repository_interface.dart';
import 'package:dinefinder_user/app/users/modules/auth/presentation/controllers/image_picker_controller.dart';
import 'package:dinefinder_user/app/users/modules/auth/presentation/controllers/location_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxService {
  final AuthRepositoryInterface _repository;

  AuthController(this._repository);
  RxString profileUrl = "".obs;

  final isLoading = false.obs;
  final isValid = false.obs;
  final isPassVisible = true.obs;
  final isPassValid = false.obs;
  final isEmailValid = false.obs;
  final isNameValid = false.obs;
  final isLocValid = false.obs;
  final isMobileValid = false.obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final mobileController = TextEditingController();

// LOGIN
  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();

  final locationController = Get.find<LocationController>();
  FirebaseAuth auth = Get.find<FirebaseAuth>();
  final imageController = Get.find<ImagePickerController>();

  late final _user = Rx<User?>(auth.currentUser);

  User? get user => _user.value;

  var currentUser = Rx<UserEntity?>(null);

  void fetchAndUpdateCurrentUser() {
    _repository
        .getCurrentUserData(AuthUtils.signUpUserData!.uid!)
        .listen((usersList) {
      if (usersList.isNotEmpty) {
        currentUser.value = usersList.first;
      } else {
        AppSnackBar.showSnackbar(msg: "No user found.");
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(auth.authStateChanges());
  }

  togglePasword() {
    isPassVisible.value = !isPassVisible.value;
  }

  checkEmail(String text) {
    if (text.isNotEmpty) {
      isEmailValid.value = true;
    } else {
      isEmailValid.value = false;
    }
    checkVal();
  }

  checkPass(String text) {
    if (text.isNotEmpty) {
      isPassValid.value = true;
    } else {
      isPassValid.value = false;
    }

    checkVal();
  }

  checkLoc(String text) {
    if (text.isNotEmpty) {
      isLocValid.value = true;
    } else {
      isLocValid.value = false;
    }
    checkVal();
  }

  checkMobile(String text) {
    if (text.isNotEmpty) {
      isMobileValid.value = true;
    } else {
      isMobileValid.value = false;
    }
    checkVal();
  }

  checkName(String text) {
    if (text.isNotEmpty) {
      isNameValid.value = true;
    } else {
      isNameValid.value = false;
    }
    checkVal();
  }

  void checkVal() {
    if (isNameValid.value &&
        isEmailValid.value &&
        isLocValid.value &&
        isMobileValid.value &&
        isPassValid.value) {
      isValid.value = true;
    } else {
      isValid.value = false;
    }
  }

  void logout() async {
    _repository.logout();
    await AuthUtils.onLogoutClearUserData();
    Nav.pushAndRemoveUntilNamed(Routes.loginview);
  }

  void signin() async {
    isLoading.value = true;
    FocusScope.of(Get.context!).requestFocus(FocusNode());

    await _repository
        .signInUser(
      UserEntity(
        email: loginEmailController.text.trim(),
        password: loginPasswordController.text.trim(),
      ),
    )
        .catchError((error) {
      isLoading.value = false;
    });

    isLoading.value = false;
    final List<UserEntity> userDataList =
        await _repository.getCurrentUserData(user!.uid).first;

    if (await _repository.isSignedIn()) {
      if (userDataList.isNotEmpty) {
        Nav.pushAndRemoveUntilNamed(Routes.dineUser);
        final currentUserData = userDataList.first;
        log("Fetched Profile URL: ${currentUserData.profUrl}");
        AuthUtils.setSignUpUserData(currentUserData);
        log("Stored Profile URL new: ${currentUserData.profUrl}");
        // AuthUtils.getAuthLocalData();
        loginEmailController.clear();
        loginPasswordController.clear();
      }
    }
  }

  /*  void login() async {
    isLoading.value = true;
    FocusScope.of(Get.context!).requestFocus(FocusNode());

    await _repository
        .signInUser(
      UserEntity(
        email: loginEmailController.text.trim(),
        password: loginPasswordController.text.trim(),
      ),
    )
        .then((value) {
      isLoading.value = false;
      AuthUtils.getAuthLocalData();
      Nav.pushAndRemoveUntilNamed(Routes.bottomNav);
      loginEmailController.clear();
      loginPasswordController.clear();
    });
  } */

  void signup() async {
    try {
      isLoading.value = true;
      FocusScope.of(Get.context!).requestFocus(FocusNode());

      UserEntity value = await _repository.rgisterUser(
        UserEntity(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
          name: nameController.text.trim(),
          mobileNumber: mobileController.text.trim(),
          image: imageController.imageFile.value,
          location: locationController.locationTextController.text.trim(),
          uid: "",
        ),
      );

      if (value.uid != null) {
        isLoading.value = false;
        AuthUtils.setSignUpUserData(value);
        profileUrl.value = value.profUrl!;
        log("Prof=> ${profileUrl.value}");

        Nav.pushAndRemoveUntilNamed(Routes.dineUser);
        // To clear the textfields after register
        passwordController.clear();
        emailController.clear();
        nameController.clear();
        mobileController.clear();
        imageController.imageFile.value = null;
        locationController.locationTextController.clear();
        isLoading.value = false;

        log("User id:=> ${AuthUtils.signUpUserData?.uid}");
        log("User email:=> ${AuthUtils.signUpUserData?.email}");
      }
    } catch (error) {
      isLoading.value = false;

      log("Error during signup: $error");
    }
  }
}
