class AccessToken {
  String token;

  AccessToken({ this.token });

  String get formattedToken => "Bearer $token";
}