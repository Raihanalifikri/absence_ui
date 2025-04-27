import 'package:meta/meta.dart';
import 'dart:convert';

class AuthResponseModel {
    final String message;
    final String accessToken;
    final User user;

    AuthResponseModel({
        required this.message,
        required this.accessToken,
        required this.user,
    });

    factory AuthResponseModel.fromJson(String str) => AuthResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AuthResponseModel.fromMap(Map<String, dynamic> json) => AuthResponseModel(
        message: json["message"],
        accessToken: json["access_token"],
        user: User.fromMap(json["user"]),
    );

    Map<String, dynamic> toMap() => {
        "message": message,
        "access_token": accessToken,
        "user": user.toMap(),
    };
}

class User {
    final int id;
    final String name;
    final String position;
    final String departement;
    final String faceEmbedded;
    final dynamic imageUrl;
    final String email;
    final DateTime createdAt;
    final DateTime updatedAt;

    User({
        required this.id,
        required this.name,
        required this.position,
        required this.departement,
        required this.faceEmbedded,
        required this.imageUrl,
        required this.email,
        required this.createdAt,
        required this.updatedAt,
    });

    factory User.fromJson(String str) => User.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        position: json["position"],
        departement: json["departement"],
        faceEmbedded: json["face_embedded"],
        imageUrl: json["image_url"],
        email: json["email"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "position": position,
        "departement": departement,
        "face_embedded": faceEmbedded,
        "image_url": imageUrl,
        "email": email,

        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
