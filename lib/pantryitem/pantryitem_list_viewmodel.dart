import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stokki/pantryitem/pantryitem.dart';
import 'package:stokki/pantryitem/pantryitem_repository.dart';

part 'pantryitem_list_viewmodel.g.dart';

@riverpod
class PantryItemListViewModel extends _$PantryItemListViewModel {
  @override
  Future<List<PantryItem>> build() async {
    return ref.watch(pantryitemRepositoryProvider).find();
  }

  Future<void> delete(PantryItem pantryitem) async {
    state = const AsyncValue.loading();
    await ref.read(pantryitemRepositoryProvider).delete(pantryitem.id!);
    ref.invalidateSelf();
  }
}
