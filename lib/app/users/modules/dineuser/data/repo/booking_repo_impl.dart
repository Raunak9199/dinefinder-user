import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dinefinder_user/app/core/core.dart';
import 'package:dinefinder_user/app/global-widgets/app_snackbar.dart';
import 'package:dinefinder_user/app/users/modules/dineuser/data/models/booking_model/booking_model.dart';
import 'package:dinefinder_user/app/users/modules/dineuser/domain/entities/booking_entity.dart';
import 'package:dinefinder_user/app/users/modules/dineuser/domain/repos/booking_repo_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BookingRepoImpl implements BookingRepositoryInterface {
  final FirebaseFirestore firestore;
  final FirebaseAuth firebaseAuth;
  BookingRepoImpl(this.firestore, this.firebaseAuth);

  @override
  Future<BookingModel> confirmBooking(BookingModel booking) async {
    try {
      Map<String, dynamic> bookingData = booking.toJson();
      final snapshot = firestore
          .collection(AppConstants.usersCollection)
          .doc(firebaseAuth.currentUser!.uid)
          .collection(AppConstants.bookingsCollection);

      if (booking.bookingId != null) {
        bookingData['user'] = {
          'uid': booking.user!.uid,
          'name': booking.user!.name,
          'mobileNumber': booking.user!.mobileNumber,
          'profUrl': booking.user!.profUrl,
        };
      }

      final sellerSnap = firestore
          .collection(AppConstants.sellersCollection)
          .doc(booking.sellerUid) // Use the seller's UID here
          .collection(AppConstants.bookingsCollection)
          .doc(booking.bookingId);

      DocumentReference bookingRef;
      if (booking.bookingId != null) {
        bookingRef = snapshot.doc(booking.bookingId);
        await bookingRef.set(bookingData, SetOptions(merge: true));
        await sellerSnap.set(bookingData, SetOptions(merge: true));
      } else {
        bookingRef = await snapshot.add(bookingData);
      }

      DocumentSnapshot resultSnapshot = await bookingRef.get();
      BookingModel resultBooking =
          BookingModel.fromJson(resultSnapshot.data() as Map<String, dynamic>);

      return resultBooking;
    } catch (error) {
      AppSnackBar.showSnackbar(msg: "$error");
      throw Exception('Failed to confirm booking: $error');
    }
  }

  @override
  Stream<List<BookingEntity>> getCurrentUserBookingData() {
    final userSnapshot = firestore
        .collection(AppConstants.usersCollection)
        .doc(firebaseAuth.currentUser!.uid)
        .collection(AppConstants.bookingsCollection)
        .orderBy('timestamp', descending: true);

    return userSnapshot.snapshots().map(
          (querySnap) => querySnap.docs
              .map((e) =>
                  BookingEntity.fromModel(BookingModel.fromJson(e.data())))
              .toList(),
        );
  }

  @override
  Future<void> deleteBooking(String bookingId, String sellerId) async {
    await firestore
        .collection(AppConstants.usersCollection)
        .doc(firebaseAuth.currentUser!.uid)
        .collection(AppConstants.bookingsCollection)
        .doc(bookingId)
        .delete();
    await firestore
        .collection(AppConstants.sellersCollection)
        .doc(sellerId)
        .collection(AppConstants.bookingsCollection)
        .doc(bookingId)
        .delete();
  }

  /* Future<BookingEntity> confirmBooking(BookingEntity booking) async {
    try {
      final uid = firebaseAuth.currentUser!.uid;

      // Use the UID to get the correct path
      final snapshot = firestore.collection(AppConstants.bookingsCollection);
      // .doc(uid)
      // .collection(AppConstants.bookingsCollection);

      final doc = await snapshot.doc(uid).get();

      final bookingData = BookingModel(
        bookingId: booking.bookingId,
        date: booking.date,
        numberOfSeat: booking.numberOfSeat,
        numberOfTable: booking.numberOfTable,
        time: booking.time,
        user: booking.user,
      ).toJson();

      if (doc.exists) {
        await snapshot.doc(uid).update(bookingData);
      } else {
        await snapshot.doc(uid).set(bookingData, SetOptions(merge: true));
      }

      return BookingEntity(
        bookingId: booking.bookingId,
        date: booking.date,
        numberOfSeat: booking.numberOfSeat,
        numberOfTable: booking.numberOfTable,
        time: booking.time,
        user: booking.user,
      );
    } catch (err) {
      AppSnackBar.showSnackbar(msg: "Error while booking: $err");
      log("$err");

      return BookingEntity();
    }
  } */

  /*  @override
  Future<BookingEntity> confirmBooking(BookingEntity booking) async {
    try {
      final snapshot = firestore
          .collection(AppConstants.usersCollection)
          .doc()
          .collection(AppConstants.bookingsCollection);

      final uid = firebaseAuth.currentUser!.uid;

      final value = await snapshot.doc(uid).get();
      //  .then((value) {
      final bookingData = BookingModel(
        bookingId: booking.bookingId,
        date: booking.date,
        numberOfSeat: booking.numberOfSeat,
        numberOfTable: booking.numberOfTable,
        time: booking.time,
        user: booking.user,
      ).toJson();

      if (value.exists) {
        snapshot.doc(uid).update(bookingData);
      } else {
        snapshot.doc(uid).set(bookingData, SetOptions(merge: true));
      }

      return BookingEntity(
        bookingId: booking.bookingId,
        date: booking.date,
        numberOfSeat: booking.numberOfSeat,
        numberOfTable: booking.numberOfTable,
        time: booking.time,
        user: booking.user,
      );
      // }).catchError((err) {
      //   AppSnackBar.showSnackbar(msg: "Error while booking.");
      //   log(err);
      //   // rethrow;
      //   return BookingEntity();
      // });
    } on FirebaseException catch (err) {
      log("$err");
      rethrow;
    } finally {
      // return BookingEntity(
      //   bookingId: booking.bookingId,
      //   date: booking.date,
      //   numberOfSeat: booking.numberOfSeat,
      //   numberOfTable: booking.numberOfTable,
      //   time: booking.time,
      //   user: booking.user,
      // );
    }
  } */
}
