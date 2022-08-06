class ProfileModel {
  ProfileModel({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  ProfileData? data;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        status: json["status"],
        message: json["message"],
        data: ProfileData.fromJson(json["data"]),
      );

  factory ProfileModel.withError(String error) => ProfileModel(
        status: "error",
        message: error,
        data: ProfileData(),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class ProfileData {
  ProfileData({
    this.id,
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

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
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
