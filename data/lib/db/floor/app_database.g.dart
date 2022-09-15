// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UserDao? _userDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 2,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `user` (`userName` TEXT NOT NULL, `firstName` TEXT NOT NULL, `middleName` TEXT NOT NULL, `lastName` TEXT NOT NULL, `profileUrl` TEXT NOT NULL, `countryCode` TEXT NOT NULL, `loginType` TEXT NOT NULL, `accessToken` TEXT NOT NULL, `refreshToken` TEXT NOT NULL, `isCurrent` INTEGER NOT NULL, `isLoggedIn` INTEGER NOT NULL, PRIMARY KEY (`userName`))');
        await database.execute(
            'CREATE UNIQUE INDEX `index_user_userName` ON `user` (`userName`)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _userDBEntityInsertionAdapter = InsertionAdapter(
            database,
            'user',
            (UserDBEntity item) => <String, Object?>{
                  'userName': item.userName,
                  'firstName': item.firstName,
                  'middleName': item.middleName,
                  'lastName': item.lastName,
                  'profileUrl': item.profileUrl,
                  'countryCode': item.countryCode,
                  'loginType': item.loginType,
                  'accessToken': item.accessToken,
                  'refreshToken': item.refreshToken,
                  'isCurrent': item.isCurrent ? 1 : 0,
                  'isLoggedIn': item.isLoggedIn ? 1 : 0
                },
            changeListener),
        _userDBEntityUpdateAdapter = UpdateAdapter(
            database,
            'user',
            ['userName'],
            (UserDBEntity item) => <String, Object?>{
                  'userName': item.userName,
                  'firstName': item.firstName,
                  'middleName': item.middleName,
                  'lastName': item.lastName,
                  'profileUrl': item.profileUrl,
                  'countryCode': item.countryCode,
                  'loginType': item.loginType,
                  'accessToken': item.accessToken,
                  'refreshToken': item.refreshToken,
                  'isCurrent': item.isCurrent ? 1 : 0,
                  'isLoggedIn': item.isLoggedIn ? 1 : 0
                },
            changeListener),
        _userDBEntityDeletionAdapter = DeletionAdapter(
            database,
            'user',
            ['userName'],
            (UserDBEntity item) => <String, Object?>{
                  'userName': item.userName,
                  'firstName': item.firstName,
                  'middleName': item.middleName,
                  'lastName': item.lastName,
                  'profileUrl': item.profileUrl,
                  'countryCode': item.countryCode,
                  'loginType': item.loginType,
                  'accessToken': item.accessToken,
                  'refreshToken': item.refreshToken,
                  'isCurrent': item.isCurrent ? 1 : 0,
                  'isLoggedIn': item.isLoggedIn ? 1 : 0
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<UserDBEntity> _userDBEntityInsertionAdapter;

  final UpdateAdapter<UserDBEntity> _userDBEntityUpdateAdapter;

  final DeletionAdapter<UserDBEntity> _userDBEntityDeletionAdapter;

  @override
  Stream<List<UserDBEntity>> getUsers() {
    return _queryAdapter.queryListStream('SELECT * FROM user',
        mapper: (Map<String, Object?> row) => UserDBEntity(
            userName: row['userName'] as String,
            firstName: row['firstName'] as String,
            middleName: row['middleName'] as String,
            lastName: row['lastName'] as String,
            profileUrl: row['profileUrl'] as String,
            countryCode: row['countryCode'] as String,
            accessToken: row['accessToken'] as String,
            refreshToken: row['refreshToken'] as String,
            loginType: row['loginType'] as String,
            isCurrent: (row['isCurrent'] as int) != 0,
            isLoggedIn: (row['isLoggedIn'] as int) != 0),
        queryableName: 'user',
        isView: false);
  }

  @override
  Future<UserDBEntity?> getCurrentUser() async {
    return _queryAdapter.query('SELECT * FROM user WHERE isCurrent = 1',
        mapper: (Map<String, Object?> row) => UserDBEntity(
            userName: row['userName'] as String,
            firstName: row['firstName'] as String,
            middleName: row['middleName'] as String,
            lastName: row['lastName'] as String,
            profileUrl: row['profileUrl'] as String,
            countryCode: row['countryCode'] as String,
            accessToken: row['accessToken'] as String,
            refreshToken: row['refreshToken'] as String,
            loginType: row['loginType'] as String,
            isCurrent: (row['isCurrent'] as int) != 0,
            isLoggedIn: (row['isLoggedIn'] as int) != 0));
  }

  @override
  Stream<UserDBEntity?> listenCurrentUser() {
    return _queryAdapter.queryStream('SELECT * FROM user WHERE isCurrent = 1',
        mapper: (Map<String, Object?> row) => UserDBEntity(
            userName: row['userName'] as String,
            firstName: row['firstName'] as String,
            middleName: row['middleName'] as String,
            lastName: row['lastName'] as String,
            profileUrl: row['profileUrl'] as String,
            countryCode: row['countryCode'] as String,
            accessToken: row['accessToken'] as String,
            refreshToken: row['refreshToken'] as String,
            loginType: row['loginType'] as String,
            isCurrent: (row['isCurrent'] as int) != 0,
            isLoggedIn: (row['isLoggedIn'] as int) != 0),
        queryableName: 'user',
        isView: false);
  }

  @override
  Future<int> insertData(UserDBEntity data) {
    return _userDBEntityInsertionAdapter.insertAndReturnId(
        data, OnConflictStrategy.replace);
  }

  @override
  Future<List<int>> insertDataList(List<UserDBEntity> dataList) {
    return _userDBEntityInsertionAdapter.insertListAndReturnIds(
        dataList, OnConflictStrategy.replace);
  }

  @override
  Future<int> updateUser(UserDBEntity user) {
    return _userDBEntityUpdateAdapter.updateAndReturnChangedRows(
        user, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteItem(UserDBEntity entity) {
    return _userDBEntityDeletionAdapter.deleteAndReturnChangedRows(entity);
  }

  @override
  Future<bool> updateCurrentUser(UserDBEntity user) async {
    if (database is sqflite.Transaction) {
      return super.updateCurrentUser(user);
    } else {
      return (database as sqflite.Database)
          .transaction<bool>((transaction) async {
        final transactionDatabase = _$AppDatabase(changeListener)
          ..database = transaction;
        return transactionDatabase.userDao.updateCurrentUser(user);
      });
    }
  }

  @override
  Future<bool> insertUser(UserDBEntity user) async {
    if (database is sqflite.Transaction) {
      return super.insertUser(user);
    } else {
      return (database as sqflite.Database)
          .transaction<bool>((transaction) async {
        final transactionDatabase = _$AppDatabase(changeListener)
          ..database = transaction;
        return transactionDatabase.userDao.insertUser(user);
      });
    }
  }

  @override
  Future<bool> deleteUser() async {
    if (database is sqflite.Transaction) {
      return super.deleteUser();
    } else {
      return (database as sqflite.Database)
          .transaction<bool>((transaction) async {
        final transactionDatabase = _$AppDatabase(changeListener)
          ..database = transaction;
        return transactionDatabase.userDao.deleteUser();
      });
    }
  }
}
