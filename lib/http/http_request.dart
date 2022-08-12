import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mit_final_project/models/traffic_sign_model.dart';

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
  static Future<ProfileModel> getProfile() async {
    try {
      var token = LoginModel.fromJson(await SharedPref.shared.read("token"));
      dio.options.headers = {"Authorization": "Bearer ${token.access}"};
      Response response = await dio.get("$mainUrl/api/user/profile/");
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
    XFile? profilePhoto,
  }) async {
    try {
      var token = LoginModel.fromJson(await SharedPref.shared.read("token"));
      var profileLoad =
          ProfileModel.fromJson(await SharedPref.shared.read("profile"));

      final bytes = await profilePhoto?.readAsBytes();
      final String strImg;
      if (bytes != null) {
        strImg = "data:image/jpeg;base64,${base64Encode(bytes)}";
      } else {
        strImg = "";
      }
      var formData = {
        "id": profileLoad.data?.id ?? 0,
        "first_name": firstName,
        "last_name": lastName,
        "profile_photo": strImg
      };

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
    required int languageId,
    required bool isLocationOn,
    required bool isSoundOn,
  }) async {
    try {
      var token = LoginModel.fromJson(await SharedPref.shared.read("token"));
      var profileLoad =
          ProfileModel.fromJson(await SharedPref.shared.read("profile"));

      var params = {
        "id": profileLoad.data?.id ?? 0,
        "language_id": languageId,
        "is_location_on": isLocationOn,
        "is_sound_on": isSoundOn
      };
      print(params);
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

  // Traffic Sign
  static Future<TrafficSignModel> getTrafficSign() async {
    try {
      var token = LoginModel.fromJson(await SharedPref.shared.read("token"));
      dio.options.headers = {"Authorization": "Bearer ${token.access}"};
      Response response = await dio.get("$mainUrl/api/sign/list/");
      if (kDebugMode) {
        print(response);
      }
      return TrafficSignModel.fromJson(response.data);
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
      return TrafficSignModel();
    }
  }
}
