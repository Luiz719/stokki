import 'package:freezed_annotation/freezed_annotation.dart';

part 'shoppingitem.freezed.dart';
part 'shoppingitem.g.dart';

@freezed
sealed class Shoppingitem with _$Shoppingitem {
  const factory Shoppingitem({
    int? id,
    int? listId,
    required String title,
    @Default(1) int quantity,
    @Default(false) bool isPurchased,
  }) = _Shoppingitem;

  factory Shoppingitem.empty() => const Shoppingitem(
        id: null,
        listId: null,
        title: '',
        quantity: 1,
        isPurchased: false,
      );

  factory Shoppingitem.fromJson(Map<String, dynamic> json) => _$ShoppingitemFromJson(json);

  factory Shoppingitem.fromDocument(Map<String, dynamic> doc) {
    return Shoppingitem.fromJson(doc);
  }
}
