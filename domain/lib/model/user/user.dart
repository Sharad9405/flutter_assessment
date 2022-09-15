
class User {

  final String? userName;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? profileUrl;
  final String? countryCode;
  final String? loginType;
  String? accessToken;
  String? refreshToken;

  final bool isCurrent;
  bool isLoggedIn;

  User({this.userName, this.firstName, this.middleName, this.lastName, this.profileUrl, this.countryCode, this.loginType,
    this.accessToken, this.refreshToken,this.isCurrent=false, this.isLoggedIn=false});



}
