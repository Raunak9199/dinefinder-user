import 'dart:io';

import 'package:dinefinder_user/app/users/modules/auth/data/models/user_model/user_model.dart';

class UserEntity {
  final String? uid;
  final String? name;
  final String? mobileNumber;
  final String? email;
  final String? password;
  final String? otherId;
  final String? location;
  String? profUrl;
  final File? image;

  UserEntity({
    this.uid,
    this.name,
    this.mobileNumber,
    this.email,
    this.password,
    this.otherId,
    this.location,
    this.profUrl,
    this.image,
  });

  UserModel toModel() {
    return UserModel(
      uid: uid,
      name: name,
      mobileNumber: mobileNumber,
      email: email,
      password: password,
      otherId: otherId,
      location: location,
      profUrl: profUrl,
      image: image,
    );
  }

  static UserEntity fromModel(UserModel model) {
    return UserEntity(
      uid: model.uid,
      name: model.name,
      mobileNumber: model.mobileNumber,
      email: model.email,
      password: model.password,
      otherId: model.otherId,
      location: model.location,
      profUrl: model.profUrl,
      image: model.image,
    );
  }

  UserEntity copyWith({
    String? uid,
    String? name,
    String? mobileNumber,
    String? email,
    String? password,
    String? otherId,
    String? location,
    String? profUrl,
    File? image,
    String? seatNumber,
    String? tableNumber,
  }) {
    return UserEntity(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      email: email ?? this.email,
      password: password ?? this.password,
      otherId: otherId ?? this.otherId,
      location: location ?? this.location,
      profUrl: profUrl ?? this.profUrl,
      image: image ?? this.image,
    );
  }
}

// Saving user data
/* UserEntity userEntity = UserEntity(/*... some data ...*/);
UserModel userModel = userEntity.toModel();
saveToStorage(userModel); 

// Retrieving user data
UserModel retrievedModel = getFromStorage(); 
UserEntity retrievedEntity = UserEntity.fromModel(retrievedModel);
 */
