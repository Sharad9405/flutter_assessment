import 'package:data/db/exception/local_db_exception.dart';
import 'package:data/db/floor/app_database.dart';
import 'package:data/db/floor/floor_db_service.dart';
import 'package:data/entity/local/user_db_entity.dart';
import 'package:data/source/user/user_data_sources.dart';

class UserLocalDSImpl extends UserLocalDS {
  final FloorDbService floorDbService;

  UserLocalDSImpl(this.floorDbService);

  @override
  Future<Stream<UserDBEntity?>> listenCurrentUser() async {
    return (await _getAppDatabase()).userDao.listenCurrentUser();
  }

  Future<AppDatabase> _getAppDatabase() {
    return floorDbService.db;
  }

  @override
  Future<UserDBEntity> getCurrentUser() async {
    UserDBEntity? userDBEntity = await (await _getAppDatabase()).userDao.getCurrentUser();
    print('User local ds impl: getCurrrentUser => userDBEntity==> ${userDBEntity?.userName}');
    if (userDBEntity == null) {
      throw LocalDbException(
        localDbExceptionType: LocalDbExceptionType.noUserFound,
      );
    }
    return userDBEntity;
  }

  @override
  Future<bool> saveCurrentUser(UserDBEntity userDBEntity) async {
    return (await (await _getAppDatabase()).userDao.insertUser(userDBEntity));
  }

  @override
  Future<bool> updateCurrentUser(UserDBEntity userDBEntity) async {
    return (await (await _getAppDatabase())
        .userDao
        .updateCurrentUser(userDBEntity));
  }

  @override
  Future<bool> removeUser() async {
    return (await (await _getAppDatabase()).userDao.deleteUser());
  }

  @override
  Future<bool> updateLanguage({required locale}) {
    // TODO: implement updateLanguage
    throw UnimplementedError();
  }


}
