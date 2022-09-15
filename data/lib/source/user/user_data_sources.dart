import 'package:data/entity/local/user_db_entity.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/retrofit.dart';

abstract class UserRemoteDS {


  Future<HttpResponse<dynamic>> getUserDetails();




}

abstract class UserLocalDS {
  Future<Stream<UserDBEntity?>> listenCurrentUser();

  Future<UserDBEntity> getCurrentUser();

  Future<bool> saveCurrentUser(UserDBEntity userDBEntity);

  Future<bool> updateCurrentUser(UserDBEntity userDBEntity);

  Future<bool> removeUser();

}
