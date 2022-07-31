class LoginModel {
  LoginModel({
    this.token,
  });

  String? token;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        token: json["token"],
      );

  factory LoginModel.withError(String error) => LoginModel(token: "");

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
