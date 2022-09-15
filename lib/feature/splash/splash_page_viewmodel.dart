import 'dart:async';
import 'package:domain/model/user/user.dart';
import 'package:domain/usecase/user/get_current_usecase.dart';
import 'package:synergy/base/base_page_view_model.dart';
import 'package:rxdart/subjects.dart';
import 'package:synergy/utils/request_manager.dart';
import 'package:synergy/utils/resource.dart';

class SplashPageViewModel extends BasePageViewModel {
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final PublishSubject<GetCurrentUserUseCaseParams> _getCurrentUserRequestSubject = PublishSubject();
  final PublishSubject<Resource<User>> _currentUserResponse = PublishSubject();

  Stream<Resource<User>> get currentUser => _currentUserResponse.stream;


  SplashPageViewModel(this._getCurrentUserUseCase) {
    _getCurrentUserRequestSubject.listen((getCurrentUserUseCaseParams) {
      RequestManager(getCurrentUserUseCaseParams, createCall: () {
        return _getCurrentUserUseCase.execute(
            params: getCurrentUserUseCaseParams);
      }).asFlow().listen((event) async {
        await Future.delayed(const Duration(seconds: 2));
        _currentUserResponse.add(event);
      });
    });

    getCurrentUser();
  }
  /// Fetch current user for navigation from splash page
  Future<void> getCurrentUser() async {
    _getCurrentUserRequestSubject.add(
      GetCurrentUserUseCaseParams(),
    );
  }

    @override
  void dispose() {
    _getCurrentUserRequestSubject.close();
    super.dispose();
  }
}
