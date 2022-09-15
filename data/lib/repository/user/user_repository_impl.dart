import 'package:dartz/dartz.dart';
import 'package:data/db/floor/utils/safe_db_call.dart';
import 'package:data/network/rest/api_interceptor.dart';
import 'package:data/source/user/user_data_sources.dart';
import 'package:dio/dio.dart';
import 'package:domain/error/database_error.dart';
import 'package:domain/error/network_error.dart';
import 'package:domain/model/user/user.dart';
import 'package:domain/repository/user/user_repository.dart';

/// user repository management class
class UserRepositoryImpl extends UserRepository {
  final UserRemoteDS _remoteDS;
  final UserLocalDS _localDS;
  final Dio _dio;

  UserRepositoryImpl(this._remoteDS, this._localDS, this._dio) {
    _dio.interceptors.add(ApiInterceptor(this, _dio));
  }


  @override
  Future<Either<DatabaseError, Stream<User>>> listenCurrentUser() async {
    final result = await safeDbCall(
      _localDS.listenCurrentUser(),
    );
    return result.fold(
      (l) {
        print("left error is ${l.cause}");
        return Left(l);
      },
      (r) {
        return Right(
          r.map(
            (currentUser) => currentUser!.transform(),
          ),
        );
      },
    );
  }

  @override
  Future<Either<DatabaseError, User>> getCurrentUser() async {
    final result = await safeDbCall(
      _localDS.getCurrentUser(),
    );
    return result.fold(
      (l) => Left(l),
      (r) => Right(r.transform()),
    );
  }

  @override
  Future<Either<NetworkError, User>> getUserDetails() {
    // TODO: implement getUserDetails
    throw UnimplementedError();
  }

  @override
  Future<Either<DatabaseError, bool>> logoutUser() {
    // TODO: implement logoutUser
    throw UnimplementedError();
  }

  @override
  Future<Either<DatabaseError, User>> saveUser(User tokenUser) {
    // TODO: implement saveUser
    throw UnimplementedError();
  }

}
