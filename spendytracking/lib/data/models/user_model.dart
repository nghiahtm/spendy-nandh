import 'package:spendytracking/data/models/base_model.dart';

class UserModel extends BaseModel<UserModel> {
  String? name;
  String? avatar;
  String? userId;
  int idLocal;
  UserModel({this.avatar, this.name, this.userId, this.idLocal = 0});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      avatar: json['avatar'],
      userId: json['userId'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "avatar": avatar,
      "name": name,
      "id": idLocal
    };
  }

  @override
  // TODO: implement id
  int get id => idLocal;

  @override
  String toString() {
    return 'UserModel{name: $name, userId: $userId, avatar: $avatar, id: $idLocal}';
  }

}
