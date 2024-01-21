import 'package:dinefinder_user/app/core/core.dart';
import 'package:dinefinder_user/app/global-widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWIthSuffixDropDown extends StatelessWidget {
  const TextFieldWIthSuffixDropDown({
    Key? key,
    required this.controller,
    required this.prefixText,
    this.hint,
    this.items,
    this.selectedValue,
    this.onChanged,
  }) : super(key: key);

  // final ChallengesController controller;
  final TextEditingController controller;

  final String prefixText;
  final String? hint;
  final List<DropdownMenuItem<String>>? items;
  final String? selectedValue;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: controller,
      prefixIcon: Padding(
        padding: EdgeInsets.only(top: 4, right: 8.w),
        child: Text(
          prefixText,
          style: bodyText3,
        ),
      ),
      scrollPadding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      prefixIconPadding: EdgeInsets.only(left: 16.w),
      suffixIconPadding: EdgeInsets.only(bottom: 10.h),
      inputTextStyle: bodyText3.copyWith(color: AppColor.monoExtraLight),
      suffixIcon: DropdownButton(
        // icon: AppImage(ImagePaths.dropDownIcon),
        items: items,
        // value: selectedvalue,
        underline: const SizedBox(),
        style: bodyText3,

        isExpanded: true,
        onChanged: onChanged,
      ),
    );
  }
}
