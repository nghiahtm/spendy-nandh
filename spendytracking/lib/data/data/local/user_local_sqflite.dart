import 'package:spendytracking/core/helpers/local/sqflite_helper.dart';
import 'package:spendytracking/data/models/user_model.dart';

class UserSqflite {
  final SQFLiteHelper sqfLiteHelper;
  static const String _tbUser = "user";
  UserSqflite({required this.sqfLiteHelper});

  Future createUser() async {
    await sqfLiteHelper.create(table: _tbUser, createQueryTable: '''
    id integer primary key autoincrement, 
    name text not null,
    avatar text,
    userId text not null
   ''');
  }

  Future<int> insertUser(UserModel user) async {
    return await sqfLiteHelper.add(table: _tbUser, t: user);
  }

  Future<UserModel?> getUser(int idLocal) async {
    return await sqfLiteHelper.getById(
        table: _tbUser, id: idLocal, fromJson: UserModel.fromJson);
  }
}
