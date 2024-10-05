import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:user_attendance/models/pinpoint.dart';
import 'package:user_attendance/repository/pinpoint_repository.dart';

part 'point_provider.g.dart';

@riverpod
Future<List<PinPoint>> points(PointsRef ref) =>
    ref.read(pinPointRepositoryProvider).getPinPoints();
