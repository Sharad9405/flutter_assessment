import 'package:synergy/feature/home/home_page_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeViewModelProvider = ChangeNotifierProvider.autoDispose<HomePageViewModel>(
  (ref) => HomePageViewModel(),
);
