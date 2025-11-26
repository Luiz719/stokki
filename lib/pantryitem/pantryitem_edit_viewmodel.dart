import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stokki/pantryitem/pantryitem.dart';
import 'package:stokki/pantryitem/pantryitem_repository.dart';

part 'pantryitem_edit_viewmodel.g.dart';

@riverpod
class PantryItemEditViewModel extends _$PantryItemEditViewModel {
  @override
  Future<PantryItem> build(int? pantryitemId) async {
    if (pantryitemId == null) {
      return Future.value(PantryItem.empty());
    } else {
      final pantryitem = await ref.read(pantryitemRepositoryProvider).findById(pantryitemId);
      if (pantryitem == null) {
        throw Exception('PantryItem not found');
      }
      return pantryitem;
    }
  }

  Future<void> updateState(PantryItem pantryitem) async {
    state = AsyncValue.data(pantryitem);
  }

  Future<void> save() async {
    state = const AsyncValue.loading();

    PantryItem pantryitem = state.requireValue;
    final pantryitemRepository = ref.read(pantryitemRepositoryProvider);
    if (pantryitem.id == null) {
      pantryitem = await pantryitemRepository.insert(pantryitem);
    } else {
      await pantryitemRepository.update(pantryitem.id!, pantryitem);
    }
    state = await AsyncValue.guard(() => Future.value(pantryitem));
  }
}
