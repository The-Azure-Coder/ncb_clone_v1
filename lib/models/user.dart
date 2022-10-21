class User {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String cellPhone;
  final String username;
  final int trn;
  final String idType;
  final String idNumber;
  final String ExpDate;

  const User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.cellPhone,
    required this.username,
    required this.trn,
    required this.idType,
    required this.idNumber,
    required this.ExpDate,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      password: json['password'],
      cellPhone: json['cellPhone'],
      username: json['username'],
      idType: json['idType'],
      trn: json['trn'],
      idNumber: json['idNumber'],
      ExpDate: json['ExpDate'],
    );
  }
}
