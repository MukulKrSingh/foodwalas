import 'package:foodwalas/packages/user_package/lib/models/user_model.dart';
import 'package:foodwalas/src/mock_data/mock_data.dart';

class UserRepository {
  User? _user;

  User? getUser() {
    if (_user == null) {
      return mockUser;
    } else {
      return _user;
    }
  }
}
