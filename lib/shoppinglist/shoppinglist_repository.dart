import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:stokki/supabase_provider.dart';
import 'package:stokki/shoppinglist/shoppinglist.dart';

part 'shoppinglist_repository.g.dart';

class ShoppinglistRepository {
  final SupabaseClient _supabase;

  ShoppinglistRepository(this._supabase);

  Future<Shoppinglist?> findById(int id) async {
    final results = await _supabase.from('ShoppingList').select().eq('id', id);
    if (results.isEmpty) {
      return Future.value(null);
    }
    return Shoppinglist.fromDocument(results.first);
  }

  Future<List<Shoppinglist>> find() async {
    final results = await _supabase.from('ShoppingList').select().order('created_at');
    return results.map((doc) => Shoppinglist.fromDocument(doc)).toList();
  }

  Future<Shoppinglist> insert(Shoppinglist shoppinglist) async {
    final shoppinglistData = shoppinglist.toJson()..remove('id');
    final results = await _supabase.from('ShoppingList').insert(shoppinglistData).select();
    return Shoppinglist.fromDocument(results.first);
  }

  Future<void> update(int id, Shoppinglist shoppinglist) async {
    final shoppinglistData = shoppinglist.toJson()..remove('id');
    await _supabase.from('ShoppingList').update(shoppinglistData).eq('id', id);
  }

  Future<void> delete(int id) async {
    await _supabase.from('ShoppingList').delete().eq('id', id);
  }

  Future<Shoppinglist> createList(String name) async {
    final response = await _supabase
        .from('ShoppingList')
        .insert({'title': name})
        .select()
        .single();
    return Shoppinglist.fromJson(response);
  }

}

@riverpod
ShoppinglistRepository shoppinglistRepository(Ref ref) {
  final supabase = ref.watch(supabaseProvider);
  return ShoppinglistRepository(supabase);
}
