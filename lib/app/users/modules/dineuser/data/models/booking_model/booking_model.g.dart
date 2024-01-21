// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

/* BookingModel _$BookingModelFromJson(Map<String, dynamic> json) => BookingModel(
      bookingId: json['bookingId'] as String?,
      numberOfTable: json['numberOfTable'] as String?,
      numberOfSeat: json['numberOfSeat'] as String?,
      time: json['time'] as String?,
      sellerUid: json['sellerUid'] as String?,
      sellername: json['sellername'] as String?,
      sellerLoc: json['sellerLoc'] as String?,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      date: json['date'] as String?,
      timestamp: const TimestampConverter().fromJson(json['timestamp'] as int?),
    ); */

Map<String, dynamic> _$BookingModelToJson(BookingModel instance) =>
    <String, dynamic>{
      'bookingId': instance.bookingId,
      'numberOfTable': instance.numberOfTable,
      'numberOfSeat': instance.numberOfSeat,
      'time': instance.time,
      'sellerUid': instance.sellerUid,
      'sellername': instance.sellername,
      'sellerLoc': instance.sellerLoc,
      'user': instance.user?.toJson(),
      'date': instance.date,
      'timestamp': const TimestampConverter().toJson(instance.timestamp),
    };

_$BookingModelImpl _$$BookingModelImplFromJson(Map<String, dynamic> json) =>
    _$BookingModelImpl(
      bookingId: json['bookingId'] as String?,
      numberOfTable: json['numberOfTable'] as String?,
      numberOfSeat: json['numberOfSeat'] as String?,
      time: json['time'] as String?,
      sellerUid: json['sellerUid'] as String?,
      sellername: json['sellername'] as String?,
      sellerLoc: json['sellerLoc'] as String?,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      date: json['date'] as String?,
      timestamp: const TimestampConverter().fromJson(json['timestamp'] as int?),
    );

Map<String, dynamic> _$$BookingModelImplToJson(_$BookingModelImpl instance) =>
    <String, dynamic>{
      'bookingId': instance.bookingId,
      'numberOfTable': instance.numberOfTable,
      'numberOfSeat': instance.numberOfSeat,
      'time': instance.time,
      'sellerUid': instance.sellerUid,
      'sellername': instance.sellername,
      'sellerLoc': instance.sellerLoc,
      'user': instance.user,
      'date': instance.date,
      'timestamp': const TimestampConverter().toJson(instance.timestamp),
    };
