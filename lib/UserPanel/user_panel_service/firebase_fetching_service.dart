import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CarService {
  final _firestore = FirebaseFirestore.instance;
  Stream <List<Map<String, dynamic>>> getAvailableCars()  {
    return  _firestore.collection("ownerInformation").snapshots().map((
      snapshot,
    ) {
      return snapshot.docs.map((doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();
    });
  }
}
