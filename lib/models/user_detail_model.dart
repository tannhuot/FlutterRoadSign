class UserDetailModel {
  UserDetailModel({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  UserData? data;

  factory UserDetailModel.fromJson(Map<String, dynamic> json) =>
      UserDetailModel(
        status: json["status"],
        message: json["message"],
        data: UserData.fromMap(json["data"]),
      );

  factory UserDetailModel.withError(String error) => UserDetailModel(
        status: "error",
        message: error,
        data: UserData(),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class UserData {
  UserData({
    this.id = 0,
    this.firstName,
    this.lastName,
    this.email,
    this.profilePhoto,
    this.languageId,
    this.isLocationOn,
    this.isSoundOn,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? profilePhoto;
  int? languageId;
  bool? isLocationOn;
  bool? isSoundOn;

  factory UserData.fromMap(Map<String, dynamic> json) => UserData(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        profilePhoto: json["profile_photo"],
        languageId: json["language_id"],
        isLocationOn: json["is_location_on"],
        isSoundOn: json["is_sound_on"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "profile_photo": profilePhoto,
        "language_id": languageId,
        "is_location_on": isLocationOn,
        "is_sound_on": isSoundOn,
      };
}
