import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlng/latlng.dart';

class DataBaseService {
  DataBaseService({required this.uid});

  final String uid;

  // Collection reference
  final matchesCollection = FirebaseFirestore.instance;

  Future updateUserData (String date, String latitude, String longitude ) {
    return matchesCollection.collection('matches').doc(uid).set({
      'date': date,
      'latitude': latitude,
      'longitude': longitude,
    });
  }
}
