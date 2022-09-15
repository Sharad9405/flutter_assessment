import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:synergy/main/app_viewmodel.dart';

ChangeNotifierProvider<AppViewModel> appViewModel = ChangeNotifierProvider<AppViewModel>(
  (ref) => AppViewModel(),
);
