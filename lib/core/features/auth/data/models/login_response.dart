class LoginResponse {
  final String firstName;
  final String email;
  const LoginResponse({required this.firstName, required this.email});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      firstName: json['firstName']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
    );
  }
}