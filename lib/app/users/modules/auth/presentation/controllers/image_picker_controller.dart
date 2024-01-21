import 'dart:developer';
import 'dart:io';

import 'package:dinefinder_user/app/global-widgets/app_snackbar.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerController extends GetxController {
  var imageFile = Rxn<File>();

  final ImagePicker _picker = ImagePicker();
  late final PermissionStatus status;

  checkStatus() async {
    status = await Permission.storage.status;

    if (!status.isGranted) {
      // status = await Permission.photos.request();
      status = await Permission.storage.request();
      // openAppSettings();
      // status = await Permission.storage.status;

      if (!status.isGranted) {
        AppSnackBar.showSnackbar(
            msg: "Grant permissions to continue",
            titleText: "Permission Denied!");
        status = await Permission.storage.request();
        if (!status.isGranted) {
          AppSnackBar.showSnackbar(
              msg: "Grant permissions to continue",
              titleText: "Permission Denied!");
        }
        openAppSettings();
        // Get.snackbar("Permission Denied!", "Grant permissions to continue",
        //     snackPosition: SnackPosition.BOTTOM);

        return;
      }
    }
  }

  Future chooseImage() async {
    log("chooseImage method called");
    // Check and request permissions
    checkStatus();

    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
      );

      if (pickedFile != null) {
        imageFile.value = File(pickedFile.path);
        log(imageFile.value!.path);
      } else {
        log("No file selected to upload");
      }
      update();
    } catch (e) {
      Get.snackbar("Error!", "$e", snackPosition: SnackPosition.BOTTOM);
    }
  }
}
