import 'package:hive/hive.dart';
import 'package:mosques_teacher/src/features/auth/models/user.dart';
import 'user_adapter.dart';

class HiveSetup {
  static Future<void> registerAdaptersAndOpenBoxes() async {
    if (!Hive.isAdapterRegistered(UserAdapter.kTypeId)) {
      Hive.registerAdapter(UserAdapter());
    }
    await Hive.openBox<User>('user');
  }
}
