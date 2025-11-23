import 'package:freezed_annotation/freezed_annotation.dart';

part 'shoppingitem.freezed.dart';
part 'shoppingitem.g.dart';

@freezed
sealed class Shoppingitem with _$Shoppingitem {
  const factory Shoppingitem({
    int? id,
    required String title,
    @Default(false) bool isCompleted,
  }) = _Shoppingitem;

  factory Shoppingitem.empty() => const Shoppingitem(
        id: null,
        title: '',
      );

  factory Shoppingitem.fromJson(Map<String, dynamic> json) => _$ShoppingitemFromJson(json);

  factory Shoppingitem.fromDocument(Map<String, dynamic> doc) {
    return Shoppingitem.fromJson(doc);
  }
}
