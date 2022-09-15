import 'package:data/network/api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/model/user/user.dart';
import 'package:domain/repository/user/user_repository.dart';


class ApiInterceptor extends InterceptorsWrapper {
  final UserRepository? _userRepository;
  final Dio? _previousDio;
  ApiService? apiService;

  ApiInterceptor(this._userRepository, this._previousDio) {
    Dio newDio = Dio(_previousDio?.options);
    newDio.interceptors.add(_previousDio!.interceptors.first);
    apiService = ApiService(newDio,);
  }


  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    var userEither = await _userRepository?.getCurrentUser();
    User? user = userEither?.fold((l) => null, (r) {
      return r;
    });
    options.connectTimeout = 60 * 1000;
    options.receiveTimeout = 60 * 1000;

    options.headers.putIfAbsent("Authorization", () => "Bearer ${user?.accessToken}");
   return super.onRequest(options, handler);
  }

@override
  void onError(DioError err, ErrorInterceptorHandler handler) {
  print("onError");
    super.onError(err, handler);
  }


}
