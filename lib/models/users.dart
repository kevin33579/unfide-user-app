part of 'models.dart';

class Users extends Equatable {
  final String uid;
  final String name;
  final String phone;
  final String email;
  final String password;
  final String createdAt;
  final String updatedAt;
  final String role;

  Users(this.uid, this.name, this.phone, this.email, this.password,
      this.createdAt, this.updatedAt, this.role);

  @override
  List<Object> get props => [
        uid,
        name,
        phone,
        email,
        password,
        createdAt,
        updatedAt,
        role,
      ];
}
