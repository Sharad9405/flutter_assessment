import 'package:data/db/floor/constants/database_tables.dart';
import 'package:data/entity/local/user_db_entity.dart';
import 'package:floor/floor.dart';

import 'base/base_dao.dart';

@dao
abstract class UserDao extends BaseDao<UserDBEntity> {
  @Query("SELECT * FROM ${Table.USER}")
  Stream<List<UserDBEntity>> getUsers();

  @Query("SELECT * FROM ${Table.USER} WHERE isCurrent = 1")
  Future<UserDBEntity?> getCurrentUser();

  @Query("SELECT * FROM ${Table.USER} WHERE isCurrent = 1")
  Stream<UserDBEntity?> listenCurrentUser();

  @update
  Future<int> updateUser(UserDBEntity user);

  @override
  @delete
  Future<int> deleteItem(UserDBEntity entity);

  @transaction
  Future<bool> updateCurrentUser(UserDBEntity user) async {
    UserDBEntity? userEntity = await getCurrentUser();
    // user.accessToken = userEntity?.accessToken;
    userEntity?.profileUrl = user.profileUrl;
    user.isLoggedIn = userEntity?.isLoggedIn ?? false;
    if (userEntity != null) {
      userEntity.isCurrent = false;
      user.isCurrent = true;
      await updateUser(userEntity);
      int index = await updateUser(user);
      return index > 0;
    }
    return false;
  }

  @transaction
  Future<bool> insertUser(UserDBEntity user) async {
    try {
      UserDBEntity? userEntity = await getCurrentUser();
      if (userEntity != null) {
        userEntity.isCurrent = false;
        user.isCurrent = true;
        await updateUser(userEntity);
        int index = await insertData(user);
        return index > 0;
      } else {
        int index = await insertData(user);
        return index > 0;
      }
    } catch (exception) {
      print(exception);
      return false;
    }
  }

  @transaction
  Future<bool> deleteUser() async {
    try {
      UserDBEntity? userEntity = await getCurrentUser();
      int id = userEntity == null ? 0 : await deleteItem(userEntity);
      return Future.value(id > 0);
    } catch (exception) {
      print(exception);
      return false;
    }
  }
}
