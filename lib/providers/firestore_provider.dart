import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firestore_provider.g.dart';

@Riverpod(keepAlive: true)
FirebaseFirestore firestoreInstance(FirestoreInstanceRef ref) {
  return FirebaseFirestore.instance;
}
