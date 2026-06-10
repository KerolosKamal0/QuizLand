enum UserRole { student, teacher }

extension UserRoleExtension on UserRole {
  static UserRole? fromString(String? value) {
    switch (value) {
      case 'student':
        return UserRole.student;
      case 'teacher':
        return UserRole.teacher;
      default:
        return null;
    }
  }

  String get value => name;
}

class UserModel {
  final String id;
  final String name;
  final String email;
  final String? avatarUrl;
  final UserRole? userRole;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.userRole,
    this.avatarUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'] as String,
    name: json['name'] as String? ?? '',
    email: json['email'] as String,
    avatarUrl: json['avatar_url'] as String?,
    // userRole: json['user_role'] as UserRole?,
    userRole: UserRoleExtension.fromString(json['user_role'] as String?),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'avatar_url': avatarUrl,
    'user_role': userRole?.value,
  };

  UserModel copyWith({
    String? name,
    String? email,
    String? avatarUrl,
    UserRole? userRole,
  }) => UserModel(
    id: id,
    name: name ?? this.name,
    email: email ?? this.email,
    avatarUrl: avatarUrl ?? this.avatarUrl,
    userRole: userRole ?? this.userRole,
  );
}
