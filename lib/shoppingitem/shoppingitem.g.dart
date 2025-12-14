// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shoppingitem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Shoppingitem _$ShoppingitemFromJson(Map<String, dynamic> json) =>
    _Shoppingitem(
      id: (json['id'] as num?)?.toInt(),
      listId: (json['listId'] as num?)?.toInt(),
      title: json['title'] as String,
      quantity: (json['quantity'] as num?)?.toInt() ?? 1,
      isPurchased: json['isPurchased'] as bool? ?? false,
    );

Map<String, dynamic> _$ShoppingitemToJson(_Shoppingitem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'listId': instance.listId,
      'title': instance.title,
      'quantity': instance.quantity,
      'isPurchased': instance.isPurchased,
    };
