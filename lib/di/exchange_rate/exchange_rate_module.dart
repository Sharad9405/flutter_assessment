import 'package:synergy/feature/exchange_rate/exchange_rate_page_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final exchangeRateViewModelProvider = ChangeNotifierProvider.autoDispose<ExchangeRatePageViewModel>(
  (ref) => ExchangeRatePageViewModel(),
);
