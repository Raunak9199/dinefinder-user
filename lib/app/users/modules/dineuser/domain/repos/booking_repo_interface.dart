import 'package:dinefinder_user/app/users/modules/dineuser/data/models/booking_model/booking_model.dart';
import 'package:dinefinder_user/app/users/modules/dineuser/domain/entities/booking_entity.dart';

abstract class BookingRepositoryInterface {
  Future<BookingModel> confirmBooking(BookingModel booking);
  Stream<List<BookingEntity>> getCurrentUserBookingData();
  Future<void> deleteBooking(String bookingId, String sellerId);
}
