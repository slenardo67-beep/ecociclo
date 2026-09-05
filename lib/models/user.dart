import 'package:uuid/uuid.dart';

enum UserRole { generator, evaluator }

class User {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String? residenceId;
  final String passwordHash;
  final UserRole role;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? cooperativeId;
  final String? unitId;
  final String? evaluatorCode;
  final String? credentialStatus;

  User({
    String? id,
    required this.name,
    required this.email,
    required this.phone,
    this.residenceId,
    required this.passwordHash,
    required this.role,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.cooperativeId,
    this.unitId,
    this.evaluatorCode,
    this.credentialStatus,
  })
      : id = id ?? const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'residenceId': residenceId,
        'passwordHash': passwordHash,
        'role': role.toString(),
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
        'cooperativeId': cooperativeId,
        'unitId': unitId,
        'evaluatorCode': evaluatorCode,
        'credentialStatus': credentialStatus,
      };

  static User fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      residenceId: json['residenceId'],
      passwordHash: json['passwordHash'],
      role: json['role'] == 'UserRole.generator'
          ? UserRole.generator
          : UserRole.evaluator,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      cooperativeId: json['cooperativeId'],
      unitId: json['unitId'],
      evaluatorCode: json['evaluatorCode'],
      credentialStatus: json['credentialStatus'],
    );
  }
}
