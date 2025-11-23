// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shoppingitem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Shoppingitem _$ShoppingitemFromJson(Map<String, dynamic> json) =>
    _Shoppingitem(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String,
      isCompleted: json['isCompleted'] as bool? ?? false,
    );

Map<String, dynamic> _$ShoppingitemToJson(_Shoppingitem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'isCompleted': instance.isCompleted,
    };
