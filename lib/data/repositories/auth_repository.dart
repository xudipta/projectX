import 'package:firebase_auth/firebase_auth.dart';
class AuthRepository {
  final List<Map<String, String>> registeredUsers = [
    {'email': 'user@example.com', 'password': 'password123'},
  ];

  Future<void> signUp({required String email, required String password}) async {
    // Simulate a delay to mimic network latency
    await Future.delayed(Duration(seconds: 1));

    // Check if the provided credentials match any registered user
    final matchingUser = registeredUsers.firstWhere(
      (user) => user['email'] == email && user['password'] == password,
      orElse: () => <String, String>{},
    );

    if (matchingUser.isNotEmpty) {
      // Successful authentication
      print('Authentication successful for $email, $password');
    } else {
      // Failed authentication
      print('Authentication unsuccessful for $email, $password');
       throw Exception('Invalid email or password');
    }
  }
}
