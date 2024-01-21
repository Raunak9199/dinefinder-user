import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dinefinder_user/app/users/modules/auth/domain/entities/user_entity.dart';

abstract class AuthRepositoryInterface {
  // final AuthProvider _dataProvider = AuthProvider();
  Future<void> signInUser(UserEntity user);
  Future<UserEntity> rgisterUser(UserEntity user);
  Future<bool> isSignedIn();
  Future<void> logout();

  Stream<List<UserEntity>> getTotoalUsers(UserEntity user);
  Stream<List<UserEntity>> getCurrentUserData(String uid);
  Future<String> getCurrentUserUid();
  Future<String> storeProfile(File? file, String name);
  Future<String> storePost(File? file, String name, String randId);
  // Future<void> implementLoggedInUserData(UserEntity user);
  // Future<void> updateUserProfImg(UserEntity user);
  Future<UserEntity> updateUserProfile(UserEntity userEntity);
  Stream<List<UserEntity>> getOtherUser(String otherUid);

  // Stream<QuerySnapshot> get sellerRestaurantStream => _dataProvider.sellerRestaurantStream;
  Stream<QuerySnapshot> get sellerRestaurantStream;

  Future<void> bookTableAndSeat(String menuId, int tableNumber, int seatNumber);
  Stream<QuerySnapshot> getMenusBySeller(String sellerUid);
}
