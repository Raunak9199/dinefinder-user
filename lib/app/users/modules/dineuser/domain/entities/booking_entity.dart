import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dinefinder_user/app/users/modules/auth/data/models/user_model/user_model.dart';
import 'package:dinefinder_user/app/users/modules/dineuser/data/models/booking_model/booking_model.dart';

class BookingEntity {
  final String? bookingId;
  final String? numberOfTable;
  final String? numberOfSeat;
  final String? time;
  final String? date;
  final String? sellerUid;
  final String? sellername;
  final String? sellerLoc;
  final UserModel? user;
  final Timestamp timestamp;

  BookingEntity({
    this.bookingId,
    this.numberOfTable,
    this.numberOfSeat,
    this.time,
    this.date,
    this.sellerUid,
    this.sellername,
    this.sellerLoc,
    this.user,
    required this.timestamp,
  });

  factory BookingEntity.fromModel(BookingModel model) {
    return BookingEntity(
      bookingId: model.bookingId,
      numberOfTable: model.numberOfTable,
      numberOfSeat: model.numberOfSeat,
      time: model.time,
      date: model.date,
      sellerUid: model.sellerUid,
      sellername: model.sellername,
      sellerLoc: model.sellerLoc,
      user:
          model.user != null ? UserModel.fromJson(model.user!.toJson()) : null,
      timestamp: model.timestamp!,
    );
  }

  BookingModel toModel() {
    return BookingModel(
      bookingId: bookingId,
      numberOfTable: numberOfTable,
      numberOfSeat: numberOfSeat,
      time: time,
      sellerUid: sellerUid,
      sellername: sellername,
      sellerLoc: sellerLoc,
      date: date,
      user: user,
      timestamp: timestamp,
    );
  }
}
