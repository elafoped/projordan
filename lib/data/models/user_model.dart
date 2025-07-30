class UserModel {
  final int id;
  final String fullName;
  final String email;
  final String phone;
  final String location;
  final bool isVerified;
  final DateTime joinDate;
  final String role;
  final int propertiesCount;

  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.location,
    required this.isVerified,
    required this.joinDate,
    required this.role,
    required this.propertiesCount,
  });
}
