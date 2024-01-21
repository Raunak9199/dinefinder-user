import 'dart:developer';
import 'dart:io';

import 'package:dinefinder_user/app/core/core.dart';
import 'package:dinefinder_user/app/global-widgets/app_elevated_button.dart';
import 'package:dinefinder_user/app/global-widgets/app_scaffold.dart';
import 'package:dinefinder_user/app/global-widgets/app_text_form_field.dart';
import 'package:dinefinder_user/app/users/modules/auth/presentation/controllers/auth_controller.dart';
import 'package:dinefinder_user/app/users/modules/auth/presentation/controllers/image_picker_controller.dart';
import 'package:dinefinder_user/app/users/modules/auth/presentation/controllers/location_controller.dart';
import 'package:dinefinder_user/app/users/modules/auth/presentation/local-widget/terms_and_cond.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignupView extends GetView<AuthController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final locationController = Get.find<LocationController>();
    final imageController = Get.find<ImagePickerController>();
    return AppScaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "aut_register".tr,
                    style: Get.textTheme.titleSmall!
                        .copyWith(color: AppColor.monoWhite),
                  ),
                  InkWell(
                    onTap: imageController.chooseImage,
                    child: SizedBox(
                      height: 80.w,
                      width: 80.w,
                      child: CircleAvatar(
                        child: Obx(
                          () {
                            if (imageController.imageFile.value != null) {
                              return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50.r),
                                  child: Image(
                                    fit: BoxFit.contain,
                                    image: FileImage(
                                      File(imageController
                                          .imageFile.value!.path),
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return const Center(
                                child: Icon(
                                  Icons.add_a_photo,
                                  size: 28,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              SizedBox(height: 20.h),
              AppTextFormField(
                controller: controller.nameController,
                borderColor: AppColor.monoAlt,
                hintText: "aut_enterName".tr,
                prefixIcon: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                  child: Icon(
                    Icons.person_4,
                    color: AppColor.mono.withOpacity(0.6),
                  ),
                ),
                // onChanged: (text) => controller.checkName(text),
              ),
              SizedBox(height: 10.h),
              AppTextFormField(
                controller: controller.mobileController,
                borderColor: AppColor.monoAlt,
                hintText: "aut_enterMobile".tr,
                keyboardType: TextInputType.number,
                prefixIcon: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                  child: Icon(
                    Icons.phone,
                    color: AppColor.mono.withOpacity(0.6),
                  ),
                ),
                // onChanged: (text) => controller.checkMobile(text),
              ),
              SizedBox(height: 10.h),
              AppTextFormField(
                controller: controller.emailController,
                borderColor: AppColor.monoAlt,
                hintText: "aut_enterEmail".tr,
                prefixIcon: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                  child: Icon(
                    Icons.email_outlined,
                    color: AppColor.mono.withOpacity(0.6),
                  ),
                ),
                // onChanged: (text) => controller.checkEmail(text),
              ),
              SizedBox(height: 10.h),
              Obx(
                () => AppTextFormField(
                  borderColor: AppColor.monoAlt,
                  hintText: "aut_loc".tr,
                  readOnly: locationController.isLoading.value,
                  controller: locationController.locationTextController,
                  prefixIcon: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                    child: Icon(
                      Icons.pin_drop_outlined,
                      color: AppColor.mono.withOpacity(0.6),
                    ),
                  ),
                  suffixIcon: InkWell(
                    onTap: () async {
                      log("Suffix icon tapped!");
                      await locationController.fetchAndSetLocation();
                    },
                    child: !locationController.isLoading.value
                        ? Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 3.h),
                            child: Tooltip(
                              message: 'Get current location',
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              textStyle: const TextStyle(color: Colors.white),
                              child: Icon(
                                Icons.my_location,
                                color: AppColor.mono.withOpacity(0.6),
                              ),
                            ),
                          )
                        : const CircularProgressIndicator(),
                  ),
                  // onChanged: (text) => controller.checkLoc(text),
                ),
              ),
              SizedBox(height: 15.h),
              Obx(
                () => AppTextFormField(
                  controller: controller.passwordController,
                  borderColor: AppColor.monoAlt,
                  isObscure: controller.isPassVisible.value,
                  hintText: "aut_enterPass".tr,
                  prefixIcon: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                    child: Icon(
                      Icons.lock_outline_rounded,
                      color: AppColor.mono.withOpacity(0.6),
                    ),
                  ),
                  suffixIcon: InkWell(
                    onTap: controller.togglePasword,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                      child: Icon(
                        controller.isPassVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: AppColor.mono.withOpacity(0.6),
                      ),
                    ),
                  ),
                  // onChanged: (text) => controller.checkPass(text),
                ),
              ),
              SizedBox(height: 60.h),
              Obx(
                () => Center(
                  child: AppElevatedButton(
                    height: 45.h,
                    width: double.maxFinite,
                    title: "aut_signupText".tr,
                    color: AppColor.secondaryAlt,
                    isLoading: controller.isLoading.value,
                    isValid: true,
                    radius: 15.r,
                    isUpperCase: true,
                    style: subheading4,
                    onPressed: () {
                      log("btn clicked");
                      if (controller.emailController.text.isEmpty &&
                          controller.nameController.text.isEmpty &&
                          controller.passwordController.text.isEmpty &&
                          controller.mobileController.text.isEmpty &&
                          controller.locationController.locationTextController
                              .text.isEmpty) {
                        null;
                      } else {
                        controller.signup();
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "aut_haveAcc".tr,
                      style: Get.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: AppColor.monoWhite,
                      ),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Nav.pop(),
                          text: "aut_loginText".tr,
                          style: Get.textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                              color: AppColor.secondary),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const TermsAndCond(),
    );
  }
}
