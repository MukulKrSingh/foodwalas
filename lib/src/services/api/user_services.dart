// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:foodwalas/src/mock_data/mock_data.dart';

import '../../../packages/user_package/barrel/user_repository_barrel.dart';

class UserServices {
  final String uid;
  UserServices({
    required this.uid,
  });

  //* Fetches User details
  Future<User?> fetchUserService() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );

    return  mockUser;
  }
}
