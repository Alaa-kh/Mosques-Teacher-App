import 'package:hive/hive.dart';
import '../../features/auth/models/user.dart';

class UserAdapter extends TypeAdapter<User> {
  static const kTypeId = 2;
  @override
  final int typeId = kTypeId;
  @override
  User read(BinaryReader reader) {
    return User(
      id: reader.readString(),
      name: reader.readString(),
      email: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.name);
    writer.writeString(obj.email);
  }
}
