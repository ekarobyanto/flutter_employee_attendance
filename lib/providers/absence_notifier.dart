import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:user_attendance/models/absence.dart';
import 'package:user_attendance/repository/absence_repository.dart';

part 'absence_notifier.g.dart';

@riverpod
class AbsenceNotifier extends _$AbsenceNotifier {
  @override
  AsyncValue<bool> build() => const AsyncValue.data(false);

  submitAbsence(Absence absencePoint) async {
    state = const AsyncLoading();
    try {
      print(absencePoint.toString());
      await ref.read(absenceRepositoryProvider).addAbsence(absencePoint);
      state = const AsyncData(true);
    } catch (err) {
      print(err.toString());
      debugPrintStack(stackTrace: StackTrace.current);
      state = AsyncError("fail to add absence", StackTrace.current);
    }
  }
}
