import 'package:data/network/api_service.dart';
import 'package:data/source/user/user_data_sources.dart';
import 'package:retrofit/retrofit.dart';


class UserRemoteDSImpl extends UserRemoteDS {
  final ApiService _apiService;

  UserRemoteDSImpl(this._apiService);

  @override
  Future<HttpResponse> getUserDetails() {
    // TODO: implement getUserDetails
    throw UnimplementedError();
  }






}
