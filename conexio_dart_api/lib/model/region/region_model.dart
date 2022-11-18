// To parse this JSON data, do
//
//     final regionModel = regionModelFromJson(jsonString);
/*
import 'dart:convert';

RegionModel regionModelFromJson(String str) => RegionModel.fromJson(json.decode(str));

String regionModelToJson(RegionModel data) => json.encode(data.toJson());

class RegionModel {
    RegionModel({
        required this.nameRegion,
    });

    String nameRegion;

    factory RegionModel.fromJson(Map<String, dynamic> json) => RegionModel(
        nameRegion: json["nameRegion"],
    );

    Map<String, dynamic> toJson() => {
        "nameRegion": nameRegion,
    };
}*/

class RegionModel {
  String? nameRegion;

  RegionModel({this.nameRegion});

  RegionModel.fromJson(Map<String, dynamic> json) {
    nameRegion = json['nameRegion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nameRegion'] = this.nameRegion;
    return data;
  }
}
