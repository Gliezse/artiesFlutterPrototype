import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        this.id,
        this.username,
        this.firstName,
        this.lastName,
        this.profilePic,
        this.email,
        this.country,
    });

    String id;
    String username;
    String firstName;
    String lastName;
    String profilePic;
    String email;
    String country;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        profilePic: json["profilePic"],
        email: json["email"],
        country: json["country"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "firstName": firstName,
        "lastName": lastName,
        "profilePic": profilePic,
        "email": email,
        "country": country,
    };
}
