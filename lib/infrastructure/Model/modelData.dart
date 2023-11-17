import 'package:freezed_annotation/freezed_annotation.dart';

part 'modelData.freezed.dart';
part 'modelData.g.dart';

@freezed
class ModelData with _$ModelData {
  const factory ModelData({
    required String? gender,
    required Name name,
    required String? email,
    required String? phone,
    required Picture picture, // Added Picture property
  }) = _ModelData;

  factory ModelData.fromJson(Map<String, dynamic> json) =>
      _$ModelDataFromJson(json);
}

@freezed
class Name with _$Name {
  const factory Name({
    required String? first,
    required String? last,
  }) = _Name;

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);
}

@freezed
class Picture with _$Picture {
  const factory Picture({
    required String? large,
    required String? medium,
    required String? thumbnail,
  }) = _Picture;

  factory Picture.fromJson(Map<String, dynamic> json) =>
      _$PictureFromJson(json);
}
