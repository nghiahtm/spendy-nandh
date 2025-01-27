class UserModel {
  String? name;
  String? avatar;
  String? userId;
  UserModel({this.avatar, this.name,this.userId});

  Map<String, dynamic> toJson() {
    return {
      "id": userId,
      "avatar": avatar,
      "name":name
    };
  }
}
