class User {
  const User({required this.token});
  final String token;

  static User get empty {
    return const User(token: 'none');
  }

  bool get isEmpty {
    return token == 'none';
  }

  @override
  String toString() {
    return "User token: $token";
  }
}
