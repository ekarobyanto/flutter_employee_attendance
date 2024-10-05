import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:user_attendance/models/pinpoint.dart';
import 'package:user_attendance/repository/pinpoint_repository.dart';

part 'add_point_notifier.g.dart';

@riverpod
class AddPointNotifier extends _$AddPointNotifier {
  @override
  AsyncValue<bool> build() => const AsyncValue.data(false);

  submitPoint(PinPoint point) async {
    state = const AsyncLoading();
    try {
      await ref.read(pinPointRepositoryProvider).addPinPoint(point);
      state = const AsyncData(true);
    } catch (err) {
      debugPrintStack(stackTrace: StackTrace.current);
      state = AsyncError("fail to add pinpoints", StackTrace.current);
    }
  }
}
