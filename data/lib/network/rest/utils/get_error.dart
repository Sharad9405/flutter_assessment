import 'package:data/entity/remote/error/error_response_entity.dart';
import 'package:domain/error/network_error.dart';
import 'package:dio/src/response.dart';

NetworkError getError({Response? apiResponse}) {
  if (apiResponse?.data != null) {
    try {
      final ErrorResponseEntity? errorResponseEntity = ErrorResponseEntity.fromJson(apiResponse?.data);
      if (errorResponseEntity != null) {
        return NetworkError(
            httpError: apiResponse!.statusCode!,
            message: errorResponseEntity.message ?? 'NA',
            // message: errorResponseEntity.error.join(","),
            cause: Exception("Server Response Error"));
      } else {
        return NetworkError(
            httpError: apiResponse!.statusCode!,
            cause: Exception("Server Response Error"),
            message: apiResponse.statusMessage!);
      }
    } catch (exception) {
      // exception.printStackTrace();
      return NetworkError(
          cause: Exception("Server Response Error"),
          httpError: apiResponse!.statusCode!,
          message: apiResponse.statusMessage!);
    }
  } else {
    return NetworkError(
        cause: Exception(apiResponse?.statusMessage ?? "Server Response Error"),
        httpError: apiResponse?.statusCode ?? -1,
        message: apiResponse?.statusMessage ?? 'Something went wrong');
  }
}
