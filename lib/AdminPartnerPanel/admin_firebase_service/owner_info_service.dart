import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class OwnerInfoService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> SaveOwnerInfo({
    required String name,
    required String email,
    required String phone,
    required String ownerId,
    required String carRegistrationNumber,
    required String aboutCar,
  }) async {
    try {
      await _firestore.collection("owner Information").add({
        "name": name,
        "email": email,
        "phone": phone,
        "ownerId": ownerId,
        "carRegistrationNumber": carRegistrationNumber,
        "aboutCar": aboutCar,
      });
      return true;
    } catch (e) {
      
      throw Exception("Error here is : $e");
      
    }
  }
}

