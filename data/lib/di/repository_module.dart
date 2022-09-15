import 'package:data/di/local_module.dart';
import 'package:data/di/network_module.dart';
import 'package:data/repository/user/user_repository_impl.dart';
import 'package:domain/repository/user/user_repository.dart';
import 'package:riverpod/riverpod.dart';


var userRepoProvider = Provider<UserRepository>(
      (ref) => UserRepositoryImpl(ref.read(userRemoteDSProvider),
      ref.read(userLocalDSProvider), ref.read(dioProvider)),
);