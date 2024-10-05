import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:user_attendance/config/repository_config.dart';
import 'package:user_attendance/models/absence.dart';

import 'package:user_attendance/providers/firestore_provider.dart';

part 'absence_repository.g.dart';

class AbsenceRepository extends Repository {
  AbsenceRepository({required super.firestoreInstance});

  addAbsence(Absence absence) async {
    await this.firestoreInstance!.collection('absences').add(absence.toJson());
  }

  Future<List<Absence>> getAbsence() =>
      this.firestoreInstance!.collection('absences').get().then((data) =>
          data.docs.map((doc) => Absence.fromJson(doc.data())).toList());
}

@riverpod
AbsenceRepository absenceRepository(AbsenceRepositoryRef ref) =>
    AbsenceRepository(firestoreInstance: ref.read(firestoreInstanceProvider));
