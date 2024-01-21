import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dinefinder_user/app/users/modules/auth/domain/repositories/auth_repository_interface.dart';
import 'package:dinefinder_user/app/users/modules/auth/presentation/controllers/auth_controller.dart';
import 'package:get/get.dart';

class DineuserController extends GetxController {
  final AuthRepositoryInterface _repository;

  DineuserController(this._repository);

  var sellerRestaurantStreamRx = Rx<QuerySnapshot?>(null);

  final authController = Get.find<AuthController>();

  // final menus = Rx<QuerySnapshot?>(null);

  // void fetchMenus(String sellerUid) {
  //   menus.bindStream(_repository.getMenusBySeller(sellerUid));
  // }

  @override
  void onInit() {
    sellerRestaurantStreamRx.bindStream(_repository.sellerRestaurantStream);
    super.onInit();
  }
}
