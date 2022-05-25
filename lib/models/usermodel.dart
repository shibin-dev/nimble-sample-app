import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());


class UserModel {
    UserModel({
        this.username,
        this.password,
    });

    String? username;
    String? password;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(

        username: json["username"],
        password: json["password"],

    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
  
    };
}

class Name {
    Name({
        this.title,
        this.first,
        this.last,
    });

    String? title;
    String? first;
    String? last;

    factory Name.fromJson(Map<String, dynamic> json) => Name(
        title: json["title"],
        first: json["first"],
        last: json["last"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "first": first,
        "last": last,
    };
}

class Picture {
    Picture({
        this.large,
        this.medium,
        this.thumbnail,
    });

    String? large;
    String? medium;
    String? thumbnail;

    factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        large: json["large"],
        medium: json["medium"],
        thumbnail: json["thumbnail"],
    );

    Map<String, dynamic> toJson() => {
        "large": large,
        "medium": medium,
        "thumbnail": thumbnail,
    };
}
