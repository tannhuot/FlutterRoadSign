import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

import '../helper/sharepreference.dart';
import '../models/login_model.dart';
import '../models/profile_model.dart';

class HttpRequest {
  // static const String mainUrl = "https://0064-96-9-66-88.ap.ngrok.io"
  static const String mainUrl =
      "https://traffic-sign-dection-api.herokuapp.com";
  static final Dio dio = Dio();

  // Sign Up
  static Future<ProfileModel> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    var params = {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "password": password,
    };

    try {
      Response response = await dio.post(
        "$mainUrl/api/user/register/",
        data: params,
      );
      if (kDebugMode) {
        print(response);
      }
      return ProfileModel.fromJson(response.data);
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      return ProfileModel.withError("$error");
    }
  }

  // Sign In
  static Future<LoginModel> signIn(
      {required String email, required String password}) async {
    var params = {"email": email, "password": password};
    try {
      Response response = await dio.post("$mainUrl/api/token/", data: params);
      if (kDebugMode) {
        print(response);
      }
      return LoginModel.fromJson(response.data);
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      return LoginModel.withError("$error");
    }
  }

  // User Detail
  static Future<ProfileModel> getProfile(String id) async {
    try {
      var token = LoginModel.fromJson(await SharedPref.shared.read("token"));
      dio.options.headers = {"Authorization": "Bearer ${token.access}"};
      Response response = await dio.get("$mainUrl/api/user/$id/");
      if (kDebugMode) {
        print(response);
      }
      return ProfileModel.fromJson(response.data);
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      return ProfileModel.withError("$error");
    }
  }

  // Update User Detail
  static Future<ProfileModel> updateProfile({
    required String firstName,
    required String lastName,
    required XFile profilePhoto,
  }) async {
    try {
      var token = LoginModel.fromJson(await SharedPref.shared.read("token"));
      var profileLoad =
          ProfileModel.fromJson(await SharedPref.shared.read("profile"));

      var formData = FormData.fromMap({
        "id": profileLoad.data?.id.toString(),
        "first_name": firstName,
        "last_name": lastName,
        "profile_photo": await MultipartFile.fromFile(profilePhoto.path,
            filename: profilePhoto.name)
      });

      dio.options.headers = {"Authorization": "Bearer ${token.access}"};
      Response response =
          await dio.post("$mainUrl/api/user/profile/update/", data: formData);
      if (kDebugMode) {
        print(response);
      }
      return ProfileModel.fromJson(response.data);
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      return ProfileModel.withError("$error");
    }
  }

  // Update setting
  static Future<ProfileModel> updateSetting({
    required int id,
    required int languageId,
    required bool isLocationOn,
    required bool isSoundOn,
  }) async {
    try {
      var token = LoginModel.fromJson(await SharedPref.shared.read("token"));
      var params = {
        "id": id,
        "language_id": languageId,
        "is_location_on": isLocationOn,
        "is_sound_on": isSoundOn
      };

      dio.options.headers = {"Authorization": "Bearer ${token.access}"};
      Response response =
          await dio.post("$mainUrl/api/user/setting/update/", data: params);
      if (kDebugMode) {
        print(response);
      }
      return ProfileModel.fromJson(response.data);
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      return ProfileModel.withError("$error");
    }
  }
}
