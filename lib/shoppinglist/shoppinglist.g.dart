// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shoppinglist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Shoppinglist _$ShoppinglistFromJson(Map<String, dynamic> json) =>
    _Shoppinglist(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String,
      isCompleted: json['isCompleted'] as bool? ?? false,
    );

Map<String, dynamic> _$ShoppinglistToJson(_Shoppinglist instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'isCompleted': instance.isCompleted,
    };
