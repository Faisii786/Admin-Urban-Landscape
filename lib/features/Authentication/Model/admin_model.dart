class AdminModel {
  String? id;
  String? name;
  String? email;
  String? password;
  String? role;
  String? profilePic;
  String? gender;
  String? phoneNumber;
  String? dateOfBirth;
  String? status;
  bool? isOnline;
  String? lastActive;
  String? pushToken;
  String? createdAt;

  AdminModel({
    this.id = '',
    this.name = '',
    this.email = '',
    this.password = '',
    this.role = 'admin',
    this.profilePic = '',
    this.gender = '',
    this.phoneNumber = '',
    this.dateOfBirth = '',
    this.status = '',
    this.isOnline = false,
    this.lastActive = '',
    this.pushToken = '',
    this.createdAt = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'role': role,
      'profilePic': profilePic,
      'gender': gender,
      'phoneNumber': phoneNumber,
      'dateOfBirth': dateOfBirth,
      'status': status,
      'isOnline': isOnline,
      'lastActive': lastActive,
      'pushToken': pushToken,
      'createdAt':
          createdAt ?? DateTime.now().millisecondsSinceEpoch.toString(),
    };
  }

  factory AdminModel.fromMap(Map<String, dynamic> map) {
    return AdminModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      role: map['role'] ?? 'admin',
      profilePic: map['profilePic'] ?? '',
      gender: map['gender'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      dateOfBirth: map['dateOfBirth'] ?? '',
      status: map['status'] ?? '',
      isOnline: map['isOnline'] ?? false,
      lastActive: map['lastActive'] ?? '',
      pushToken: map['pushToken'] ?? '',
      createdAt:
          map['createdAt'] ?? DateTime.now().millisecondsSinceEpoch.toString(),
    );
  }
}
