// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerImpl _$$CustomerImplFromJson(Map<String, dynamic> json) =>
    _$CustomerImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      image: json['image'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      city: City.fromJson(json['city'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CustomerImplToJson(_$CustomerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'image': instance.image,
      'createdAt': instance.createdAt.toIso8601String(),
      'city': instance.city,
    };
