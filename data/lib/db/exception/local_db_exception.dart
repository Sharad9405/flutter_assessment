
class LocalDbException implements Exception {
  final LocalDbExceptionType? localDbExceptionType;

  LocalDbException({this.localDbExceptionType});
}

class LocalDbExceptionType {
  final int _value;

  const LocalDbExceptionType._(this._value);

  int get value => _value;

  static const LocalDbExceptionType noUserFound = LocalDbExceptionType._(2);
  static const LocalDbExceptionType noBioMetricSupport = LocalDbExceptionType._(3);
  static const LocalDbExceptionType bioMetricFail = LocalDbExceptionType._(4);
  static const LocalDbExceptionType notificationFailed = LocalDbExceptionType._(4);
}
