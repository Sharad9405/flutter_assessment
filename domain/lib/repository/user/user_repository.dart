import 'package:dartz/dartz.dart';
import 'package:domain/error/database_error.dart';
import 'package:domain/error/network_error.dart';
import 'package:domain/model/user/user.dart';

abstract class UserRepository {

  Future<Either<DatabaseError, Stream<User>>> listenCurrentUser();

  Future<Either<DatabaseError, User>> getCurrentUser();

  Future<Either<NetworkError, User>> getUserDetails();

  Future<Either<DatabaseError, User>> saveUser(User tokenUser);

  Future<Either<DatabaseError, bool>> logoutUser();


}
