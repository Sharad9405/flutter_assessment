import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:synergy/di/usecases/user.dart';
import 'package:synergy/feature/splash/splash_page_viewmodel.dart';

final splashViewModelProvider = ChangeNotifierProvider.autoDispose<SplashPageViewModel>(
  (ref) => SplashPageViewModel(ref.watch(getCurrentUserUseCaseProvider)),
);
