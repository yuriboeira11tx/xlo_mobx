enum UserType { PARTICULAR, PROFESSIONAL }

class User {
  String id;
  String name;
  String email;
  String phone;
  String password;
  UserType type;
  DateTime createdAt;

  User({this.id, this.name, this.email, this.phone, this.password, this.createdAt, this.type = UserType.PARTICULAR});

  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, phone: $phone, password: $password, type: $type, createdAt: $createdAt}';
  }
}