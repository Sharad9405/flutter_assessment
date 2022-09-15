import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:synergy/feature/verify_opt/verify_otp_page_viewmodel.dart';

final verifyOtpViewModelProvider = ChangeNotifierProvider.autoDispose<VerifyOtpPageViewModel>(
  (ref) => VerifyOtpPageViewModel(),
);
