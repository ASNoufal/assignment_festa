// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modelData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ModelDataImpl _$$ModelDataImplFromJson(Map<String, dynamic> json) =>
    _$ModelDataImpl(
      gender: json['gender'] as String?,
      name: Name.fromJson(json['name'] as Map<String, dynamic>),
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      picture: Picture.fromJson(json['picture'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ModelDataImplToJson(_$ModelDataImpl instance) =>
    <String, dynamic>{
      'gender': instance.gender,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'picture': instance.picture,
    };

_$NameImpl _$$NameImplFromJson(Map<String, dynamic> json) => _$NameImpl(
      first: json['first'] as String?,
      last: json['last'] as String?,
    );

Map<String, dynamic> _$$NameImplToJson(_$NameImpl instance) =>
    <String, dynamic>{
      'first': instance.first,
      'last': instance.last,
    };

_$PictureImpl _$$PictureImplFromJson(Map<String, dynamic> json) =>
    _$PictureImpl(
      large: json['large'] as String?,
      medium: json['medium'] as String?,
      thumbnail: json['thumbnail'] as String?,
    );

Map<String, dynamic> _$$PictureImplToJson(_$PictureImpl instance) =>
    <String, dynamic>{
      'large': instance.large,
      'medium': instance.medium,
      'thumbnail': instance.thumbnail,
    };
