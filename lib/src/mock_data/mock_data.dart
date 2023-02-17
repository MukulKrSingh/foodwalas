import 'package:foodwalas/packages/user_package/barrel/user_repository_barrel.dart';

const Map<String, dynamic> mockLoginUserResponse = {
  'username': 'TEST_USER',
  'uid': 'USER_ID',
  'avatar_url': 'AVATAR_URL',
  'data':{} 
};

const String mockLogoutResponse = 'success';

const String mockSignUpUserResponse = 'success';

const User mockUser = User(
  username: 'TESTUSER',
  uid: 'USER_ID',
  avatar_url: 'AVATAR_URL',
);
