class UserModel {
  String name;
  String email;
  String phoneNumber;
  String? gender;
  DateTime? dateOfBirth;

  UserModel({
    required this.name,
    required this.email,
    required this.phoneNumber,
    this.gender,
    this.dateOfBirth,
  });
}