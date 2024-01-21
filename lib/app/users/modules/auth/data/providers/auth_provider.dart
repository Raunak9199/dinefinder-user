import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dinefinder_user/app/core/core.dart';

class AuthProvider {
  // final AuthService _service;
  // AuthProvider(this._service);
  final CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection(AppConstants.sellersPostCollection);
  final CollectionReference _sellercollectionRef =
      FirebaseFirestore.instance.collection(AppConstants.sellersCollection);

  Stream<QuerySnapshot> get sellerRestaurantStream =>
      _sellercollectionRef.snapshots();
  // Stream<QuerySnapshot> get menuStream => _collectionRef
  //     .where("userUid", isEqualTo: _sellercollectionRef.id)
  //     .snapshots();

  Stream<QuerySnapshot> fetchMenusBySeller(String sellerUid) {
    return _collectionRef.where("userUid", isEqualTo: sellerUid).snapshots();
  }
}
