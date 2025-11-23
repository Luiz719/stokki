import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stokki/shoppingitem/shoppingitem.dart';
import 'package:stokki/shoppingitem/shoppingitem_repository.dart';

part 'shoppingitem_list_viewmodel.g.dart';

@riverpod
class ShoppingitemListViewModel extends _$ShoppingitemListViewModel {
  @override
  Future<List<Shoppingitem>> build() async {
    return ref.watch(shoppingitemRepositoryProvider).find();
  }

  Future<void> delete(Shoppingitem shoppingitem) async {
    state = const AsyncValue.loading();
    await ref.read(shoppingitemRepositoryProvider).delete(shoppingitem.id!);
    ref.invalidateSelf();
  }
}
