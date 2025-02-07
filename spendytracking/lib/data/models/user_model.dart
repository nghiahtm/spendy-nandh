class UserModel {
  String? name;
  String? avatar;
  String? userId;
  UserModel({this.avatar, this.name,this.userId});

  factory UserModel.fromJson (Map<String, dynamic> json){
    return UserModel(
      name: json['name'],
      avatar: json['avatar'],
      userId: json['id'],
    );
  }

  @override
  String toString() {
    return 'UserModel{name: $name, userId: $userId}';
  }

  Map<String, dynamic> toJson() {
    return {
      "id": userId,
      "avatar": avatar,
      "name":name
    };
  }
}
