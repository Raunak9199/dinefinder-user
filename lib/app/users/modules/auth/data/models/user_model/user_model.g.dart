// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      otherId: json['otherId'] as String?,
      location: json['location'] as String?,
      profUrl: json['profUrl'] as String?,
      image: const FileConverter().fromJson(json['image'] as String?),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'mobileNumber': instance.mobileNumber,
      'email': instance.email,
      'password': instance.password,
      'otherId': instance.otherId,
      'location': instance.location,
      'profUrl': instance.profUrl,
      'image': const FileConverter().toJson(instance.image),
    };
