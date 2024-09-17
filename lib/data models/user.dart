class UserModel {
  String? email;
  String? username;
  String? role;
  String? approved;

// receiving data
  UserModel({this.username, this.email, this.role, this.approved});
  factory UserModel.fromMap(map) {
    return UserModel(
      username: map['uid'],
      email: map['email'],
      role: map['role'],
      approved: map['approved'],
    );
  }
// sending data
  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'role': role,
      'approved': approved,
    };
  }
}