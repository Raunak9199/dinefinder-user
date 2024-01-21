import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dinefinder_user/app/users/modules/auth/data/models/user_model/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_model.freezed.dart';
part 'booking_model.g.dart';

@freezed
@JsonSerializable(explicitToJson: true)
class BookingModel with _$BookingModel {
  factory BookingModel({
    String? bookingId,
    String? numberOfTable,
    String? numberOfSeat,
    String? time,
    String? sellerUid,
    String? sellername,
    String? sellerLoc,
    UserModel? user,
    String? date,
    @TimestampConverter() required Timestamp? timestamp,
  }) = _BookingModel;

  factory BookingModel.fromJson(Map<String, dynamic> json) =>
      _$BookingModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BookingModelToJson(this);
}

class TimestampConverter implements JsonConverter<Timestamp?, int?> {
  const TimestampConverter();

  @override
  Timestamp? fromJson(int? timestamp) {
    return timestamp != null
        ? Timestamp.fromMillisecondsSinceEpoch(timestamp)
        : null;
  }

  @override
  int? toJson(Timestamp? timestamp) {
    return timestamp?.millisecondsSinceEpoch;
  }
}
