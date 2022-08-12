class TrafficSignModel {
  String? status;
  String? message;
  List<Data>? data;

  TrafficSignModel({this.status, this.message, this.data});

  TrafficSignModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  factory TrafficSignModel.withError(String error) => TrafficSignModel(
        status: "error",
        message: error,
        data: [],
      );
}

class Data {
  String? id;
  String? image;
  String? nameKh;
  String? nameEn;

  Data({this.id, this.image, this.nameKh, this.nameEn});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    nameKh = json['name_kh'];
    nameEn = json['name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['name_kh'] = this.nameKh;
    data['name_en'] = this.nameEn;
    return data;
  }
}
