import 'package:hive/hive.dart';
import '../../features/auth/models/user.dart';

class UserBox {
  Box<User> _box() => Hive.box<User>("user");

  Future<void> saveUser(User user) async {
    await _box().put("user", user);
  }

  Future<User?> readUser() async {
    return _box().get("user");
  }

  Future<void> clearUser() async {
    await _box().clear();
  }
}
