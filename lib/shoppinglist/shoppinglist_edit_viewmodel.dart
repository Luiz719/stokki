import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stokki/shoppinglist/shoppinglist.dart';
import 'package:stokki/shoppinglist/shoppinglist_repository.dart';

part 'shoppinglist_edit_viewmodel.g.dart';

@riverpod
class ShoppinglistEditViewModel extends _$ShoppinglistEditViewModel {
  @override
  Future<Shoppinglist> build(int? shoppinglistId) async {
    if (shoppinglistId == null) {
      return Future.value(Shoppinglist.empty());
    } else {
      final shoppinglist = await ref.read(shoppinglistRepositoryProvider).findById(shoppinglistId);
      if (shoppinglist == null) {
        throw Exception('Shoppinglist not found');
      }
      return shoppinglist;
    }
  }

  Future<void> updateState(Shoppinglist shoppinglist) async {
    state = AsyncValue.data(shoppinglist);
  }

  Future<void> save() async {
    state = const AsyncValue.loading();

    Shoppinglist shoppinglist = state.requireValue;
    final shoppinglistRepository = ref.read(shoppinglistRepositoryProvider);
    if (shoppinglist.id == null) {
      shoppinglist = await shoppinglistRepository.insert(shoppinglist);
    } else {
      await shoppinglistRepository.update(shoppinglist.id!, shoppinglist);
    }
    state = await AsyncValue.guard(() => Future.value(shoppinglist));
  }
}
