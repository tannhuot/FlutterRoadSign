class LoginModel {
  LoginModel({
    this.refresh,
    this.access,
    this.error,
  });

  String? refresh;
  String? access;
  String? error;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        refresh: json["refresh"],
        access: json["access"],
        error: json["detail"],
      );

  factory LoginModel.withError(String error) => LoginModel(error: error);

  Map<String, dynamic> toJson() => {
        "refresh": refresh,
        "access": access,
      };
}
