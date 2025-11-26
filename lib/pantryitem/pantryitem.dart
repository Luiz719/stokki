import 'package:freezed_annotation/freezed_annotation.dart';

part 'pantryitem.freezed.dart';
part 'pantryitem.g.dart';

@freezed
sealed class PantryItem with _$PantryItem {
  const factory PantryItem({
    int? id,
    required String title,
    required int quantity,
    DateTime ? expirationDate
  }) = _PantryItem;

  factory PantryItem.empty() => const PantryItem(
        id: null,
        title: '',
        quantity: 1,
        expirationDate: null,
      );

  factory PantryItem.fromJson(Map<String, dynamic> json) => _$PantryItemFromJson(json);

  factory PantryItem.fromDocument(Map<String, dynamic> doc) {
    return PantryItem.fromJson(doc);
  }
}
