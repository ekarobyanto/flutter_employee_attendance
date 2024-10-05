import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Repository {
  final FirebaseFirestore? firestoreInstance;
  final SharedPreferences? sharedPreferences;

  Repository({this.firestoreInstance, this.sharedPreferences});
}
