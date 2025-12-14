import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stokki/shoppinglist/shoppinglist.dart';
import 'package:stokki/shoppinglist/shoppinglist_repository.dart';

part 'shoppinglist_list_viewmodel.g.dart';

@riverpod
class ShoppinglistListViewModel extends _$ShoppinglistListViewModel {
  @override
  Future<List<Shoppinglist>> build() async {
    return ref.watch(shoppinglistRepositoryProvider).find();
  }

  Future<void> addList(String name) async {
    final repository = ref.read(shoppinglistRepositoryProvider);
    // Otimistic Update ou Reload: aqui faremos reload simples para garantir consistência
    await repository.createList(name);
    ref.invalidateSelf(); // Força recarregar a lista
  }

  Future<void> delete(Shoppinglist shoppinglist) async {
    state = const AsyncValue.loading();
    await ref.read(shoppinglistRepositoryProvider).delete(shoppinglist.id!);
    ref.invalidateSelf();
  }

  Future<void> save(Shoppinglist shoppinglist) async {
    state = const AsyncValue.loading();
    final shoppinglistRepository = ref.read(shoppinglistRepositoryProvider);
    if (shoppinglist.id == null) {
      shoppinglist = await shoppinglistRepository.insert(shoppinglist);
    } else {
      await shoppinglistRepository.update(shoppinglist.id!, shoppinglist);
    }
    ref.invalidateSelf();
  }
}
  
