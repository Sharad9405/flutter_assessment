import 'package:synergy/base/base_view_model.dart';
import 'package:domain/error/app_error.dart';
import 'package:rxdart/rxdart.dart';

class BasePageViewModel extends BaseViewModel {
  final PublishSubject<AppError> _error = PublishSubject<AppError>();
  final PublishSubject<String> _toast = PublishSubject<String>();

  Stream<AppError> get error => _error.stream;

  Stream<String> get toast => _toast.stream;

  void showToastWithError(AppError error) {
    _error.sink.add(error);
  }

  void showToastWithString(String message) {
    _toast.sink.add(message);
  }

  void notify() {
    notifyListeners();
  }

  @override
  void dispose() {
    _error.close();
    _toast.close();
    super.dispose();
  }
}
