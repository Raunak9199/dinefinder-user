import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dinefinder_user/app/core/core.dart';
import 'package:dinefinder_user/app/global-widgets/app_snackbar.dart';
import 'package:dinefinder_user/app/users/modules/auth/data/models/user_model/user_model.dart';
import 'package:dinefinder_user/app/users/modules/auth/data/providers/auth_provider.dart';
import 'package:dinefinder_user/app/users/modules/auth/domain/entities/user_entity.dart';
import 'package:dinefinder_user/app/users/modules/auth/domain/repositories/auth_repository_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class AuthRepositoryImpl implements AuthRepositoryInterface {
  final AuthProvider provider;
  AuthRepositoryImpl(
    this.provider, {
    required this.firestore,
    required this.firebaseAuth,
    required this.storage,
  });
  final FirebaseFirestore firestore;
  final FirebaseAuth firebaseAuth;
  final FirebaseStorage storage;

  @override
  Stream<QuerySnapshot> get sellerRestaurantStream =>
      provider.sellerRestaurantStream;

  @override
  Future<void> bookTableAndSeat(
      String menuPostId, int tableNumber, int seatNumber) async {
    try {
      await firestore.collection('bookings').add({
        'menuId': menuPostId,
        'tableNumber': tableNumber,
        'seatNumber': seatNumber,
      });
    } catch (e) {
      log(e.toString());
      AppSnackBar.showSnackbar(msg: "$e");
      return;
    }
  }

  Future<void> uploadData(UserEntity user) async {
    try {
      final snap = firestore.collection(AppConstants.usersCollection);

      final uid = await getCurrentUserUid();

      await snap.doc(uid).get().then((newuser) {
        final newUser = UserModel(
          uid: uid,
          name: user.name,
          email: user.email,
          location: user.location,
          mobileNumber: user.mobileNumber,
          profUrl: user.profUrl,
        ).toJson();
        if (newuser.exists) {
          snap.doc(uid).update(newUser);
        } else {
          snap.doc(uid).set(newUser, SetOptions(merge: true));
        }
      }).catchError((error) {
        AppSnackBar.showSnackbar(msg: "$error");
        log("$error");
      });
    } on FirebaseException catch (err) {
      log("$err");
    }
  }

  @override
  Stream<List<UserEntity>> getTotoalUsers(UserEntity user) {
    final userSnapshot = firestore.collection(AppConstants.usersCollection);

    return userSnapshot.snapshots().map((querySnap) => querySnap.docs
        .map((e) => UserEntity.fromModel(UserModel.fromJson(e.data())))
        .toList());
  }

  /* @override
  Future<void> implementLoggedInUserData(UserEntity user) async {
    final collection = firestore.collection("sellers");

    final uid = await getCurrentUserUid();
    collection.doc(uid).get().then((value) {
      final newUserData = UserModel(
        email: user.email,
        uid: uid,
        name: user.name,
        mobileNumber: user.mobileNumber,
        location: user.location,
      ).toJson();

      if (!value.exists) {
        collection.doc(uid).set(newUserData);
      } else {
        collection.doc(uid).update(newUserData);
      }
    }).catchError(
      (err) {
        AppSnackBar.showSnackbar(msg: "$err");
        log("$err");
      },
    );
  } */

  @override
  Future<String> getCurrentUserUid() async => firebaseAuth.currentUser!.uid;

  @override
  Stream<List<UserEntity>> getCurrentUserData(String uid) {
    final userSnapshot = firestore
        .collection(AppConstants.usersCollection)
        .where("uid", isEqualTo: uid)
        .limit(1);

    return userSnapshot.snapshots().map(
          (querySnap) => querySnap.docs
              .map((e) => UserEntity.fromModel(UserModel.fromJson(e.data())))
              .toList(),
        );
  }

  @override
  Future<bool> isSignedIn() async => firebaseAuth.currentUser?.uid != null;

  @override
  Future<void> signInUser(UserEntity user) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == "wrong-password") {
        AppSnackBar.showSnackbar(
          msg: "Please enter a correct email or password",
        );
        return;
      } else if (e.code == "user-not-found") {
        AppSnackBar.showSnackbar(
          msg: "User not found.",
        );
        return;
      } else if (user.email!.isEmpty || user.password!.isEmpty) {
        AppSnackBar.showSnackbar(
          msg: "Please fill all the credentials.",
        );
        return;
      } else {
        AppSnackBar.showSnackbar(
          msg: e.toString(),
        );
        return;
      }
      // return;
    }
  }

  @override
  Future<void> logout() async => await firebaseAuth.signOut();

  @override
  Future<UserEntity> rgisterUser(UserEntity user) async {
    var imageUrl = "".obs;
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );

      if (userCredential.user != null) {
        if (user.image != null) {
          imageUrl.value =
              await storeProfile(user.image, AppConstants.usersProfileImage);
          // log("profile url=${imageUrl.value}");
          await uploadData(
            user.copyWith(profUrl: imageUrl.value),
            // imageUrl.value
          );
          // }
          // uploadData(user.copyWith(profileUrl: profileUrl));
          // });
        } else {
          await uploadData(user);
        }
        return UserEntity(
          uid: userCredential.user!.uid,
          email: user.email,
          password: user.password,
          name: user.name,
          profUrl: imageUrl.value,
          mobileNumber: user.mobileNumber,
          location: user.location,
        );
      }

      throw Exception("Registration failed!");
    } on FirebaseAuthException catch (e) {
      // Error handling like -
      if (e.code == "email-already-in-use") {
        AppSnackBar.showSnackbar(msg: "This email is already in use.");
        rethrow;
      } else {
        AppSnackBar.showSnackbar(msg: "$e.");
        rethrow;
      }
    }
  }

  @override
  Stream<List<UserEntity>> getOtherUser(String otherId) {
    final userSnapshot = firestore
        .collection(AppConstants.usersCollection)
        .where(
          "uid",
          isEqualTo: otherId,
        )
        .limit(1);
    return userSnapshot.snapshots().map(
          (querySnap) => querySnap.docs
              .map((e) => UserEntity.fromModel(UserModel.fromJson(e.data())))
              .toList(),
        );
  }

  @override
  Future<String> storeProfile(File? imageFile, String fileName) async {
    try {
      final currentUser = firebaseAuth.currentUser!.uid;
      Reference imageReference =
          storage.ref().child(fileName).child(currentUser);
      final imageUpload = imageReference.putFile(imageFile!);
      final imageUrl =
          await (await imageUpload.whenComplete(() {})).ref.getDownloadURL();
      log(imageUrl);
      return imageUrl;
    } catch (e) {
      log("Error uploading image: $e");
      rethrow;
    }
  }

  @override
  Future<String> storePost(
    File? imageFile,
    String fileName,
    String randomId,
  ) async {
    try {
      final currentUser = firebaseAuth.currentUser!.uid;
      Reference imageReference =
          storage.ref().child(fileName).child(currentUser);

      imageReference = imageReference.child(randomId);

      final imageUpload = imageReference.putFile(imageFile!);
      final imageUrl =
          await (await imageUpload.whenComplete(() {})).ref.getDownloadURL();
      log(imageUrl);
      return imageUrl;
    } catch (e) {
      log("Error uploading image: $e");
      rethrow;
    }
  }

  Future<void> deleteImage(String imageUrl) async {
    Reference reference = FirebaseStorage.instance.refFromURL(imageUrl);
    await reference.delete();
  }

  @override
  Stream<QuerySnapshot> getMenusBySeller(String sellerUid) {
    return provider.fetchMenusBySeller(sellerUid);
  }

  @override
  Future<UserEntity> updateUserProfile(UserEntity userEntity) async {
    String imageUrl = "";
    final postSnapshot = firestore.collection(AppConstants.usersCollection);
    final currentUser = await getCurrentUserUid();
    String? oldImageUrl;

    // Fetch the current data
    final postDocSnapshot = await postSnapshot.doc(userEntity.uid).get();
    if (postDocSnapshot.exists) {
      oldImageUrl = postDocSnapshot.data()?["posturl"] as String?;
    }

    if (userEntity.image != null) {
      log("Old image=> ${userEntity.profUrl}");
      imageUrl =
          await storeProfile(userEntity.image, AppConstants.usersCollection);
      log("New updated image=> $imageUrl");
    } else {
      imageUrl = userEntity.profUrl ?? "";
    }
    final updatedPost = UserModel(
      name: userEntity.name,
      image: userEntity.image,
      uid: userEntity.uid,
      email: userEntity.email,
      location: userEntity.location,
      mobileNumber: userEntity.mobileNumber,
      profUrl: imageUrl,
    ).toJson();

    try {
      if (!postDocSnapshot.exists) {
        await postSnapshot.doc(userEntity.uid).set(updatedPost);
      } else {
        await postSnapshot.doc(userEntity.uid).update(updatedPost);
      }

      if (oldImageUrl != null) {
        await deleteImage(oldImageUrl);
        log("Old image deleted");
      }

      return UserEntity(
        name: userEntity.name,
        image: userEntity.image,
        uid: currentUser,
        email: userEntity.email,
        location: userEntity.location,
        mobileNumber: userEntity.mobileNumber,
        profUrl: imageUrl,
      );
    } on FirebaseAuthException catch (e) {
      AppSnackBar.showSnackbar(msg: "$e");
      log("some error occurred $e");
      rethrow;
    }
  }
}

/*  @override
      Stream<List<UserEntity>> getCurrentUserData(String uid) {
        final userSnapshot = firestore
            .collection(AppConstants.sellersCollection)
            .where("uid", isEqualTo: uid)
            .limit(1);

        return userSnapshot.snapshots().map(
              (querySnap) => querySnap.docs
                  .map(
                      (e) => UserEntity.fromModel(UserModel.fromJson(e.data())))
                  .toList(),
            );
      } */
