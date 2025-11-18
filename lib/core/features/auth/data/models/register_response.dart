class RegisterResponse {
  final String userId;
  final String firstName;
  final String lastName;
  final String email;

  RegisterResponse({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      userId: json['userId']?.toString() ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
    );
  }
}
