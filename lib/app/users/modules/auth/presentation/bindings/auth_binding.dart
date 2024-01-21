import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dinefinder_user/app/users/modules/auth/data/providers/auth_provider.dart';
import 'package:dinefinder_user/app/users/modules/auth/data/repositories/auth_repository_impl.dart';
import 'package:dinefinder_user/app/users/modules/auth/data/services/auth_service.dart';
import 'package:dinefinder_user/app/users/modules/auth/domain/repositories/auth_repository_interface.dart';
import 'package:dinefinder_user/app/users/modules/auth/presentation/controllers/auth_controller.dart';
import 'package:dinefinder_user/app/users/modules/auth/presentation/controllers/image_picker_controller.dart';
import 'package:dinefinder_user/app/users/modules/auth/presentation/controllers/location_controller.dart';
import 'package:dinefinder_user/app/users/modules/auth/presentation/controllers/scrollcontroller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthService>(() => AuthService());
    Get.lazyPut<AuthProvider>(() => AuthProvider());
    // Get.lazyPut<AuthProvider>(() => AuthProvider(Get.find()));
    Get.lazyPut<FirebaseFirestore>(() => FirebaseFirestore.instance);
    Get.lazyPut<FirebaseAuth>(() => FirebaseAuth.instance);
    Get.lazyPut<FirebaseStorage>(() => FirebaseStorage.instance);
    Get.lazyPut<AuthRepositoryInterface>(
      () => AuthRepositoryImpl(
        Get.find(),
        firebaseAuth: Get.find(),
        firestore: Get.find(),
        storage: Get.find(),
      ),
    );
    Get.lazyPut<AuthController>(() => AuthController(Get.find()));
    Get.lazyPut<LocationController>(() => LocationController());
    Get.lazyPut<ImagePickerController>(() => ImagePickerController());
    Get.lazyPut<ScrollControllerNotification>(
        () => ScrollControllerNotification());
  }
}
