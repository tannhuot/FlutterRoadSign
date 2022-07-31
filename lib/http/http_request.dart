import 'package:dio/dio.dart';
import 'package:mit_final_project/models/login_model.dart';
import 'package:mit_final_project/models/profile_model.dart';

// import '../models/user_detail_model.dart';

class HttpRequest {
  // static const String mainUrl = "https://0064-96-9-66-88.ap.ngrok.io"
  static const String mainUrl = "https://reqres.in";
  static final Dio dio = Dio();

  /*
  // Get Genres
  static Future<UserDetailModel> getUserDetail(String id) async {
    try {
      Response response = await dio.get("$mainUrl/api/user/$id");
      return UserDetailModel.fromJson(response.data);
    } catch (error) {
      return UserDetailModel.withError("$error");
    }
  }
  */

  // Login
  static Future<LoginModel> login(String email, String password) async {
    try {
      var params = {"email": email, "password": password};
      Response response = await dio.post("$mainUrl/api/login", data: params);
      return LoginModel.fromJson(response.data);
    } catch (error) {
      return LoginModel.withError("$error");
    }
  }

  // Get profile
  static Future<ProfileModel> getProfile(String id) async {
    try {
      Response response = await dio.get("$mainUrl/api/users/$id");
      return ProfileModel.fromJson(response.data);
    } catch (error) {
      return ProfileModel.withError();
    }
  }
}
