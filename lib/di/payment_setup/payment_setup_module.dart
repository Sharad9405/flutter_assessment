import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:synergy/feature/payment_setup/payment_setup_success_page_viewmodel.dart';

final paymentSetupSuccessViewModelProvider = ChangeNotifierProvider.autoDispose<PaymentSetupSuccessPageViewModel>(
  (ref) => PaymentSetupSuccessPageViewModel(),
);
