import 'dart:convert';

class DiseaseModel {
  String result;
  String? probability;
  String? image;
  String? description;

  DiseaseModel({
    required this.result,
    this.probability,
    this.image,
    this.description,
  });

  factory DiseaseModel.fromRawJson(String str) =>
      DiseaseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DiseaseModel.fromJson(Map<String, dynamic> json) => DiseaseModel(
        result: json["name"],
        probability: (json["probability"] ?? 0),
        image: json["image"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "name": result,
        "probability": probability ?? 0,
        "image": image,
        "description": description,
      };
}
