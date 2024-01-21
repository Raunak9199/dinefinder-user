import 'dart:developer';

import 'package:dinefinder_user/app/core/core.dart';
import 'package:dinefinder_user/app/global-widgets/app_elevated_button.dart';
import 'package:dinefinder_user/app/global-widgets/app_scaffold.dart';
import 'package:dinefinder_user/app/global-widgets/app_text_form_field.dart';
import 'package:dinefinder_user/app/users/modules/auth/presentation/controllers/auth_controller.dart';
import 'package:dinefinder_user/app/users/modules/auth/presentation/local-widget/terms_and_cond.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 120.h),
              Text(
                "aut_login".tr,
                style: Get.textTheme.titleSmall!
                    .copyWith(color: AppColor.monoWhite),
              ),
              // SizedBox(height: 5.h),
              SizedBox(height: 40.h),
              AppTextFormField(
                borderColor: AppColor.monoAlt,
                hintText: "aut_enterEmail".tr,
                controller: controller.loginEmailController,
                // showBorder: ,
                prefixIcon: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                  child: Icon(
                    Icons.email_outlined,
                    color: AppColor.mono.withOpacity(0.6),
                  ),
                ),
                focusedBorder: InputBorder.none,
              ),
              SizedBox(height: 10.h),
              Obx(
                () => AppTextFormField(
                  borderColor: AppColor.monoAlt,
                  hintText: "aut_enterPass".tr,
                  controller: controller.loginPasswordController,
                  prefixIcon: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                    child: Icon(
                      Icons.lock_outline_rounded,
                      color: AppColor.mono.withOpacity(0.6),
                    ),
                  ),
                  isObscure: controller.isPassVisible.value,
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
                ),
              ),
              SizedBox(height: 60.h),
              Center(
                child: Obx(
                  () => AppElevatedButton(
                    height: 45.h,
                    width: double.maxFinite,
                    title: "aut_loginText".tr,
                    color: AppColor.secondaryAlt,
                    isValid: true,
                    //  (controller.loginEmailController.text.isNotEmpty &&
                    //     controller.loginPasswordController.text.isNotEmpty),
                    isLoading: controller.isLoading.value,
                    radius: 15.r,
                    isUpperCase: true,
                    style: subheading4,
                    onPressed: () {
                      log("Signin btn clicked");
                      if (controller.loginEmailController.text.isEmpty &&
                          controller.loginPasswordController.text.isEmpty) {
                        null;
                      } else {
                        controller.signin();
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
                      text: "aut_noAcc".tr,
                      style: Get.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: AppColor.monoWhite,
                      ),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Nav.pushNamed(Routes.signupview),
                          text: "aut_signup".tr,
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
