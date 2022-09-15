
import 'package:data/db/floor/database_properties.dart';
import 'package:data/db/floor/floor_db_service.dart';
import 'package:data/di/network_module.dart';
import 'package:data/repository/user/user_repository_impl.dart';
import 'package:data/source/user/local/user_local_ds_impl.dart';
import 'package:data/source/user/user_data_sources.dart';
import 'package:device_info/device_info.dart';
import 'package:domain/repository/user/user_repository.dart';
import 'package:riverpod/riverpod.dart';

final floorAppDatabase = Provider<FloorDbService>(
      (ref) => FloorDbService(
    DatabaseProperties.DB_NAME,
  ),
);

var deviceInfoPluginProvider = Provider<DeviceInfoPlugin>(
  (ref) => DeviceInfoPlugin(),
);

var userRepoProvider = Provider<UserRepository>(
      (ref) => UserRepositoryImpl(ref.read(userRemoteDSProvider),
      ref.read(userLocalDSProvider), ref.read(dioProvider)),
);


var userLocalDSProvider = Provider<UserLocalDS>(
      (ref) => UserLocalDSImpl(
    ref.read(floorAppDatabase),
  ),
);

