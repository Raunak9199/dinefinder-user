import 'dart:io';

import 'package:dinefinder_user/app/users/modules/auth/presentation/local-widget/file_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    String? uid,
    String? name,
    String? mobileNumber,
    String? email,
    String? password,
    String? otherId,
    String? location,
    String? profUrl,
    @FileConverter() File? image,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
