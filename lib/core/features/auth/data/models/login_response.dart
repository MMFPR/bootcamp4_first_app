class LoginResponse {
  final String firstName;
  final String lastName;

  const LoginResponse({required this.firstName, required this.lastName});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      firstName: json['firstName']?.toString() ?? '',
      lastName: json['lastName']?.toString() ?? '',
    );
  }
}
