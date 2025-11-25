import 'package:freezed_annotation/freezed_annotation.dart';

part 'shoppinglist.freezed.dart';
part 'shoppinglist.g.dart';

@freezed
sealed class Shoppinglist with _$Shoppinglist {
  const factory Shoppinglist({
    int? id,
    required String title,
    @Default(false) bool isCompleted,
  }) = _Shoppinglist;

  factory Shoppinglist.empty() => const Shoppinglist(
        id: null,
        title: '',
        isCompleted: false
      );

  factory Shoppinglist.fromJson(Map<String, dynamic> json) => _$ShoppinglistFromJson(json);

  factory Shoppinglist.fromDocument(Map<String, dynamic> doc) {
    return Shoppinglist.fromJson(doc);
  }
}
