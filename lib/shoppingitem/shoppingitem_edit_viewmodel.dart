import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stokki/shoppingitem/shoppingitem.dart';
import 'package:stokki/shoppingitem/shoppingitem_repository.dart';

part 'shoppingitem_edit_viewmodel.g.dart';

@riverpod
class ShoppingitemEditViewModel extends _$ShoppingitemEditViewModel {
  @override
  Future<Shoppingitem> build(int? shoppingitemId) async {
    if (shoppingitemId == null) {
      return Future.value(Shoppingitem.empty());
    } else {
      final shoppingitem = await ref.read(shoppingitemRepositoryProvider).findById(shoppingitemId);
      if (shoppingitem == null) {
        throw Exception('Shoppingitem not found');
      }
      return shoppingitem;
    }
  }

  Future<void> updateState(Shoppingitem shoppingitem) async {
    state = AsyncValue.data(shoppingitem);
  }

  Future<void> save() async {
    state = const AsyncValue.loading();

    Shoppingitem shoppingitem = state.requireValue;
    final shoppingitemRepository = ref.read(shoppingitemRepositoryProvider);
    if (shoppingitem.id == null) {
      shoppingitem = await shoppingitemRepository.insert(shoppingitem);
    } else {
      await shoppingitemRepository.update(shoppingitem.id!, shoppingitem);
    }
    state = await AsyncValue.guard(() => Future.value(shoppingitem));
  }
}
