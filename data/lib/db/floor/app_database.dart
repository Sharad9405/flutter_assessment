import 'dart:async';

import 'package:data/db/floor/database_properties.dart';
import 'package:data/entity/local/user_db_entity.dart';
import 'package:floor/floor.dart';
import 'dao/user_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: DatabaseProperties.DB_VERSION, entities: [UserDBEntity])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
}


