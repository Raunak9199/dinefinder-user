import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dinefinder_user/app/users/modules/auth/domain/repositories/auth_repository_interface.dart';
import 'package:dinefinder_user/app/users/modules/dineuser/controllers/dineuser_controller.dart';
import 'package:get/get.dart';

class DetailedMenuController extends GetxController {
  final QueryDocumentSnapshot<Object?>? menuitem;
  final AuthRepositoryInterface _repository;
  DetailedMenuController(this._repository)
      : menuitem = Get.arguments as QueryDocumentSnapshot<Object?>?;

  final menus = Rx<QuerySnapshot?>(null);

  final dineController = Get.find<DineuserController>();
  // final bookingController = Get.find<BookingController>();

  final hrs = 9.obs;
  final min = 0.obs;

  void fetchMenus(String sellerUid) {
    menus.bindStream(_repository.getMenusBySeller(sellerUid));
  }

  @override
  void onInit() {
    fetchMenus(menuitem!['uid']);
    super.onInit();
  }
}

 /* openBookingMenuSheet() {
    return showModalBottomSheet(
        context: Get.context!,
        showDragHandle: true,
        useSafeArea: true,
        builder: (_) {
          return Container(
            height: 340.h,
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Confirm Booking!",
                      style: Get.textTheme.bodyMedium!
                          .copyWith(color: AppColor.mono),
                    ),
                    const IconButton(
                      onPressed: Nav.pop,
                      icon: Icon(
                        Icons.close,
                        color: AppColor.mono,
                      ),
                    ),
                  ],
                ),
                Divider(height: 1.h, color: AppColor.monoLight),
                SizedBox(height: 10.h),
                NumberSelectorWidget(
                  item: menuitem!["tableNumber"],
                  title: "Select Number of tables",
                ),
                SizedBox(height: 10.h),
                NumberSelectorWidget(
                  item: menuitem!["seatNumber"],
                  title: "Select Number of seats",
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Select Time",
                      style: Get.textTheme.bodyMedium!
                          .copyWith(color: AppColor.mono, fontSize: 16.sp),
                    ),
                    // Hours picker
                    const AppTimePicker(),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Select Date",
                      style: Get.textTheme.bodyMedium!
                          .copyWith(color: AppColor.mono, fontSize: 16.sp),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Obx(
                            () => Text(
                              selectedDate.value,
                              style: Get.textTheme.bodySmall!.copyWith(
                                  color: AppColor.mono, fontSize: 15.sp),
                            ),
                          ),
                        ),
                        SizedBox(width: 5.w),
                        GestureDetector(
                          onTap: _selectDate,
                          child: const Icon(Icons.calendar_today,
                              color: AppColor.mono),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                // Obx(
                //   () =>
                AppElevatedButton(
                  title: "CONFIRM",
                  width: double.maxFinite,
                  height: 45.h,
                  isValid: true,
                  // isLoading: bookingController.isLoading.value,
                  // onPressed: bookingController.booking,
                  // ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          );
        });
  } */