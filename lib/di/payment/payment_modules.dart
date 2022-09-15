import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:synergy/feature/payment/payment_page_viewmodel.dart';

final paymentViewModelProvider = ChangeNotifierProvider.autoDispose<PaymentPageViewModel>(
  (ref) => PaymentPageViewModel(),
);
