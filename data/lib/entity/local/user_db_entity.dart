import 'package:data/db/floor/constants/database_tables.dart';
import 'package:domain/model/user/user.dart';
import 'package:domain/utils/mapper/base_layer_data_transformer.dart';
import 'package:floor/floor.dart';

@Entity(tableName: Table.USER, indices: [
  Index(value: ['userName'], unique: true)
])
class UserDBEntity extends BaseLayerDataTransformer<UserDBEntity, User> {
  @primaryKey
  String userName;
  String firstName;
  String middleName;
  String lastName;
  String profileUrl;
  String countryCode;
  String loginType;

  String accessToken;
  String refreshToken;

  bool isCurrent;
  bool isLoggedIn;

  UserDBEntity(
  { this.userName= '',
    this.firstName= '',
    this.middleName= '',
    this.lastName= '',
    this.profileUrl= '',
    this.countryCode= '',
    this.accessToken='',
    this.refreshToken='',
    this.loginType= '',
    this.isCurrent= false,
    this.isLoggedIn= false,
   });


  @override
  UserDBEntity restore(User data) {
        this.userName= data.userName ?? '';
        this.firstName= data.firstName ?? '';
        this.middleName= data.middleName ?? '';
        this.lastName= data.lastName ?? '';
        this.profileUrl= data.profileUrl ?? '';
        this.countryCode= data.countryCode ?? '';
        this.loginType= data.loginType ?? '';

        this.accessToken = data.accessToken ?? '';
        this.refreshToken= data.refreshToken ?? '';

        this.isCurrent= data.isCurrent;
        this.isLoggedIn= data.isLoggedIn;
    return this;
  }

  @override
  transform() {
    return User(
        userName: userName,
        firstName: firstName,
        middleName: middleName,
        lastName: lastName,
        profileUrl: profileUrl,
        countryCode: countryCode,
        loginType: loginType,
        accessToken: accessToken,
        refreshToken: refreshToken,
        isCurrent: isCurrent,
        isLoggedIn: isLoggedIn
    );
  }

}
