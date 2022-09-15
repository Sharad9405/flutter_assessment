import 'package:domain/error/app_error.dart';
import 'package:domain/model/base/error_info.dart';
import 'package:domain/utils/mapper/base_layer_data_transformer.dart';

abstract class BaseError extends BaseLayerDataTransformer<BaseError, AppError>
    implements Exception {
  final ErrorInfo error;
  final Exception cause;

  BaseError({required this.error, required this.cause});

  String getFriendlyMessage();

  logError() {}
}
