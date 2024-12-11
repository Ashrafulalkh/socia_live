class UserModel {
  final String uuid;
  final DateTime createdAt;
  final String email;
  final String userName;
  final String phoneNumber;
  final String profilePhoto;

  UserModel({
    required this.uuid,
    required this.createdAt,
    required this.email,
    required this.userName,
    required this.phoneNumber,
    required this.profilePhoto,
  });

  // Factory constructor to create a User object from a JSON map
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uuid: json['uuid'] ?? '', // Provide a default empty string
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(), // Default to current time
      email: json['email'] ?? '',
      userName: json['user_name'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      profilePhoto: json['profile_photo'] ?? '',
    );
  }
}
