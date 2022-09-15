import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:synergy/feature/schedule/schedule_page_viewmodel.dart';

final scheduleViewModelProvider = ChangeNotifierProvider.autoDispose<SchedulePageViewModel>(
  (ref) => SchedulePageViewModel(),
);
