abstract class BaseModel<T> {
  int get id;
  Map<String, dynamic> toJson();
}
