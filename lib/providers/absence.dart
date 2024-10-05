import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:user_attendance/models/absence.dart';

import 'package:user_attendance/repository/absence_repository.dart';

part 'absence.g.dart';

@riverpod
Future<List<Absence>> abcences(AbcencesRef ref) =>
    ref.read(absenceRepositoryProvider).getAbsence();
