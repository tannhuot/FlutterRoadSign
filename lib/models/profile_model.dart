class ProfileModel {
  ProfileModel({
    this.data,
  });

  ProfileData? data;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        data: ProfileData.fromJson(json["data"]),
      );

  factory ProfileModel.withError() => ProfileModel(data: ProfileData());
  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class ProfileData {
  ProfileData({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}
