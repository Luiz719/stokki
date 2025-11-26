// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pantryitem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PantryItem _$PantryItemFromJson(Map<String, dynamic> json) => _PantryItem(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String,
  quantity: (json['quantity'] as num).toInt(),
  expirationDate: json['expirationDate'] == null
      ? null
      : DateTime.parse(json['expirationDate'] as String),
);

Map<String, dynamic> _$PantryItemToJson(_PantryItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'quantity': instance.quantity,
      'expirationDate': instance.expirationDate?.toIso8601String(),
    };
